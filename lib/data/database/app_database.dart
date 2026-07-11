import 'dart:convert';
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
import 'tables/loans_table.dart';
import 'tables/loan_installments_table.dart';
import 'tables/app_settings_table.dart';
import 'tables/ai_settings_table.dart';
import 'tables/ai_chat_history_table.dart';

part 'app_database.g.dart';

/// Name is resolved from the device's locale at seed time (see
/// [AppDatabase._seedDefaultCategories]) rather than hardcoded — these run
/// once, before Settings has a saved locale of its own, so this list only
/// carries the parts that don't need translating.
const List<(String Function(AppLocalizations), String icon, String color)>
kDefaultCategories = [
  (_nameHomeAppliances, 'home_repair_service', '#3B82F6'),
  (_nameVehicles, 'directions_car', '#F97316'),
  (_nameFamilyEvents, 'self_improvement', '#8B5CF6'),
  (_nameFinance, 'payments', '#10B981'),
  (_nameWork, 'work', '#6366F1'),
  (_nameFamily, 'favorite', '#EC4899'),
  (_nameOutdoorEvents, 'hiking', '#F59E0B'),
  (_nameHealth, 'favorite', '#22C55E'),
  (_nameBirthday, 'cake', '#F43F5E'),
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
      final categoryIds = await _seedDefaultCategories();
      await into(appSettings).insert(const AppSettingsCompanion());
      // Default to sharing every category with the AI assistant
      // except Finance (kDefaultCategories[3]) — a usable assistant
      // out of the box, while keeping financial data opted-out until
      // the user explicitly turns it on themselves in Settings.
      final financeId = categoryIds[3];
      final allowedIds = categoryIds.where((id) => id != financeId).toList();
      await into(aiSettings).insert(
        AiSettingsCompanion(allowedCategoryIds: Value(jsonEncode(allowedIds))),
      );
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
        await m.addColumn(appSettings, appSettings.notificationSoundEnabled);
        await m.addColumn(
          appSettings,
          appSettings.notificationVibrationEnabled,
        );
        await m.addColumn(appSettings, appSettings.snoozeDurationMinutes);
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
