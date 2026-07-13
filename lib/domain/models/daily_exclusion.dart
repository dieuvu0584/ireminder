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

/// A daily-recurring reminder normally fires every single day; this skips
/// specific days throughout the recurrence instead — e.g. weekdays only
/// (exclude Sat/Sun), even/odd days of the month, or one fixed day of the
/// month every month. Only one exclusion rule can be active at a time.
class DailyExclusion {
  final DailyExclusionType type;

  /// weekdays only: 1 (Mon) - 7 (Sun), the days to skip. Never all 7 —
  /// enforced by the form, since that would mean "never fire".
  final Set<int>? weekdays;

  /// evenOdd only: true excludes even day-of-month numbers, false
  /// excludes odd ones.
  final bool? excludeEvenDays;

  /// specificDay only: the day-of-month (1-31) to skip every month it
  /// occurs on. A value that doesn't exist in a given month (e.g. 31 in
  /// April) simply never excludes anything that month.
  final int? day;

  const DailyExclusion.weekdays(Set<int> this.weekdays)
    : type = DailyExclusionType.weekdays,
      excludeEvenDays = null,
      day = null;

  const DailyExclusion.evenOdd(bool this.excludeEvenDays)
    : type = DailyExclusionType.evenOdd,
      weekdays = null,
      day = null;

  const DailyExclusion.specificDay(int this.day)
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
        return date.day == day;
    }
  }

  String get dbValue => switch (type) {
    DailyExclusionType.weekdays => weekdays!.toList().join(','),
    DailyExclusionType.evenOdd => excludeEvenDays! ? 'even' : 'odd',
    DailyExclusionType.specificDay => '$day',
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
        return DailyExclusion.specificDay(int.parse(value));
    }
  }
}
