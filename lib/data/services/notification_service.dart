import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// Notification actions ids, kept stable so payload parsing on tap/action
/// stays backward compatible across app updates.
class NotificationActionIds {
  static const reminderDone = 'reminder_done';
  static const reminderSnooze = 'reminder_snooze';
  static const installmentPaid = 'installment_paid';
}

/// Notification id ranges keep reminder / installment notification ids from
/// colliding, so cancel(reminderId) never accidentally cancels an
/// installment notification and vice-versa.
class NotificationIdSpace {
  static const int reminderBase = 0;
  static const int installmentBase = 1000000;

  static int forReminder(int reminderId) => reminderBase + reminderId;
  static int forInstallment(int installmentId) =>
      installmentBase + installmentId;
}

typedef NotificationActionCallback = Future<void> Function(
  String actionId,
  String? payload,
);

/// Thin wrapper around flutter_local_notifications: init, permission
/// requests, and cancel-before-show scheduling. Contains no business logic
/// (no DB access) — that lives in [AlarmSchedulerService] and the providers
/// that call it.
class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  NotificationActionCallback? onAction;

  static const _reminderChannel = AndroidNotificationChannel(
    'reminders_channel',
    'Reminders',
    description: 'Recurring and one-off reminder notifications',
    importance: Importance.high,
  );

  static const _loanChannel = AndroidNotificationChannel(
    'loan_installments_channel',
    'Loan installments',
    description: 'Loan / installment due date notifications',
    importance: Importance.high,
  );

  Future<void> init() async {
    tz_data.initializeTimeZones();
    tz.setLocalLocation(_deviceLocation());

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);

    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _handleResponse,
      onDidReceiveBackgroundNotificationResponse: _backgroundHandler,
    );

    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.createNotificationChannel(_reminderChannel);
    await androidPlugin?.createNotificationChannel(_loanChannel);
  }

  /// The `timezone` package needs an IANA zone name (e.g.
  /// "Asia/Ho_Chi_Minh"), which isn't available without a platform-channel
  /// plugin. Approximates it with a fixed-offset Etc/GMT zone matching the
  /// device's current UTC offset instead of always defaulting to UTC.
  /// Correct everywhere that doesn't observe DST (including Vietnam, this
  /// app's primary market); off by up to an hour during a DST transition
  /// elsewhere, which is still far better than being off by the full
  /// offset.
  static tz.Location _deviceLocation() {
    final offsetHours =
        (DateTime.now().timeZoneOffset.inMinutes / 60).round().clamp(-12, 14);
    if (offsetHours == 0) return tz.UTC;
    // Etc/GMT uses POSIX sign convention: Etc/GMT-7 means UTC+7.
    final name = 'Etc/GMT${offsetHours > 0 ? '-' : '+'}${offsetHours.abs()}';
    try {
      return tz.getLocation(name);
    } catch (_) {
      return tz.UTC;
    }
  }

  void _handleResponse(NotificationResponse response) {
    onAction?.call(
      response.actionId ?? 'tap',
      response.payload,
    );
  }

  @pragma('vm:entry-point')
  static void _backgroundHandler(NotificationResponse response) {
    // Kept intentionally minimal: heavy DB work for background action
    // taps is dispatched from main.dart's registered top-level callback,
    // which re-initializes a DB connection in the background isolate.
  }

  Future<bool> requestPermissions() async {
    if (!Platform.isAndroid) return true;
    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    final notifGranted =
        await androidPlugin?.requestNotificationsPermission() ?? false;
    await androidPlugin?.requestExactAlarmsPermission();
    return notifGranted;
  }

  Future<void> scheduleReminder({
    required int reminderId,
    required DateTime fireAt,
    required String title,
    required String body,
  }) async {
    final id = NotificationIdSpace.forReminder(reminderId);
    await cancelReminder(reminderId);
    await _plugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(fireAt, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _reminderChannel.id,
          _reminderChannel.name,
          channelDescription: _reminderChannel.description,
          importance: Importance.high,
          priority: Priority.high,
          actions: const [
            AndroidNotificationAction(
              NotificationActionIds.reminderDone,
              'Done',
              showsUserInterface: false,
            ),
            AndroidNotificationAction(
              NotificationActionIds.reminderSnooze,
              'Snooze',
              showsUserInterface: false,
            ),
          ],
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: 'reminder:$reminderId',
    );
  }

  Future<void> scheduleInstallment({
    required int installmentId,
    required DateTime fireAt,
    required String title,
    required String body,
  }) async {
    final id = NotificationIdSpace.forInstallment(installmentId);
    await cancelInstallment(installmentId);
    await _plugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(fireAt, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _loanChannel.id,
          _loanChannel.name,
          channelDescription: _loanChannel.description,
          importance: Importance.high,
          priority: Priority.high,
          actions: const [
            AndroidNotificationAction(
              NotificationActionIds.installmentPaid,
              'Mark paid',
              showsUserInterface: false,
            ),
          ],
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: 'installment:$installmentId',
    );
  }

  Future<void> cancelReminder(int reminderId) {
    return _plugin.cancel(NotificationIdSpace.forReminder(reminderId));
  }

  Future<void> cancelInstallment(int installmentId) {
    return _plugin.cancel(NotificationIdSpace.forInstallment(installmentId));
  }

  Future<void> cancelAll() => _plugin.cancelAll();
}
