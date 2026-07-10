import 'dart:convert';

import 'package:drift/drift.dart';

import '../database/app_database.dart';

class AiSettingsRepository {
  final AppDatabase _db;

  AiSettingsRepository(this._db);

  Stream<AiSetting> watch() {
    return (_db.select(_db.aiSettings)..where((s) => s.id.equals(1)))
        .watchSingle();
  }

  Future<AiSetting> get() {
    return (_db.select(_db.aiSettings)..where((s) => s.id.equals(1)))
        .getSingle();
  }

  Set<int> allowedCategoryIds(AiSetting settings) {
    final decoded = jsonDecode(settings.allowedCategoryIds) as List;
    return decoded.cast<int>().toSet();
  }

  Future<void> setEnabled(bool enabled) => _patch(
        AiSettingsCompanion(isEnabled: Value(enabled)),
      );

  Future<void> setProvider(String providerId, String defaultModel) => _patch(
        AiSettingsCompanion(
          providerId: Value(providerId),
          modelName: Value(defaultModel),
        ),
      );

  Future<void> setModel(String model) => _patch(
        AiSettingsCompanion(modelName: Value(model)),
      );

  Future<void> setAllowedCategoryIds(Set<int> ids) => _patch(
        AiSettingsCompanion(
          allowedCategoryIds: Value(jsonEncode(ids.toList())),
        ),
      );

  Future<void> _patch(AiSettingsCompanion companion) {
    return (_db.update(_db.aiSettings)..where((s) => s.id.equals(1)))
        .write(companion);
  }
}
