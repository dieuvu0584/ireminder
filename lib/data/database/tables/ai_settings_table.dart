import 'package:drift/drift.dart';

/// Single-row table (id is always 1). The actual API key never lives here —
/// it's in flutter_secure_storage (Android Keystore), keyed per provider_id.
/// `apiKeyEncrypted` exists only per PROMPT.md §9.5's schema and is never
/// populated; it's a reference placeholder, not the real secret.
class AiSettings extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  BoolColumn get isEnabled => boolean().withDefault(const Constant(false))();
  TextColumn get providerId => text().nullable()();
  TextColumn get modelName => text().nullable()();
  TextColumn get apiKeyEncrypted => text().nullable()();

  /// JSON array of category ids allowed into the AI context. Defaults to
  /// "[]" here only as the column-level fallback (e.g. for rows that
  /// bypass the app's own seeding); the app's actual initial value —
  /// every default category except Finance — is set explicitly at
  /// account creation in AppDatabase.onCreate, keyed by category id
  /// rather than name so a rename doesn't change what's shared. The user
  /// can adjust the set anytime in Settings > Assistant.
  TextColumn get allowedCategoryIds =>
      text().withDefault(const Constant('[]'))();

  @override
  Set<Column> get primaryKey => {id};
}
