import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/utils/lunar_converter.dart';
import '../../../core/utils/recurrence_calculator.dart';
import '../../../data/database/app_database.dart';
import '../../../domain/enums/recurrence_type.dart';
import '../../../domain/models/recurrence_params.dart';
import '../../providers/calendar_providers.dart';
import '../../providers/category_providers.dart';
import '../../providers/reminder_providers.dart';
import '../../providers/settings_providers.dart';
import '../../widgets/color_picker.dart';
import '../../widgets/guarded_action.dart';
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
        final remindersById = {for (final r in reminders) r.id: r};

        final byDay = <DateTime, List<_CalendarEntry>>{};
        for (final r in reminders) {
          final d = r.snoozeUntil ?? r.nextDueDate;
          final key = DateTime(d.year, d.month, d.day);
          byDay
              .putIfAbsent(key, () => [])
              .add(_CalendarEntry(r, completed: !r.isActive));

          // The DB only stores the single nearest upcoming occurrence, so
          // browsing to a different year would otherwise show nothing for
          // a yearly/lunar-yearly reminder that already has its next
          // occurrence recorded for this year (or a past one). Project it
          // onto whichever year is currently visible too.
          final type = RecurrenceType.fromDbValue(r.recurrenceType);
          if (r.snoozeUntil == null &&
              (type == RecurrenceType.yearly ||
                  type == RecurrenceType.lunarYearly)) {
            final projected = occurrenceInYear(
              RecurrenceParams(
                type: type,
                day: r.recurrenceDay,
                month: r.recurrenceMonth,
              ),
              _visibleMonth.year,
            );
            if (projected != null) {
              final projKey = DateTime(
                projected.year,
                projected.month,
                projected.day,
              );
              if (projKey != key) {
                byDay
                    .putIfAbsent(projKey, () => [])
                    .add(_CalendarEntry(r, completed: !r.isActive));
              }
            }
          }
        }

        // A recurring reminder's next_due_date only ever holds the single
        // upcoming occurrence, so its past completed cycles aren't
        // reachable above at all — plot each logged completion on the day
        // it actually happened. One-off (none) reminders are skipped here
        // since they're already fully represented above (next_due_date
        // never moves for them, so the same day would double up).
        for (final log in completedLogsAsync.valueOrNull ?? const []) {
          final reminder = remindersById[log.reminderId];
          if (reminder == null) continue;
          if (RecurrenceType.fromDbValue(reminder.recurrenceType) ==
              RecurrenceType.none) {
            continue;
          }
          final d = log.completedAt;
          final key = DateTime(d.year, d.month, d.day);
          byDay
              .putIfAbsent(key, () => [])
              .add(_CalendarEntry(reminder, completed: true));
        }

        final selectedEntries = byDay[selectedDay] ?? const <_CalendarEntry>[];

        return Column(
          children: [
            _MonthHeader(
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
            const _WeekdayHeader(),
            _MonthGrid(
              month: _visibleMonth,
              selectedDay: selectedDay,
              entriesByDay: byDay,
              categoriesById: byId,
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
                                'cal_${entry.reminder.id}_${entry.completed}',
                              ),
                              reminder: entry.reminder,
                              category: byId[entry.reminder.categoryId],
                              completed: entry.completed,
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ReminderDetailScreen(
                                    reminder: entry.reminder,
                                  ),
                                ),
                              ),
                              onComplete: () => runGuarded(
                                context,
                                () => ref
                                    .read(reminderActionsProvider)
                                    .complete(entry.reminder.id),
                                successMessage: l10n.reminderCompletedFeedback,
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
}

/// A reminder plotted on a specific calendar day, tagged with whether
/// that particular occurrence is done — the same [Reminder] can appear
/// on more than one day (its current occurrence, plus any of its past
/// logged completions), each with its own [completed] value.
class _CalendarEntry {
  final Reminder reminder;
  final bool completed;
  const _CalendarEntry(this.reminder, {required this.completed});
}

class _MonthHeader extends StatelessWidget {
  final DateTime month;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  const _MonthHeader({
    required this.month,
    required this.onPrev,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final label = MaterialLocalizations.of(
      context,
    ).formatMonthYear(month).toString();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: const Icon(Icons.chevron_left), onPressed: onPrev),
          Text(label, style: Theme.of(context).textTheme.titleMedium),
          IconButton(icon: const Icon(Icons.chevron_right), onPressed: onNext),
        ],
      ),
    );
  }
}

