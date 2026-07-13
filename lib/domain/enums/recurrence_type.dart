enum RecurrenceType {
  none,
  daily,
  weekly,
  monthly,
  yearly,
  customIntervalDays,
  lunarYearly,
  lunarMonthly;

  String get dbValue => switch (this) {
    RecurrenceType.none => 'none',
    RecurrenceType.daily => 'daily',
    RecurrenceType.weekly => 'weekly',
    RecurrenceType.monthly => 'monthly',
    RecurrenceType.yearly => 'yearly',
    RecurrenceType.customIntervalDays => 'custom_interval_days',
    RecurrenceType.lunarYearly => 'lunar_yearly',
    RecurrenceType.lunarMonthly => 'lunar_monthly',
  };

  static RecurrenceType fromDbValue(String value) {
    return RecurrenceType.values.firstWhere(
      (e) => e.dbValue == value,
      orElse: () => throw ArgumentError('Unknown recurrence type: $value'),
    );
  }
}
