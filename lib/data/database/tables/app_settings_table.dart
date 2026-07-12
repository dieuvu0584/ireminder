import 'package:drift/drift.dart';

/// Single-row table (id is always 1) holding user preferences that used to
/// need a separate key-value package — kept in Drift instead so the app
/// doesn't pull in a second persistence dependency for a handful of values.
class AppSettings extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get locale => text().nullable()();
  TextColumn get defaultReminderTime =>
      text().withDefault(const Constant('09:00'))();
  TextColumn get themeMode => text().withDefault(const Constant('system'))();
  BoolColumn get onboardingCompleted =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get notificationsPermissionAsked =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get notificationSoundEnabled =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get notificationVibrationEnabled =>
      boolean().withDefault(const Constant(true))();
  IntColumn get snoozeDurationMinutes =>
      integer().withDefault(const Constant(5))();

  @override
  Set<Column> get primaryKey => {id};
}
