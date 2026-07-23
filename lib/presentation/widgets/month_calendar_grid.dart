import 'package:flutter/material.dart';

import '../../core/utils/lunar_converter.dart';

/// Month navigation header (prev/next chevrons + "Month Year" label) —
/// shared between the Calendar tab and the lunar date picker so both
/// present the same browsing UI.
class MonthCalendarHeader extends StatelessWidget {
  final DateTime month;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  /// Optional tap target on the "Month Year" label only (not the whole
  /// row, so it never competes with the prev/next chevrons) — the
  /// Calendar tab uses this to re-expand a collapsed calendar; null
  /// elsewhere (e.g. the lunar date picker) leaves the label inert.
  final VoidCallback? onTitleTap;

  /// When given and it falls within [month], the label shows this full
  /// date (e.g. "Wednesday, July 22, 2026") instead of just "Month Year"
  /// — lets the Calendar tab surface which day is actually selected, not
  /// just which month is being browsed. Null (or a day outside [month],
  /// which happens after paging months without picking a new day) falls
  /// back to the plain month/year label; unused by the lunar date picker,
  /// which has no "selected day" concept of its own.
  final DateTime? selectedDay;

  /// Extra widget pinned to the far right edge of the row, past the
  /// "next month" chevron — the Calendar screen uses this for its
  /// settings entry point, now that there's no separate tab bar row left
  /// to put it in. Null everywhere else (e.g. the lunar date picker).
  final Widget? trailing;

  /// Tints the whole header bar — the Calendar screen uses the app's own
  /// brand color/gradient here so the header reads as "the app", not just
  /// another gray toolbar; null (the lunar date picker) stays unstyled.
  /// [gradient], when given, takes precedence over [backgroundColor].
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? foregroundColor;

  const MonthCalendarHeader({
    super.key,
    required this.month,
    required this.onPrev,
    required this.onNext,
    this.onTitleTap,
    this.selectedDay,
    this.trailing,
    this.backgroundColor,
    this.gradient,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    final showSelectedDay =
        selectedDay != null &&
        selectedDay!.year == month.year &&
        selectedDay!.month == month.month;
    final label = showSelectedDay
        ? localizations.formatFullDate(selectedDay!)
        : localizations.formatMonthYear(month).toString();
    final title = Text(
      label,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(color: foregroundColor),
    );
    return Container(
      decoration: BoxDecoration(
        color: gradient == null ? backgroundColor : null,
        gradient: gradient,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left, color: foregroundColor),
            onPressed: onPrev,
          ),
          Expanded(
            child: Center(
              child: onTitleTap == null
                  ? title
                  : InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: onTitleTap,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: title,
                      ),
                    ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.chevron_right, color: foregroundColor),
            onPressed: onNext,
          ),
          ?trailing,
        ],
      ),
    );
  }
}

/// Locale-aware Mon..Sun weekday initials (e.g. "T2".."CN" in Vietnamese)
/// above the day grid, with weekends picked out in the same color used for
/// weekend day numbers below — shared between the Calendar tab and the
/// lunar date picker.
class WeekdayHeader extends StatelessWidget {
  const WeekdayHeader({super.key});

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

/// Solar month grid with each day's lunar day/month shown underneath —
/// shared between the Calendar tab (which decorates days with reminder
/// dots via [dayDecorationBuilder]) and the lunar date picker (bare, no
/// decoration), so both present the same day-cell look.
class MonthCalendarGrid extends StatelessWidget {
  final DateTime month;
  final DateTime? selectedDay;
  final ValueChanged<DateTime> onSelectDay;
  final Widget? Function(BuildContext context, DateTime day)?
  dayDecorationBuilder;

  /// Days outside [firstSelectableDay, lastSelectableDay] (inclusive) are
  /// shown dimmed and not tappable. Null on either end means unbounded in
  /// that direction — the Calendar tab passes neither, since browsing
  /// there has no such limit.
  final DateTime? firstSelectableDay;
  final DateTime? lastSelectableDay;

  const MonthCalendarGrid({
    super.key,
    required this.month,
    required this.selectedDay,
    required this.onSelectDay,
    this.dayDecorationBuilder,
    this.firstSelectableDay,
    this.lastSelectableDay,
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
        final isDisabled =
            (firstSelectableDay != null && day.isBefore(firstSelectableDay!)) ||
            (lastSelectableDay != null && day.isAfter(lastSelectableDay!));
        final decoration = dayDecorationBuilder?.call(context, day);

        return InkWell(
          onTap: isDisabled ? null : () => onSelectDay(day),
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
                  style: isDisabled
                      ? TextStyle(color: Theme.of(context).disabledColor)
                      : isWeekend && !isSelected
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
                ?decoration,
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
