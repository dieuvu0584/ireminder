enum ReminderLogAction {
  completed,
  snoozed,
  skipped;

  String get dbValue => switch (this) {
    ReminderLogAction.completed => 'completed',
    ReminderLogAction.snoozed => 'snoozed',
    ReminderLogAction.skipped => 'skipped',
  };

  static ReminderLogAction fromDbValue(String value) {
    return ReminderLogAction.values.firstWhere(
      (e) => e.dbValue == value,
      orElse: () => throw ArgumentError('Unknown log action: $value'),
    );
  }
}
