import '../../data/database/app_database.dart';
import 'reminder_occurrence.dart';

/// A single row in the Task List / Calendar tabs' agenda — either a
/// reminder occurrence or a pending loan installment. Lets both domains
/// share the same date-sorted, day-bucketed display without either
/// screen needing to know the other's internal shape, since a payment
/// coming due is also "something to be reminded about on a date."
sealed class AgendaEntry {
  DateTime get dueAt;
}

class ReminderAgendaEntry extends AgendaEntry {
  final ReminderOccurrence occurrence;
  @override
  final DateTime dueAt;

  ReminderAgendaEntry(this.occurrence, this.dueAt);
}

class InstallmentAgendaEntry extends AgendaEntry {
  final LoanInstallment installment;
  final Loan loan;
  @override
  final DateTime dueAt;

  /// Installments have no time-of-day of their own (unlike reminders,
  /// which carry a separate reminderTime) — dueAt is pinned to midnight,
  /// which naturally sorts an installment before any timed reminder due
  /// the same day.
  InstallmentAgendaEntry(this.installment, this.loan)
    : dueAt = DateTime(
        installment.dueDate.year,
        installment.dueDate.month,
        installment.dueDate.day,
      );
}
