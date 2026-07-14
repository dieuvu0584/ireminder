import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/utils/recurrence_calculator.dart';
import '../../../core/utils/reminder_occurrence_builder.dart';
import '../../../data/database/app_database.dart';
import '../../../domain/enums/recurrence_type.dart';
import '../../../domain/models/daily_exclusion.dart';
import '../../../domain/models/recurrence_params.dart';
import '../../../domain/models/reminder_occurrence.dart';
import '../../providers/calendar_providers.dart';
import '../../providers/category_providers.dart';
import '../../providers/reminder_providers.dart';
import '../../providers/settings_providers.dart';
import '../../widgets/guarded_action.dart';
import '../../widgets/month_calendar_grid.dart';
import '../reminders/reminder_detail_screen.dart';
import '../../widgets/reminder_card.dart';

class CalendarView extends ConsumerStatefulWidget {
  const CalendarView({super.key});

  @override
  ConsumerState<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends ConsumerState<CalendarView> {
  late DateTime _visibleMonth;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _visibleMonth = DateTime(now.year, now.month);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // Includes inactive (completed one-off) reminders, unlike the Today
    // tab's activeRemindersStreamProvider — a past day shouldn't lose what
    // was scheduled on it just because it's since been completed.
    final remindersAsync = ref.watch(allRemindersStreamProvider);
    final completedLogsAsync = ref.watch(completedReminderLogsStreamProvider);
    final skippedLogsAsync = ref.watch(skippedReminderLogsStreamProvider);
    final categoriesAsync = ref.watch(categoriesStreamProvider);
    // Shared with HomeScreen's "+" FAB, so creating a reminder while
    // browsing a different day here pre-fills that day as the reminder's
    // start date instead of always defaulting to today.
    final selectedDay = ref.watch(selectedCalendarDayProvider);
    final snoozeMinutes =
        ref.watch(settingsStreamProvider).valueOrNull?.snoozeDurationMinutes ??
        60;

    return remindersAsync.when(
      data: (reminders) {
        final categories = categoriesAsync.valueOrNull ?? const <Category>[];
        final byId = {for (final c in categories) c.id: c};

        final byDay = buildOccurrencesByDay(
          reminders: reminders,
          completedLogs: completedLogsAsync.valueOrNull ?? const [],
          skippedLogs: skippedLogsAsync.valueOrNull ?? const [],
        );

        // The DB only stores the single nearest upcoming occurrence, so
        // browsing to a different year would otherwise show nothing for a
        // yearly/lunar-yearly reminder that already has its next occurrence
        // recorded for this year (or a past one). Project it onto whichever
        // year is currently visible too — on top of whatever
        // buildOccurrencesByDay already produced, calendar-browsing-specific
        // and not needed by the Today tab, which only ever cares about now.
        for (final r in reminders) {
          final type = RecurrenceType.fromDbValue(r.recurrenceType);
          if (r.snoozeUntil != null ||
              (type != RecurrenceType.yearly &&
                  type != RecurrenceType.lunarYearly)) {
            continue;
          }
          final projected = occurrenceInYear(
            RecurrenceParams(
              type: type,
              day: r.recurrenceDay,
              month: r.recurrenceMonth,
            ),
            _visibleMonth.year,
          );
          if (projected == null) continue;
          final projKey = DateTime(
            projected.year,
            projected.month,
            projected.day,
          );
          // Skip if this reminder already has an entry on that day —
          // either it's the one live occurrence buildOccurrencesByDay
          // already plotted at next_due_date, or a past completion/skip
          // log landed on the exact same day/month (fully possible for a
          // fixed yearly date) — either way, adding a second entry here
          // would show as a duplicate card.
          if ((byDay[projKey] ?? const []).any((o) => o.reminder.id == r.id)) {
            continue;
          }
          final done =
              !r.isActive &&
              (completedLogsAsync.valueOrNull ?? const []).any(
                (log) => log.reminderId == r.id,
              );
          byDay
              .putIfAbsent(projKey, () => [])
              .add(
                ReminderOccurrence(r, completed: done, historical: !r.isActive),
              );
        }

        // Same idea as the yearly/lunar-yearly projection above, but for
        // monthly/lunar-monthly reminders projected onto whichever month
        // is currently browsed — the DB only stores the single nearest
        // upcoming occurrence, so month N+2's occurrence never otherwise
        // shows up until month N+1's has actually come and gone.
        for (final r in reminders) {
          final type = RecurrenceType.fromDbValue(r.recurrenceType);
          if (r.snoozeUntil != null ||
              (type != RecurrenceType.monthly &&
                  type != RecurrenceType.lunarMonthly)) {
            continue;
          }
          final occurrences = occurrencesInMonth(
            RecurrenceParams(type: type, day: r.recurrenceDay),
            _visibleMonth,
          );
          final done =
              !r.isActive &&
              (completedLogsAsync.valueOrNull ?? const []).any(
                (log) => log.reminderId == r.id,
              );
          for (final occurrence in occurrences) {
            final key = DateTime(
              occurrence.year,
              occurrence.month,
              occurrence.day,
            );
            if ((byDay[key] ?? const []).any((o) => o.reminder.id == r.id)) {
              continue;
            }
            byDay
                .putIfAbsent(key, () => [])
                .add(
                  ReminderOccurrence(
                    r,
                    completed: done,
                    historical: !r.isActive,
                  ),
                );
          }
        }

        // Same idea again, but for daily/weekly/every-N-days reminders —
        // these can fire more than once within the browsed month, and
        // unlike monthly/yearly's fixed day-of-month/month anchor, their
        // series is only pinned by a startDate lower bound, so they need
        // occurrencesInMonthFrom rather than occurrencesInMonth.
        for (final r in reminders) {
          final type = RecurrenceType.fromDbValue(r.recurrenceType);
          if (r.snoozeUntil != null ||
              (type != RecurrenceType.daily &&
                  type != RecurrenceType.weekly &&
                  type != RecurrenceType.customIntervalDays)) {
            continue;
          }
          final occurrences = occurrencesInMonthFrom(
            RecurrenceParams(
              type: type,
              intervalDays: r.recurrenceInterval,
              weekday: r.recurrenceWeekday,
              dailyExclusion: DailyExclusion.fromDb(
                r.dailyExclusionType,
                r.dailyExclusionValue,
              ),
            ),
            _visibleMonth,
            r.startDate,
          );
          final done =
              !r.isActive &&
              (completedLogsAsync.valueOrNull ?? const []).any(
                (log) => log.reminderId == r.id,
              );
          for (final occurrence in occurrences) {
            final key = DateTime(
              occurrence.year,
              occurrence.month,
              occurrence.day,
            );
            if ((byDay[key] ?? const []).any((o) => o.reminder.id == r.id)) {
              continue;
            }
            byDay
                .putIfAbsent(key, () => [])
                .add(
                  ReminderOccurrence(
                    r,
                    completed: done,
                    historical: !r.isActive,
                  ),
                );
          }
        }

        final selectedEntries =
            byDay[selectedDay] ?? const <ReminderOccurrence>[];
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        final isSelectedDayToday =
            selectedDay.year == now.year &&
            selectedDay.month == now.month &&
            selectedDay.day == now.day;
        // A day that hasn't arrived yet can't have its entries completed
        // from here — see ReminderCard.completionLocked.
        final isSelectedDayFuture = selectedDay.isAfter(today);

        return Column(
          children: [
            MonthCalendarHeader(
              month: _visibleMonth,
              onPrev: () => setState(() {
                _visibleMonth = DateTime(
                  _visibleMonth.year,
                  _visibleMonth.month - 1,
                );
              }),
              onNext: () => setState(() {
                _visibleMonth = DateTime(
                  _visibleMonth.year,
                  _visibleMonth.month + 1,
                );
              }),
            ),
            const WeekdayHeader(),
            MonthCalendarGrid(
              month: _visibleMonth,
              selectedDay: selectedDay,
              dayDecorationBuilder: (context, day) =>
                  _dayDots(context, byDay[day] ?? const []),
              onSelectDay: (d) =>
                  ref.read(selectedCalendarDayProvider.notifier).state = d,
            ),
            const Divider(height: 1),
            Expanded(
              child: selectedEntries.isEmpty
                  ? Center(
                      child: Text(
                        l10n.homeEmptyTitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  : ListView(
                      children: selectedEntries
                          .map(
                            (entry) => ReminderCard(
                              key: ValueKey(
                                'cal_${entry.reminder.id}_${entry.completed}_'
                                '${entry.historical}',
                              ),
                              reminder: entry.reminder,
                              category: byId[entry.reminder.categoryId],
                              completed: entry.completed,
                              historical: entry.historical,
                              occurrenceDate: selectedDay,
                              // Only today's own entries are correctable
                              // same-day — a genuinely past day's history
                              // stays locked, since there's no "undo" for
                              // something several cycles behind by now.
                              allowToggle: isSelectedDayToday,
                              completionLocked: isSelectedDayFuture,
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ReminderDetailScreen(
                                    reminder: entry.reminder,
                                  ),
                                ),
                              ),
                              onComplete: () => runGuarded(
                                context,
                                () => entry.completed
                                    ? ref
                                          .read(reminderActionsProvider)
                                          .uncomplete(entry.reminder.id)
                                    : ref
                                          .read(reminderActionsProvider)
                                          .complete(entry.reminder.id),
                              ),
                              onSnooze: () => runGuarded(
                                context,
                                () => ref
                                    .read(reminderActionsProvider)
                                    .snooze(
                                      entry.reminder.id,
                                      DateTime.now().add(
                                        Duration(minutes: snoozeMinutes),
                                      ),
                                    ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text(l10n.errorLoadFailed)),
    );
  }

  /// Same 3-color scheme as ReminderCard's trailing check — orange while
  /// still due and actionable, green once done, gray once auto-skipped
  /// past its day — instead of the category color, so a glance at the
  /// month grid shows what needs attention without opening the day.
  Widget? _dayDots(BuildContext context, List<ReminderOccurrence> entries) {
    if (entries.isEmpty) return null;
    Color dotColor(ReminderOccurrence entry) {
      if (entry.completed) return Colors.green;
      if (entry.historical) return Theme.of(context).colorScheme.outline;
      return Colors.orange;
    }

    return Wrap(
      spacing: 2,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ...entries.take(3).map((entry) {
          return Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              color: dotColor(entry),
              shape: BoxShape.circle,
            ),
          );
        }),
        if (entries.length > 3)
          Text(
            '+${entries.length - 3}',
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(fontSize: 8),
          ),
      ],
    );
  }
}
