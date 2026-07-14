enum DailyExclusionType {
  weekdays,
  evenOdd,
  specificDay;

  String get dbValue => switch (this) {
    DailyExclusionType.weekdays => 'weekdays',
    DailyExclusionType.evenOdd => 'even_odd',
    DailyExclusionType.specificDay => 'specific_day',
  };

  static DailyExclusionType fromDbValue(String value) {
    return DailyExclusionType.values.firstWhere(
      (e) => e.dbValue == value,
      orElse: () => throw ArgumentError('Unknown daily exclusion type: $value'),
    );
  }
}

/// Raised by [DailyExclusion.parseDaysCompact] when the input doesn't
/// parse as a valid day-of-month list/range expression, so the form can
/// show a specific, translatable reason rather than a generic error.
class InvalidDaysCompactFormat implements Exception {
  final String input;
  const InvalidDaysCompactFormat(this.input);
}

/// A daily-recurring reminder normally fires every single day; this skips
/// specific days throughout the recurrence instead — e.g. weekdays only
/// (exclude Sat/Sun), even/odd days of the month, or a fixed set of
/// day-of-month numbers every month. Only one exclusion rule can be
/// active at a time.
class DailyExclusion {
  final DailyExclusionType type;

  /// weekdays only: 1 (Mon) - 7 (Sun), the days to skip. Never all 7 —
  /// enforced by the form, since that would mean "never fire".
  final Set<int>? weekdays;

  /// evenOdd only: true excludes even day-of-month numbers, false
  /// excludes odd ones.
  final bool? excludeEvenDays;

  /// specificDay only: the day-of-month numbers (1-31) to skip every
  /// month they occur in. A value that doesn't exist in a given month
  /// (e.g. 31 in April) simply never excludes anything that month.
  final Set<int>? days;

  const DailyExclusion.weekdays(Set<int> this.weekdays)
    : type = DailyExclusionType.weekdays,
      excludeEvenDays = null,
      days = null;

  const DailyExclusion.evenOdd(bool this.excludeEvenDays)
    : type = DailyExclusionType.evenOdd,
      weekdays = null,
      days = null;

  const DailyExclusion.specificDay(Set<int> this.days)
    : type = DailyExclusionType.specificDay,
      weekdays = null,
      excludeEvenDays = null;

  bool excludes(DateTime date) {
    switch (type) {
      case DailyExclusionType.weekdays:
        return weekdays!.contains(date.weekday);
      case DailyExclusionType.evenOdd:
        final isEven = date.day.isEven;
        return excludeEvenDays! ? isEven : !isEven;
      case DailyExclusionType.specificDay:
        return days!.contains(date.day);
    }
  }

  String get dbValue => switch (type) {
    DailyExclusionType.weekdays => weekdays!.toList().join(','),
    DailyExclusionType.evenOdd => excludeEvenDays! ? 'even' : 'odd',
    DailyExclusionType.specificDay => formatDaysCompact(days!),
  };

  static DailyExclusion? fromDb(String? type, String? value) {
    if (type == null || value == null) return null;
    switch (DailyExclusionType.fromDbValue(type)) {
      case DailyExclusionType.weekdays:
        final weekdays = value.split(',').map(int.parse).toSet();
        return DailyExclusion.weekdays(weekdays);
      case DailyExclusionType.evenOdd:
        return DailyExclusion.evenOdd(value == 'even');
      case DailyExclusionType.specificDay:
        return DailyExclusion.specificDay(parseDaysCompact(value));
    }
  }

  /// Parses a print-style day list like "1,2,3,6-9,15" into {1,2,3,6,7,8,9,
  /// 15} — comma-separated day numbers and/or "a-b" ranges, 1-31 each.
  /// Throws [InvalidDaysCompactFormat] (not a raw FormatException, so the
  /// form can show one specific translated message) on anything that
  /// doesn't fit that shape: empty input, out-of-range numbers, a
  /// backwards range (e.g. "9-6"), or stray characters.
  static Set<int> parseDaysCompact(String input) {
    final trimmedInput = input.trim();
    if (trimmedInput.isEmpty) throw InvalidDaysCompactFormat(input);
    final days = <int>{};
    for (final part in trimmedInput.split(',')) {
      final segment = part.trim();
      if (segment.isEmpty) throw InvalidDaysCompactFormat(input);
      final rangeParts = segment.split('-');
      if (rangeParts.length == 1) {
        final day = int.tryParse(rangeParts[0].trim());
        if (day == null || day < 1 || day > 31) {
          throw InvalidDaysCompactFormat(input);
        }
        days.add(day);
      } else if (rangeParts.length == 2) {
        final start = int.tryParse(rangeParts[0].trim());
        final end = int.tryParse(rangeParts[1].trim());
        if (start == null ||
            end == null ||
            start < 1 ||
            end > 31 ||
            start > end) {
          throw InvalidDaysCompactFormat(input);
        }
        for (var d = start; d <= end; d++) {
          days.add(d);
        }
      } else {
        throw InvalidDaysCompactFormat(input);
      }
    }
    return days;
  }

  /// Inverse of [parseDaysCompact]: collapses a set of days back into the
  /// shortest "a,b,c-d" form, sorted ascending — used to re-derive the
  /// canonical display text when editing an existing reminder (the
  /// re-generated string may not match whatever the user originally
  /// typed character-for-character, but represents the same day set).
  static String formatDaysCompact(Set<int> days) {
    final sorted = days.toList()..sort();
    final parts = <String>[];
    var i = 0;
    while (i < sorted.length) {
      var j = i;
      while (j + 1 < sorted.length && sorted[j + 1] == sorted[j] + 1) {
        j++;
      }
      parts.add(j > i ? '${sorted[i]}-${sorted[j]}' : '${sorted[i]}');
      i = j + 1;
    }
    return parts.join(',');
  }
}
