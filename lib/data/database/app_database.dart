import 'dart:io';
import 'dart:ui' show PlatformDispatcher;

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../core/localization/gen/app_localizations.dart';
import '../../core/localization/supported_locales.dart';
import 'tables/categories_table.dart';
import 'tables/reminders_table.dart';
import 'tables/reminder_logs_table.dart';
import 'tables/app_settings_table.dart';

part 'app_database.g.dart';

/// Name is resolved from the device's locale at seed time (see
/// [AppDatabase._seedDefaultCategories]) rather than hardcoded — these run
/// once, before Settings has a saved locale of its own, so this list only
/// carries the parts that don't need translating.
const List<(String Function(AppLocalizations), String icon, String color)>
kDefaultCategories = [
  (_nameHealth, 'favorite', '#22C55E'),
  (_nameBirthday, 'cake', '#F43F5E'),
  (_nameFood, 'restaurant', '#14B8A6'),
  (_nameFamilyEvents, 'self_improvement', '#8B5CF6'),
  (_nameFamily, 'favorite', '#EC4899'),
  (_nameOutdoorEvents, 'hiking', '#F59E0B'),
  (_nameHomeAppliances, 'home_repair_service', '#3B82F6'),
  (_nameFinance, 'payments', '#10B981'),
  (_nameVehicles, 'directions_car', '#F97316'),
  (_nameWork, 'work', '#6366F1'),
];

String _nameHomeAppliances(AppLocalizations l) =>
    l.defaultCategoryHomeAppliances;
String _nameVehicles(AppLocalizations l) => l.defaultCategoryVehicles;
String _nameFamilyEvents(AppLocalizations l) => l.defaultCategoryFamilyEvents;
String _nameFinance(AppLocalizations l) => l.defaultCategoryFinance;
String _nameWork(AppLocalizations l) => l.defaultCategoryWork;
String _nameFamily(AppLocalizations l) => l.defaultCategoryFamily;
String _nameOutdoorEvents(AppLocalizations l) => l.defaultCategoryOutdoorEvents;
String _nameHealth(AppLocalizations l) => l.defaultCategoryHealth;
String _nameBirthday(AppLocalizations l) => l.defaultCategoryBirthday;
String _nameFood(AppLocalizations l) => l.defaultCategoryFood;

@DriftDatabase(tables: [Categories, Reminders, ReminderLogs, AppSettings])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 8;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
      await _seedDefaultCategories();
      await into(appSettings).insert(const AppSettingsCompanion());
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 3) {
        await m.addColumn(appSettings, appSettings.notificationSoundEnabled);
        await m.addColumn(
          appSettings,
          appSettings.notificationVibrationEnabled,
        );
        await m.addColumn(appSettings, appSettings.snoozeDurationMinutes);
      }
      if (from < 4) {
        await m.addColumn(reminders, reminders.advanceNoticeHours);
        await m.addColumn(reminders, reminders.advanceNoticeMinutes);
      }
      // The optional AI assistant (and its BYOK network calls) was
      // removed entirely — drop its tables rather than leaving them
      // orphaned. Only installs that passed through version 2+ ever had
      // these tables created in the first place (version 1 predates the
      // AI assistant), so this must not run unconditionally for `from < 5`
      // — a v1-to-v5 upgrade skipping straight past would hit "no such
      // table" trying to drop something that was never there.
      if (from >= 2 && from < 5) {
        await m.deleteTable('ai_settings');
        await m.deleteTable('ai_chat_history');
      }
      if (from < 6) {
        await m.addColumn(reminders, reminders.dailyExclusionType);
        await m.addColumn(reminders, reminders.dailyExclusionValue);
      }
      // Loans/installments (the "trả góp" feature) were removed outright —
      // the user's bank/creditor already reminds them, so the app doing it
      // too was redundant. Drop the tables rather than leaving them
      // orphaned; `from < 7`'s reminderTime column add is moot once the
      // table it targeted no longer exists in the schema at all.
      if (from < 8) {
        await m.deleteTable('loan_installments');
        await m.deleteTable('loans');
      }
    },
  );

  /// Returns the inserted (or, if seeding was already done, existing)
  /// default category ids in [kDefaultCategories] order, so callers can
  /// key off a specific default (e.g. Finance) without depending on its
  /// name — which is locale-dependent and freely renameable by the user.
  Future<List<int>> _seedDefaultCategories() async {
    final existing = await select(categories).get();
    if (existing.isNotEmpty) {
      return existing.map((c) => c.id).toList();
    }
    final now = DateTime.now();
    // Runs on first DB access, before app.dart has resolved+saved a
    // locale into settings (that read is itself what triggers this), so
    // the device's raw system locale is the only signal available here —
    // resolved through the same kSupportedLocales matching app.dart uses,
    // so the seeded names end up in whatever language onboarding will
    // actually show.
    final locale = resolveInitialLocale(PlatformDispatcher.instance.locale);
    final l10n = lookupAppLocalizations(locale);
    final ids = <int>[];
    for (var i = 0; i < kDefaultCategories.length; i++) {
      final (nameOf, icon, color) = kDefaultCategories[i];
      final id = await into(categories).insert(
        CategoriesCompanion.insert(
          name: nameOf(l10n),
          icon: icon,
          color: color,
          sortOrder: Value(i),
          isSystemDefault: const Value(true),
          createdAt: now,
        ),
      );
      ids.add(id);
    }
    return ids;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ireminder.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
