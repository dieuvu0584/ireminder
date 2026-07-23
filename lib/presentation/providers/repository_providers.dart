import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/category_repository.dart';
import '../../data/repositories/reminder_repository.dart';
import '../../data/repositories/settings_repository.dart';
import 'database_provider.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository(ref.watch(appDatabaseProvider));
});

final reminderRepositoryProvider = Provider<ReminderRepository>((ref) {
  return ReminderRepository(ref.watch(appDatabaseProvider));
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository(ref.watch(appDatabaseProvider));
});