/// Locale-aware Mon..Sun weekday initials (e.g. "T2".."CN" in Vietnamese)
/// above the day grid, with weekends picked out in the same color used for
/// weekend day numbers below — so users can tell weekdays from weekends at
/// a glance without counting columns.
class _WeekdayHeader extends StatelessWidget {
  const _WeekdayHeader();

  @override
  Widget build(BuildContext context) {
    // MaterialLocalizations.narrowWeekdays is Sunday-first (CLDR order);
    // the grid below is Monday-first, so index 0 here is Sunday and needs
    // to move to the end.
    final sundayFirst = MaterialLocalizations.of(context).narrowWeekdays;
    final mondayFirst = [...sundayFirst.sublist(1), sundayFirst[0]];
    final weekendColor = Theme.of(context).colorScheme.error;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: List.generate(7, (i) {
          final isWeekend = i == 5 || i == 6; // Sat, Sun in Monday-first order
          return Expanded(
            child: Center(
              child: Text(
                mondayFirst[i],
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: isWeekend ? weekendColor : null,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _MonthGrid extends StatelessWidget {
  final DateTime month;
  final DateTime? selectedDay;
  final Map<DateTime, List<_CalendarEntry>> entriesByDay;
  final Map<int, Category> categoriesById;
  final ValueChanged<DateTime> onSelectDay;

  const _MonthGrid({
    required this.month,
    required this.selectedDay,
    required this.entriesByDay,
    required this.categoriesById,
    required this.onSelectDay,
  });

  @override
  Widget build(BuildContext context) {
    final firstOfMonth = DateTime(month.year, month.month, 1);
    final leadingBlanks = firstOfMonth.weekday - 1; // Monday-first grid
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final totalCells = leadingBlanks + daysInMonth;
    final rows = (totalCells / 7).ceil();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
      ),
      itemCount: rows * 7,
      itemBuilder: (context, index) {
        final dayNum = index - leadingBlanks + 1;
        if (dayNum < 1 || dayNum > daysInMonth) {
          return const SizedBox.shrink();
        }
        final day = DateTime(month.year, month.month, dayNum);
        final isSelected =
            selectedDay != null &&
            day.year == selectedDay!.year &&
            day.month == selectedDay!.month &&
            day.day == selectedDay!.day;
        final isToday = _isSameDay(day, DateTime.now());
        final isWeekend =
            day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;
        final dayEntries = entriesByDay[day] ?? const [];

        return InkWell(
          onTap: () => onSelectDay(day),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).colorScheme.primaryContainer
                  : null,
              border: isToday
                  ? Border.all(color: Theme.of(context).colorScheme.primary)
                  : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$dayNum',
                  style: isWeekend && !isSelected
                      ? TextStyle(color: Theme.of(context).colorScheme.error)
                      : null,
                ),
                Text(
                  _lunarLabel(day),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 8,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                if (dayEntries.isNotEmpty)
                  Wrap(
                    spacing: 2,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ...dayEntries.take(3).map((entry) {
                        final cat = categoriesById[entry.reminder.categoryId];
                        final color = cat != null
                            ? parseHexColor(cat.color)
                            : Colors.grey;
                        return Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: entry.completed ? Colors.green : color,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                      if (dayEntries.length > 3)
                        Text(
                          '+${dayEntries.length - 3}',
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall?.copyWith(fontSize: 8),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Lunar day for [day], shown small under the solar day number so users
  /// tracking lunar-calendar occasions (giỗ chạp, etc.) don't have to look
  /// it up elsewhere. Shows "day/month" only on the 1st of the lunar
  /// month (when the month value is actually new information) and just
  /// the day number otherwise, matching common Vietnamese calendar apps.
  String _lunarLabel(DateTime day) {
    final lunar = LunarConverter.solarToLunar(day);
    return lunar.day == 1 ? '${lunar.day}/${lunar.month}' : '${lunar.day}';
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
