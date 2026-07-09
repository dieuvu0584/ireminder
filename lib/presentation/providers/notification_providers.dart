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
