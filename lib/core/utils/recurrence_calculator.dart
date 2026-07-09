import '../../domain/enums/recurrence_type.dart';
import '../../domain/models/recurrence_params.dart';
import 'lunar_converter.dart';

int _daysInMonth(int year, int month) {
  final firstOfNextMonth =
      month == 12 ? DateTime(year + 1, 1, 1) : DateTime(year, month + 1, 1);
  return firstOfNextMonth.subtract(const Duration(days: 1)).day;
}

DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

/// Computes the next due date for a reminder given the recurrence rule and
/// the date it is being computed from (usually "today" or the date the
/// previous occurrence was completed).
///
/// Pure function: no I/O, no DB access, safe to unit test directly.
DateTime calculateNextDueDate(RecurrenceParams params, DateTime fromDate) {
  final from = _dateOnly(fromDate);

  switch (params.type) {
    case RecurrenceType.none:
      return from;

    case RecurrenceType.daily:
      return from.add(const Duration(days: 1));

    case RecurrenceType.weekly:
      final weekday = params.weekday!;
      var diff = (weekday - from.weekday) % 7;
      if (diff <= 0) diff += 7;
      return from.add(Duration(days: diff));

    case RecurrenceType.monthly:
      final day = params.day!;
      var year = from.year;
      var month = from.month + 1;
      if (month > 12) {
        month -= 12;
        year += 1;
      }
      final clampedDay = day.clamp(1, _daysInMonth(year, month));
      return DateTime(year, month, clampedDay);

    case RecurrenceType.yearly:
      final day = params.day!;
      final month = params.month!;
      final year = from.year + 1;
      final clampedDay = day.clamp(1, _daysInMonth(year, month));
      return DateTime(year, month, clampedDay);

    case RecurrenceType.customIntervalDays:
      return from.add(Duration(days: params.intervalDays!));

    case RecurrenceType.lunarYearly:
      final lunarDay = params.day!;
      final lunarMonth = params.month!;
      for (var yearOffset = 0; yearOffset <= 2; yearOffset++) {
        final lunarYear = from.year + yearOffset;
        final solarDate = LunarConverter.lunarToSolar(
          lunarYear,
          lunarMonth,
          lunarDay,
        );
        if (solarDate.isAfter(from)) {
          return solarDate;
        }
      }
      throw StateError(
        'Could not resolve next lunar_yearly occurrence for '
        '$lunarMonth/$lunarDay from $from',
      );
  }
}
