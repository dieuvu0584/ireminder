import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

import 'background_notification_handler.dart';

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
  static const int testNotificationId = 2000000;

  static int forReminder(int reminderId) => reminderBase + reminderId;
  static int forInstallment(int installmentId) =>
      installmentBase + installmentId;
}

typedef NotificationActionCallback =
    Future<void> Function(String actionId, String? payload);

/// Thin wrapper around flutter_local_notifications: init, permission
/// requests, and cancel-before-show scheduling. Contains no business logic
/// (no DB access) — that lives in [AlarmSchedulerService] and the providers
/// that call it.
class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  NotificationActionCallback? onAction;

  // _v2 suffix: forces a brand-new channel id. Android bakes a channel's
  // sound/vibration into it permanently at creation and never lets the
  // app change it again — if this device ever had the old
  // "reminders_channel_*" ids created with sound silenced (e.g. toggled
  // off in system Settings during earlier troubleshooting, or a stale
  // channel from a much earlier test install), no code change could ever
  // fix that specific channel. Bumping the id abandons whatever state the
  // old one is stuck in and starts clean.
  static const _reminderChannelBase = 'reminders_channel_v2';
  static const _loanChannelBase = 'loan_installments_channel_v2';

  /// Android locks a channel's sound/vibration behavior in at creation
  /// time — once a NotificationChannel exists, the app can't change its
  /// settings later (only the user can, via system Settings), and
  /// per-notification overrides in AndroidNotificationDetails are ignored
  /// for channel-based notifications on Android 8+. So the sound/vibration
  /// toggle in Settings is implemented as one channel per combination,
  /// chosen at schedule-time, rather than a single channel that's mutated.
  static String _channelId(
    String base, {
    required bool sound,
    required bool vibration,
  }) {
    final suffix = sound && vibration
        ? 'sv'
        : sound
        ? 's'
        : vibration
        ? 'v'
        : 'silent';
    return '${base}_$suffix';
  }

  static AndroidNotificationChannel _channel(
    String base,
    String displayName,
    String description, {
    required bool sound,
    required bool vibration,
  }) {
    return AndroidNotificationChannel(
      _channelId(base, sound: sound, vibration: vibration),
      displayName,
      description: description,
      importance: Importance.high,
      playSound: sound,
      enableVibration: vibration,
    );
  }

  Future<void> init() async {
    tz_data.initializeTimeZones();
    tz.setLocalLocation(_deviceLocation());

    // Deliberately a dedicated drawable, not @mipmap/ic_launcher — that now
    // resolves to an adaptive icon (background + foreground layers), and
    // Android notification small icons must be a plain white-on-transparent
    // silhouette. Some OEM notification renderers silently fail to show
    // the notification at all (no error surfaced anywhere) rather than
    // render a broken icon when given an adaptive icon here.
    const androidInit = AndroidInitializationSettings(
      '@drawable/ic_notification',
    );
    const initSettings = InitializationSettings(android: androidInit);

    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _handleResponse,
      onDidReceiveBackgroundNotificationResponse: _backgroundHandler,
    );

    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    for (final sound in [true, false]) {
      for (final vibration in [true, false]) {
        await androidPlugin?.createNotificationChannel(
          _channel(
            _reminderChannelBase,
            'Reminders',
            'Recurring and one-off reminder notifications',
            sound: sound,
            vibration: vibration,
          ),
        );
        await androidPlugin?.createNotificationChannel(
          _channel(
            _loanChannelBase,
            'Loan installments',
            'Loan / installment due date notifications',
            sound: sound,
            vibration: vibration,
          ),
        );
      }
    }
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
    final offsetHours = (DateTime.now().timeZoneOffset.inMinutes / 60)
        .round()
        .clamp(-12, 14);
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
    onAction?.call(response.actionId ?? 'tap', response.payload);
  }

  @pragma('vm:entry-point')
  static void _backgroundHandler(NotificationResponse response) {
    // A background isolate spawned fresh by the OS shares no runtime
    // state with the main isolate, so this can't reach anything set up
    // in app.dart — handleBackgroundNotificationAction opens its own DB
    // connection instead. Fire-and-forget: this static callback can't be
    // async itself (the plugin calls it synchronously).
    handleBackgroundNotificationAction(
      response.actionId ?? 'tap',
      response.payload,
    );
  }

  Future<bool> requestPermissions() async {
    if (!Platform.isAndroid) return true;
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    final notifGranted =
        await androidPlugin?.requestNotificationsPermission() ?? false;
    await androidPlugin?.requestExactAlarmsPermission();
    return notifGranted;
  }

  Future<bool> requestNotificationsOnly() async {
    if (!Platform.isAndroid) return true;
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    return await androidPlugin?.requestNotificationsPermission() ?? false;
  }

  Future<bool> requestExactAlarmsOnly() async {
    if (!Platform.isAndroid) return true;
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    return await androidPlugin?.requestExactAlarmsPermission() ?? false;
  }

  /// Current permission status, so Settings can show the user whether
  /// reminders are actually able to fire — and offer a way to fix it,
  /// unlike onboarding which only ever asks once and moves on regardless
  /// of the outcome.
  Future<bool> areNotificationsEnabled() async {
    if (!Platform.isAndroid) return true;
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    return await androidPlugin?.areNotificationsEnabled() ?? false;
  }

  Future<bool> canScheduleExactAlarms() async {
    if (!Platform.isAndroid) return true;
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    return await androidPlugin?.canScheduleExactNotifications() ?? false;
  }

  /// Schedules a one-off test notification ~10s out, on the same
  /// exact-alarm path real reminders use. Lets a user isolate whether the
  /// problem is "the OS never delivers it" (background app, lock the
  /// screen, wait) vs. an app-level bug in a specific reminder's own due-
  /// date computation — since this bypasses that computation entirely.
  Future<void> scheduleTestNotification() async {
    await _plugin.zonedSchedule(
      NotificationIdSpace.testNotificationId,
      'iReminder test',
      'If you see this, scheduled notifications work on this phone.',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId(_reminderChannelBase, sound: true, vibration: true),
          'Reminders',
          channelDescription: 'Recurring and one-off reminder notifications',
          importance: Importance.high,
          priority: Priority.high,
          playSound: true,
          enableVibration: true,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> scheduleReminder({
    required int reminderId,
    required DateTime fireAt,
    required String title,
    required String body,
    required String doneActionLabel,
    required String snoozeActionLabel,
    bool soundEnabled = true,
    bool vibrationEnabled = true,
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
          _channelId(
            _reminderChannelBase,
            sound: soundEnabled,
            vibration: vibrationEnabled,
          ),
          'Reminders',
          channelDescription: 'Recurring and one-off reminder notifications',
          importance: Importance.high,
          priority: Priority.high,
          playSound: soundEnabled,
          enableVibration: vibrationEnabled,
          actions: [
            AndroidNotificationAction(
              NotificationActionIds.reminderDone,
              doneActionLabel,
              showsUserInterface: false,
            ),
            AndroidNotificationAction(
              NotificationActionIds.reminderSnooze,
              snoozeActionLabel,
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
    required String markPaidActionLabel,
    bool soundEnabled = true,
    bool vibrationEnabled = true,
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
          _channelId(
            _loanChannelBase,
            sound: soundEnabled,
            vibration: vibrationEnabled,
          ),
          'Loan installments',
          channelDescription: 'Loan / installment due date notifications',
          importance: Importance.high,
          priority: Priority.high,
          playSound: soundEnabled,
          enableVibration: vibrationEnabled,
          actions: [
            AndroidNotificationAction(
              NotificationActionIds.installmentPaid,
              markPaidActionLabel,
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
