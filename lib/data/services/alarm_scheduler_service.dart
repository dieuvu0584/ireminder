import 'package:drift/drift.dart';

import '../database/app_database.dart';
import 'notification_service.dart';

DateTime _combine(DateTime date, String hhmm) {
  final parts = hhmm.split(':');
  return DateTime(
    date.year,
    date.month,
    date.day,
    int.parse(parts[0]),
    int.parse(parts[1]),
  );
}

/// Bridges reminders/loan_installments (the source of truth in Drift) to
/// [NotificationService] (the OS-level scheduling mechanism). Always
/// cancels before scheduling so a reminder/installment never ends up with
/// two live notifications.
class AlarmSchedulerService {
  final AppDatabase _db;
  final NotificationService _notifications;

  AlarmSchedulerService(this._db, this._notifications);

  Future<void> scheduleForReminder(Reminder reminder) async {
    if (!reminder.isActive) {
      await _notifications.cancelReminder(reminder.id);
      return;
    }
    final dueDate = reminder.snoozeUntil ?? reminder.nextDueDate;
    final fireDate = reminder.snoozeUntil != null
        ? reminder.snoozeUntil!
        : dueDate.subtract(Duration(days: reminder.advanceNoticeDays));
    final fireAt = reminder.snoozeUntil != null
        ? reminder.snoozeUntil!
        : _combine(fireDate, reminder.reminderTime);

    if (fireAt.isBefore(DateTime.now())) {
      // Past due: still show it, but immediately rather than in the past.
      await _notifications.scheduleReminder(
        reminderId: reminder.id,
        fireAt: DateTime.now().add(const Duration(seconds: 5)),
        title: reminder.title,
        body: reminder.description ?? '',
      );
      return;
    }

    await _notifications.scheduleReminder(
      reminderId: reminder.id,
      fireAt: fireAt,
      title: reminder.title,
      body: reminder.description ?? '',
    );
  }

  Future<void> cancelForReminder(int reminderId) {
    return _notifications.cancelReminder(reminderId);
  }

  Future<void> scheduleForInstallment(
    LoanInstallment installment,
    Loan loan,
    String defaultReminderTime,
  ) async {
    if (installment.status != 'pending') {
      await _notifications.cancelInstallment(installment.id);
      return;
    }
    final fireDate = installment.dueDate
        .subtract(Duration(days: loan.reminderAdvanceDays));
    final fireAt = _combine(fireDate, defaultReminderTime);
    if (fireAt.isBefore(DateTime.now())) return;

    await _notifications.scheduleInstallment(
      installmentId: installment.id,
      fireAt: fireAt,
      title: 'Installment #${installment.installmentNumber} due',
      body: '${loan.name} — ${installment.amount}',
    );
  }

  Future<void> cancelForInstallment(int installmentId) {
    return _notifications.cancelInstallment(installmentId);
  }

  /// Re-derives every active alarm straight from the DB. Called on app
  /// start (and should also run after boot via the platform boot
  /// receiver) so scheduled notifications never drift from what's
  /// actually stored, regardless of what the OS silently dropped.
  Future<void> rescheduleAllFromDatabase() async {
    final reminders = await (_db.select(_db.reminders)
          ..where((r) => r.isActive.equals(true)))
        .get();
    for (final reminder in reminders) {
      await scheduleForReminder(reminder);
    }

    final settings = await (_db.select(_db.appSettings)).getSingle();
    final activeLoans =
        await (_db.select(_db.loans)..where((l) => l.isActive.equals(true)))
            .get();
    for (final loan in activeLoans) {
      final pending = await (_db.select(_db.loanInstallments)
            ..where((i) =>
                i.loanId.equals(loan.id) & i.status.equals('pending')))
          .get();
      for (final installment in pending) {
        await scheduleForInstallment(
          installment,
          loan,
          settings.defaultReminderTime,
        );
      }
    }
  }
}
