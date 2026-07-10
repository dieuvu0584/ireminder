import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/categories_table.dart';
import 'tables/reminders_table.dart';
import 'tables/reminder_logs_table.dart';
import 'tables/loans_table.dart';
import 'tables/loan_installments_table.dart';
import 'tables/app_settings_table.dart';
import 'tables/ai_settings_table.dart';
import 'tables/ai_chat_history_table.dart';

part 'app_database.g.dart';

const List<(String name, String icon, String color)> kDefaultCategories = [
  ('Nhà cửa & thiết bị', 'home_repair_service', '#3B82F6'),
  ('Xe cộ', 'directions_car', '#F97316'),
  ('Giỗ chạp & gia đình', 'self_improvement', '#8B5CF6'),
  ('Tài chính', 'payments', '#10B981'),
  ('Công việc', 'work', '#6366F1'),
  ('Gia đình nhỏ', 'favorite', '#EC4899'),
  ('Dã ngoại & sự kiện', 'hiking', '#F59E0B'),
];

@DriftDatabase(
  tables: [
    Categories,
    Reminders,
    ReminderLogs,
    Loans,
    LoanInstallments,
    AppSettings,
    AiSettings,
    AiChatHistory,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          await _seedDefaultCategories();
          await into(appSettings).insert(const AppSettingsCompanion());
          await into(aiSettings).insert(const AiSettingsCompanion());
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            // Phase 7: optional AI assistant, added post-launch. Existing
            // installs get the two new tables with no data loss elsewhere.
            await m.createTable(aiSettings);
            await m.createTable(aiChatHistory);
            await into(aiSettings).insert(const AiSettingsCompanion());
          }
          if (from < 3) {
            await m.addColumn(
                appSettings, appSettings.notificationSoundEnabled);
            await m.addColumn(
                appSettings, appSettings.notificationVibrationEnabled);
            await m.addColumn(appSettings, appSettings.snoozeDurationMinutes);
          }
        },
      );

  Future<void> _seedDefaultCategories() async {
    final existing = await select(categories).get();
    if (existing.isNotEmpty) return;
    final now = DateTime.now();
    for (var i = 0; i < kDefaultCategories.length; i++) {
      final (name, icon, color) = kDefaultCategories[i];
      await into(categories).insert(
        CategoriesCompanion.insert(
          name: name,
          icon: icon,
          color: color,
          sortOrder: Value(i),
          isSystemDefault: const Value(true),
          createdAt: now,
        ),
      );
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ireminder.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
