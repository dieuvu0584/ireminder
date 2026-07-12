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
  final notifications = NotificationService();
  // TEMPORARY: confirms this function is even reached at all, since a
  // background isolate that never gets spawned (OS restriction) and one
  // that gets spawned but crashes immediately are otherwise
  // indistinguishable from the outside — both look like "nothing
  // happened". TODO: remove once the "Done/Snooze does nothing" report
  // is resolved.
  await _debug(
    notifications,
    'handler entered: action=$actionId payload=$payload',
  );

  try {
    if (payload == null) {
      await _debug(notifications, 'aborted: payload is null');
      return;
    }
    final parts = payload.split(':');
    if (parts.length != 2) {
      await _debug(notifications, 'aborted: malformed payload "$payload"');
      return;
    }
    final id = int.tryParse(parts[1]);
    if (id == null) {
      await _debug(notifications, 'aborted: non-numeric id in "$payload"');
      return;
    }

    // Dismiss first, before opening the DB or doing anything else. A
    // background isolate the OS spins up just to handle this tap gets a
    // limited execution window (tighter still under some OEMs' aggressive
    // battery management) — the popup actually closing is the part the
    // user notices, so it must not be stuck behind slower DB bookkeeping
    // that might not finish before the isolate gets torn down.
    if (actionId == NotificationActionIds.reminderSnooze ||
        actionId == NotificationActionIds.reminderDone) {
      await notifications.cancelReminder(id);
    } else if (actionId == NotificationActionIds.installmentPaid) {
      await notifications.cancelInstallment(id);
    }
    await _debug(notifications, 'cancelReminder/cancelInstallment done');

    final db = AppDatabase();
    try {
      if (parts[0] == 'reminder') {
        final reminders = ReminderRepository(db);
        final alarms = AlarmSchedulerService(db, notifications);
        if (actionId == NotificationActionIds.reminderSnooze) {
          final settings = await db.select(db.appSettings).getSingle();
          final updated = await reminders.snooze(
            id,
            DateTime.now().add(
              Duration(minutes: settings.snoozeDurationMinutes),
            ),
          );
          await alarms.scheduleForReminder(updated);
          await _debug(notifications, 'snooze applied for reminder $id');
        } else if (actionId == NotificationActionIds.reminderDone) {
          final updated = await reminders.complete(id);
          if (updated.isActive) {
            await alarms.scheduleForReminder(updated);
          } else {
            await alarms.cancelForReminder(id);
          }
          await _debug(notifications, 'complete applied for reminder $id');
        } else {
          await _debug(notifications, 'plain tap (no reminder action) for $id');
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
        await _debug(notifications, 'markPaid applied for installment $id');
      }
    } finally {
      await db.close();
    }
  } catch (e, st) {
    // Without this, any exception here just silently kills the isolate —
    // no crash report, no logcat visibility from outside a connected
    // debugger — which looks identical to "the tap did nothing at all".
    await _debug(
      notifications,
      'ERROR: $e\n${st.toString().split('\n').take(3).join('\n')}',
    );
  }
}

Future<void> _debug(NotificationService notifications, String message) async {
  try {
    await notifications.showDebugNotification(message);
  } catch (_) {
    // If even the diagnostic notification fails, there's nothing further
    // to fall back to from here.
  }
}
