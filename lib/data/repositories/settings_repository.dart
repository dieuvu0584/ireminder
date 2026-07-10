import 'package:drift/drift.dart';

import '../database/app_database.dart';

class SettingsRepository {
  final AppDatabase _db;

  SettingsRepository(this._db);

  Stream<AppSetting> watch() {
    return (_db.select(_db.appSettings)..where((s) => s.id.equals(1)))
        .watchSingle();
  }

  Future<AppSetting> get() {
    return (_db.select(_db.appSettings)..where((s) => s.id.equals(1)))
        .getSingle();
  }

  Future<void> setLocale(String? localeCode) => _patch(
        AppSettingsCompanion(locale: Value(localeCode)),
      );

  Future<void> setDefaultReminderTime(String hhmm) => _patch(
        AppSettingsCompanion(defaultReminderTime: Value(hhmm)),
      );

  Future<void> setThemeMode(String mode) => _patch(
        AppSettingsCompanion(themeMode: Value(mode)),
      );

  Future<void> setOnboardingCompleted(bool value) => _patch(
        AppSettingsCompanion(onboardingCompleted: Value(value)),
      );

  Future<void> setNotificationsPermissionAsked(bool value) => _patch(
        AppSettingsCompanion(notificationsPermissionAsked: Value(value)),
      );

  Future<void> setNotificationSoundEnabled(bool value) => _patch(
        AppSettingsCompanion(notificationSoundEnabled: Value(value)),
      );

  Future<void> setNotificationVibrationEnabled(bool value) => _patch(
        AppSettingsCompanion(notificationVibrationEnabled: Value(value)),
      );

  Future<void> setSnoozeDurationMinutes(int minutes) => _patch(
        AppSettingsCompanion(snoozeDurationMinutes: Value(minutes)),
      );

  Future<void> _patch(AppSettingsCompanion companion) {
    return (_db.update(_db.appSettings)..where((s) => s.id.equals(1)))
        .write(companion);
  }
}
