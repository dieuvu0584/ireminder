import 'package:flutter/foundation.dart';

import '../database/app_database.dart';
import '../repositories/loan_repository.dart';
import 'alarm_scheduler_service.dart';
import 'notification_service.dart';

/// Handles a notification action tapped while the app isn't running. This
/// runs in a background isolate spawned fresh by the OS — it shares no
/// runtime state with the main isolate (so nothing set up in main.dart or
/// app.dart's provider container is reachable here), which is why it opens
/// its own [AppDatabase] connection rather than going through Riverpod.
///
/// Only installments still have an action button (Mark paid) — reminders
/// dropped theirs (Done/Snooze) since they turned out unreliable on at
/// least one real device, so a reminder notification is always a plain
/// body tap now, which launches the app normally instead of reaching this
/// background isolate at all.
@pragma('vm:entry-point')
Future<void> handleBackgroundNotificationAction(
  String actionId,
  String? payload,
) async {
  if (actionId != NotificationActionIds.installmentPaid) return;
  if (payload == null) return;
  final parts = payload.split(':');
  if (parts.length != 2 || parts[0] != 'installment') return;
  final id = int.tryParse(parts[1]);
  if (id == null) return;

  final notifications = NotificationService();
  // Dismiss first, before opening the DB or doing anything else. A
  // background isolate the OS spins up just to handle this tap gets a
  // limited execution window (tighter still under some OEMs' aggressive
  // battery management) — the popup actually closing is the part the
  // user notices, so it must not be stuck behind slower DB bookkeeping
  // that might not finish before the isolate gets torn down.
  await notifications.cancelInstallment(id);

  final db = AppDatabase();
  try {
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
  } catch (e) {
    debugPrint('handleBackgroundNotificationAction: failed for $id: $e');
  } finally {
    await db.close();
  }
}
