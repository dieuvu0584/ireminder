import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/recurrence_calculator.dart';
import '../../../core/utils/reminder_due_time.dart';
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
import '../settings/settings_screen.dart';

/// A reminder occurrence paired with the specific day it's plotted on —
/// [ReminderOccurrence] alone doesn't carry that, since the same
/// [Reminder] row gets projected onto several different days when it
/// recurs (see buildOccurrencesByDay and the yearly/monthly/daily
/// projection loops below), all sharing one underlying DB row whose own
/// nextDueDate/snoozeUntil reflects only its single nearest occurrence.
typedef _DayOccurrence = ({DateTime day, ReminderOccurrence occurrence});

class CalendarView extends ConsumerStatefulWidget {
  const CalendarView({super.key});

  @override
  ConsumerState<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends ConsumerState<CalendarView> {
  late DateTime _visibleMonth;
  // Collapsed state: hides the weekday row + day grid, leaving just the
  // month/year header bar, so the day/month list below gets more room.
  // Toggled by tapping the header title (see onTitleTap below) or by
  // swiping up on the grid itself.
  bool _collapsed = false;

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
    // Null means no specific day is picked — the list below then shows
    // the whole visible month instead of a single day. Shared with
    // HomeScreen's "+" FAB, so creating a reminder while browsing a
    // specific day here pre-fills that day as the reminder's start date.
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

        final displayOccurrences = selectedDay != null
            ? _occurrencesForDay(selectedDay, byDay)
            : _occurrencesForMonth(_visibleMonth, byDay);
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);

        return Column(
          children: [
            MonthCalendarHeader(
              month: _visibleMonth,
              selectedDay: selectedDay,
              gradient: kAppIconGradient,
              foregroundColor: Colors.white,
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
              onTitleTap: () => setState(() => _collapsed = !_collapsed),
              trailing: IconButton(
                icon: const Icon(Icons.menu),
                color: Colors.white,
                tooltip: l10n.navSettings,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                ),
              ),
            ),
            // AnimatedSize gives the collapse/expand its animation for
            // free — swiping up on the grid area sets _collapsed, which
            // swaps the child for SizedBox.shrink() and lets AnimatedSize
            // tween the height change instead of snapping instantly.
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onVerticalDragEnd: (details) {
                final velocity = details.primaryVelocity ?? 0;
                if (!_collapsed && velocity < -200) {
                  setState(() => _collapsed = true);
                }
              },
              child: AnimatedSize(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: _collapsed
                    ? const SizedBox(width: double.infinity)
                    : Column(
                        children: [
                          const WeekdayHeader(),
                          MonthCalendarGrid(
                            month: _visibleMonth,
                            selectedDay: selectedDay,
                            dayDecorationBuilder: (context, day) =>
                                _dayDots(context, byDay[day] ?? const []),
                            // Tapping the already-selected day again clears
                            // the selection, dropping back to the whole
                            // month's list instead of staying stuck on one
                            // day with no way back except paging months.
                            onSelectDay: (d) {
                              final notifier = ref.read(
                                selectedCalendarDayProvider.notifier,
                              );
                              notifier.state = _isSameDay(notifier.state, d)
                                  ? null
                                  : d;
                            },
                          ),
                        ],
                      ),
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: displayOccurrences.isEmpty
                  ? Center(
                      child: Text(
                        l10n.homeEmptyTitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  : ListView(
                      children: displayOccurrences
                          .map(
                            (occurrence) => _entryCard(
                              context,
                              occurrence,
                              byId,
                              today,
                              snoozeMinutes,
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

  List<_DayOccurrence> _occurrencesForDay(
    DateTime day,
    Map<DateTime, List<ReminderOccurrence>> byDay,
  ) {
    final entries = (byDay[day] ?? const <ReminderOccurrence>[])
        .map((o) => (day: day, occurrence: o))
        .toList();
    entries.sort(
      (a, b) => dueDateTimeForDay(
        a.occurrence.reminder,
        a.day,
      ).compareTo(dueDateTimeForDay(b.occurrence.reminder, b.day)),
    );
    return entries;
  }

  List<_DayOccurrence> _occurrencesForMonth(
    DateTime month,
    Map<DateTime, List<ReminderOccurrence>> byDay,
  ) {
    bool inMonth(DateTime d) => d.year == month.year && d.month == month.month;
    final entries = <_DayOccurrence>[
      for (final e in byDay.entries)
        if (inMonth(e.key))
          for (final o in e.value) (day: e.key, occurrence: o),
    ];
    entries.sort(
      (a, b) => dueDateTimeForDay(
        a.occurrence.reminder,
        a.day,
      ).compareTo(dueDateTimeForDay(b.occurrence.reminder, b.day)),
    );
    return entries;
  }

  /// Builds the card for one occurrence, deriving its own today/future-ness
  /// from its own due day (see [_DayOccurrence]) — needed now that the
  /// month-wide list mixes entries from many different days, unlike the
  /// single selected-day list where every row shared the same day.
  Widget _entryCard(
    BuildContext context,
    _DayOccurrence entry,
    Map<int, Category> byId,
    DateTime today,
    int snoozeMinutes,
  ) {
    final occurrence = entry.occurrence;
    final r = occurrence.reminder;
    final dueDay = entry.day;
    final isEntryToday = _isSameDay(dueDay, today);
    final isEntryFuture = dueDay.isAfter(today);

    return ReminderCard(
      key: ValueKey(
        'cal_${r.id}_${occurrence.completed}_${occurrence.historical}_'
        '${dueDay.millisecondsSinceEpoch}',
      ),
      reminder: r,
      category: byId[r.categoryId],
      completed: occurrence.completed,
      historical: occurrence.historical,
      occurrenceDate: dueDay,
      // Only today's own entries are correctable same-day — a
      // genuinely past day's history stays locked, since there's no
      // "undo" for something several cycles behind by now.
      allowToggle: isEntryToday,
      completionLocked: isEntryFuture,
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ReminderDetailScreen(reminder: r)),
      ),
      onComplete: () => runGuarded(
        context,
        () => occurrence.completed
            ? ref.read(reminderActionsProvider).uncomplete(r.id)
            : ref.read(reminderActionsProvider).complete(r.id),
      ),
      onSnooze: () => runGuarded(
        context,
        () => ref
            .read(reminderActionsProvider)
            .snooze(r.id, DateTime.now().add(Duration(minutes: snoozeMinutes))),
      ),
    );
  }

  bool _isSameDay(DateTime? a, DateTime b) =>
      a != null && a.year == b.year && a.month == b.month && a.day == b.day;

  /// Same 3-color scheme as ReminderCard's trailing check — orange while
  /// still due and actionable, green once done, gray once auto-skipped
  /// past its day — instead of the category color, so a glance at the
  /// month grid shows what needs attention without opening the day.
  Widget? _dayDots(BuildContext context, List<ReminderOccurrence> reminders) {
    if (reminders.isEmpty) return null;
    Color dotColor(ReminderOccurrence entry) {
      if (entry.completed) return Colors.green;
      if (entry.historical) return Theme.of(context).colorScheme.outline;
      return Colors.orange;
    }

    return Wrap(
      spacing: 2,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ...reminders.take(3).map((entry) {
          return Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              color: dotColor(entry),
              shape: BoxShape.circle,
            ),
          );
        }),
        if (reminders.length > 3)
          Text(
            '+${reminders.length - 3}',
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(fontSize: 8),
          ),
      ],
    );
  }
}
