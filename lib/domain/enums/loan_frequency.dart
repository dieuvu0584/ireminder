enum LoanFrequency {
  monthly,
  weekly,
  biweekly;

  String get dbValue => switch (this) {
        LoanFrequency.monthly => 'monthly',
        LoanFrequency.weekly => 'weekly',
        LoanFrequency.biweekly => 'biweekly',
      };

  static LoanFrequency fromDbValue(String value) {
    return LoanFrequency.values.firstWhere(
      (e) => e.dbValue == value,
      orElse: () => throw ArgumentError('Unknown loan frequency: $value'),
    );
  }
}

enum InstallmentStatus {
  pending,
  paid,
  overdue;

  String get dbValue => switch (this) {
        InstallmentStatus.pending => 'pending',
        InstallmentStatus.paid => 'paid',
        InstallmentStatus.overdue => 'overdue',
      };

  static InstallmentStatus fromDbValue(String value) {
    return InstallmentStatus.values.firstWhere(
      (e) => e.dbValue == value,
      orElse: () => throw ArgumentError('Unknown installment status: $value'),
    );
  }
}

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
