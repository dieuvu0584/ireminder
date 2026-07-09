import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/services/backup_service.dart';
import 'database_provider.dart';

final backupServiceProvider = Provider<BackupService>((ref) {
  return BackupService(ref.watch(appDatabaseProvider));
});
