import '../database/app_database.dart';
import '../repositories/loan_repository.dart';
import '../repositories/reminder_repository.dart';
import 'alarm_scheduler_service.dart';
import 'notification_service.dart';

/// Handles a notification action tapped while the app isn't running. This
/// runs in a background isolate spawned fresh by the OS — it shares no
/// runtime state with the main isolate (so nothing set up in main.dart or
/// app.dart's provider container is reachable here), which is why it opens
/// its own [AppDatabase] connection rather than going through Riverpod.
/// Mirrors the foreground handler in app.dart's `appBootstrapProvider`.
@pragma('vm:entry-point')
Future<void> handleBackgroundNotificationAction(
  String actionId,
  String? payload,
) async {
  if (payload == null) return;
  final parts = payload.split(':');
  if (parts.length != 2) return;
  final id = int.tryParse(parts[1]);
  if (id == null) return;

  final db = AppDatabase();
  try {
    final notifications = NotificationService();
    if (parts[0] == 'reminder') {
      final reminders = ReminderRepository(db);
      final alarms = AlarmSchedulerService(db, notifications);
      if (actionId == NotificationActionIds.reminderSnooze) {
        final settings = await db.select(db.appSettings).getSingle();
        final updated = await reminders.snooze(
          id,
          DateTime.now().add(Duration(minutes: settings.snoozeDurationMinutes)),
        );
        await alarms.scheduleForReminder(updated);
      } else {
        final updated = await reminders.complete(id);
        if (updated.isActive) {
          await alarms.scheduleForReminder(updated);
        } else {
          await alarms.cancelForReminder(id);
        }
      }
    } else if (parts[0] == 'installment' &&
        actionId == NotificationActionIds.installmentPaid) {
      final loans = LoanRepository(db);
      final alarms = AlarmSchedulerService(db, notifications);
      final installment = await loans.getInstallmentById(id);
      if (installment != null) {
        await loans.markPaid(
          loanId: installment.loanId,
          installmentIds: [installment.id],
          paidDate: DateTime.now(),
        );
        await alarms.cancelForInstallment(id);
      }
    }
  } finally {
    await db.close();
  }
}
