import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/services/alarm_scheduler_service.dart';
import '../../data/services/notification_service.dart';
import 'database_provider.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

final alarmSchedulerServiceProvider = Provider<AlarmSchedulerService>((ref) {
  return AlarmSchedulerService(
    ref.watch(appDatabaseProvider),
    ref.watch(notificationServiceProvider),
  );
});

class PermissionStatusSnapshot {
  final bool notificationsEnabled;
  final bool exactAlarmsEnabled;

  const PermissionStatusSnapshot({
    required this.notificationsEnabled,
    required this.exactAlarmsEnabled,
  });
}

/// autoDispose + manual `ref.invalidate(...)` because there's no OS-level
/// listener for permission changes — Settings re-checks whenever this
/// screen (re)appears, e.g. after the user grants/denies a permission or
/// comes back from the system Settings app.
final permissionStatusProvider =
    FutureProvider.autoDispose<PermissionStatusSnapshot>((ref) async {
  final service = ref.watch(notificationServiceProvider);
  final notifications = await service.areNotificationsEnabled();
  final exactAlarms = await service.canScheduleExactAlarms();
  return PermissionStatusSnapshot(
    notificationsEnabled: notifications,
    exactAlarmsEnabled: exactAlarms,
  );
});
