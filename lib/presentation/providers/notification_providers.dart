import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

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
  final bool batteryOptimizationIgnored;

  const PermissionStatusSnapshot({
    required this.notificationsEnabled,
    required this.exactAlarmsEnabled,
    required this.batteryOptimizationIgnored,
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
      final batteryIgnored =
          await Permission.ignoreBatteryOptimizations.isGranted;
      return PermissionStatusSnapshot(
        notificationsEnabled: notifications,
        exactAlarmsEnabled: exactAlarms,
        batteryOptimizationIgnored: batteryIgnored,
      );
    });
