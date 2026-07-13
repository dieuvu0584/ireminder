import '../../domain/enums/recurrence_type.dart';
import '../../domain/models/daily_exclusion.dart';
import '../../domain/models/recurrence_params.dart';
import 'lunar_converter.dart';

int _daysInMonth(int year, int month) {
  final firstOfNextMonth = month == 12
      ? DateTime(year + 1, 1, 1)
      : DateTime(year, month + 1, 1);
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
      final exclusion = params.dailyExclusion;
      if (exclusion == null) return from.add(const Duration(days: 1));
      return nextNonExcludedDay(from.add(const Duration(days: 1)), exclusion);

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
      final thisYearDay = day.clamp(1, _daysInMonth(from.year, month));
      final thisYearDate = DateTime(from.year, month, thisYearDay);
      final year = thisYearDate.isAfter(from) ? from.year : from.year + 1;
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

    case RecurrenceType.lunarMonthly:
      return _nextLunarDayOfMonth(params.day!, from, includeFrom: false);
  }
}

/// Scans forward day-by-day for the next solar date whose lunar
/// day-of-month matches [targetLunarDay] — a lunar month is always 29 or
/// 30 days, so within any 3 consecutive lunar months (~90 days) every
/// day-of-month that occurs at all is guaranteed to show up at least
/// once. Deliberately a plain scan rather than hand-rolled lunar-month
/// arithmetic (leap months make that error-prone) — it leans entirely on
/// [LunarConverter], the same trusted conversion already used everywhere
/// else. A target day that doesn't exist in the nearest month (e.g. day
/// 30 in a 29-day "small" month) is simply skipped to the next month
/// that has it, rather than clamped down like solar `monthly` does.
DateTime _nextLunarDayOfMonth(
  int targetLunarDay,
  DateTime from, {
  required bool includeFrom,
}) {
  for (var offset = includeFrom ? 0 : 1; offset <= 90; offset++) {
    final candidate = from.add(Duration(days: offset));
    if (LunarConverter.solarToLunar(candidate).day == targetLunarDay) {
      return candidate;
    }
  }
  throw StateError(
    'Could not resolve lunar_monthly occurrence for day $targetLunarDay '
    'from $from',
  );
}

/// Advances from [from] (inclusive) to the first day [exclusion] doesn't
/// skip — [from] itself if it's already fine. Bounded to a year out as a
/// safety net — should never actually be hit, since the form requires at
/// least one non-excluded weekday to remain, even/odd always leaves every
/// other day open, and a specific day-of-month excludes at most one day
/// out of any run of 28+. Public because reminder_repository's
/// first-occurrence logic for `daily` needs it too, on top of whatever
/// base date its own "already passed" grace-period check produces.
DateTime nextNonExcludedDay(DateTime from, DailyExclusion exclusion) {
  var candidate = from;
  for (var i = 0; i <= 366; i++) {
    if (!exclusion.excludes(candidate)) return candidate;
    candidate = candidate.add(const Duration(days: 1));
  }
  throw StateError('No non-excluded day found within a year of $from');
}

/// Computes the first occurrence on or after [fromDate] — used when a
/// reminder is first created (or its recurrence rule/start date is edited).
/// [calculateNextDueDate] instead always assumes the previous cycle's
/// occurrence already happened and jumps a full period ahead, which would
/// wrongly skip an occurrence that's still upcoming within the current
/// cycle (e.g. a yearly reminder created before this year's date has
/// passed).
DateTime calculateFirstOccurrenceOnOrAfter(
  RecurrenceParams params,
  DateTime fromDate,
) {
  final from = _dateOnly(fromDate);

  switch (params.type) {
    case RecurrenceType.none:
    case RecurrenceType.customIntervalDays:
      return from;

    case RecurrenceType.daily:
      final exclusion = params.dailyExclusion;
      if (exclusion == null) return from;
      return nextNonExcludedDay(from, exclusion);

    case RecurrenceType.weekly:
      final weekday = params.weekday!;
      final diff = (weekday - from.weekday) % 7;
      return from.add(Duration(days: diff));

    case RecurrenceType.monthly:
      final day = params.day!;
      final thisMonthDay = day.clamp(1, _daysInMonth(from.year, from.month));
      final thisMonth = DateTime(from.year, from.month, thisMonthDay);
      if (!thisMonth.isBefore(from)) return thisMonth;
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
      final thisYearDay = day.clamp(1, _daysInMonth(from.year, month));
      final thisYear = DateTime(from.year, month, thisYearDay);
      if (!thisYear.isBefore(from)) return thisYear;
      final nextYearDay = day.clamp(1, _daysInMonth(from.year + 1, month));
      return DateTime(from.year + 1, month, nextYearDay);

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
        if (!solarDate.isBefore(from)) {
          return solarDate;
        }
      }
      throw StateError(
        'Could not resolve first lunar_yearly occurrence for '
        '$lunarMonth/$lunarDay on or after $from',
      );

    case RecurrenceType.lunarMonthly:
      return _nextLunarDayOfMonth(params.day!, from, includeFrom: true);
  }
}

/// The date [params] would fall on within [year], for the once-a-year
/// recurrence types — used to project a yearly/lunar-yearly reminder onto
/// a calendar month the user has browsed to, since the DB only stores the
/// single nearest upcoming occurrence rather than a full future series.
/// Returns null for recurrence types with no single per-year occurrence.
DateTime? occurrenceInYear(RecurrenceParams params, int year) {
  switch (params.type) {
    case RecurrenceType.yearly:
      final day = params.day!;
      final month = params.month!;
      return DateTime(year, month, day.clamp(1, _daysInMonth(year, month)));

    case RecurrenceType.lunarYearly:
      final day = params.day!;
      final month = params.month!;
      for (final lunarYear in [year, year - 1]) {
        final solar = LunarConverter.lunarToSolar(lunarYear, month, day);
        if (solar.year == year) return solar;
      }
      return null;

    default:
      return null;
  }
}

/// Every occurrence of [params] that falls within the solar month
/// containing [monthStart] — used to project a monthly/lunar-monthly
/// reminder onto whichever month the user has browsed the calendar to,
/// since the DB only stores the single nearest upcoming occurrence. Solar
/// `monthly` always has exactly one occurrence per calendar month (day
/// clamped like [calculateNextDueDate] does); `lunarMonthly` can have
/// zero, one, or two, since lunar months don't line up with solar month
/// boundaries. Returns an empty list for recurrence types with no
/// monthly-or-more-often occurrence.
List<DateTime> occurrencesInMonth(
  RecurrenceParams params,
  DateTime monthStart,
) {
  switch (params.type) {
    case RecurrenceType.monthly:
      final day = params.day!;
      final clampedDay = day.clamp(
        1,
        _daysInMonth(monthStart.year, monthStart.month),
      );
      return [DateTime(monthStart.year, monthStart.month, clampedDay)];

    case RecurrenceType.lunarMonthly:
      final targetLunarDay = params.day!;
      final daysInMonth = _daysInMonth(monthStart.year, monthStart.month);
      final result = <DateTime>[];
      for (var day = 1; day <= daysInMonth; day++) {
        final date = DateTime(monthStart.year, monthStart.month, day);
        if (LunarConverter.solarToLunar(date).day == targetLunarDay) {
          result.add(date);
        }
      }
      return result;

    default:
      return const [];
  }
}
