import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/app_database.dart';
import 'repository_providers.dart';

final settingsStreamProvider = StreamProvider<AppSetting>((ref) {
  return ref.watch(settingsRepositoryProvider).watch();
});

final settingsActionsProvider = Provider<SettingsRepositoryActions>((ref) {
  return SettingsRepositoryActions(ref);
});

class SettingsRepositoryActions {
  final Ref _ref;
  SettingsRepositoryActions(this._ref);

  Future<void> setLocale(String? code) =>
      _ref.read(settingsRepositoryProvider).setLocale(code);

  Future<void> setDefaultReminderTime(String hhmm) =>
      _ref.read(settingsRepositoryProvider).setDefaultReminderTime(hhmm);

  Future<void> setThemeMode(String mode) =>
      _ref.read(settingsRepositoryProvider).setThemeMode(mode);

  Future<void> setOnboardingCompleted(bool value) =>
      _ref.read(settingsRepositoryProvider).setOnboardingCompleted(value);

  Future<void> setNotificationSoundEnabled(bool value) => _ref
      .read(settingsRepositoryProvider)
      .setNotificationSoundEnabled(value);

  Future<void> setNotificationVibrationEnabled(bool value) => _ref
      .read(settingsRepositoryProvider)
      .setNotificationVibrationEnabled(value);

  Future<void> setSnoozeDurationMinutes(int minutes) => _ref
      .read(settingsRepositoryProvider)
      .setSnoozeDurationMinutes(minutes);
}
