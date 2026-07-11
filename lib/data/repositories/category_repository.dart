import 'dart:ui' show Locale;

import 'package:drift/drift.dart';

import '../../core/localization/gen/app_localizations.dart';
import '../../core/localization/supported_locales.dart';
import '../database/app_database.dart';

class CategoryDeleteRequiresDecision implements Exception {
  final int reminderCount;
  CategoryDeleteRequiresDecision(this.reminderCount);
}

class CategoryRepository {
  final AppDatabase _db;

  CategoryRepository(this._db);

  Stream<List<Category>> watchAll() {
    return (_db.select(
      _db.categories,
    )..orderBy([(c) => OrderingTerm.asc(c.sortOrder)])).watch();
  }

  Future<List<Category>> getAll() {
    return (_db.select(
      _db.categories,
    )..orderBy([(c) => OrderingTerm.asc(c.sortOrder)])).get();
  }

  Future<int> create({
    required String name,
    required String icon,
    required String color,
  }) async {
    final maxSort = await _db
        .customSelect(
          'SELECT COALESCE(MAX(sort_order), -1) AS m FROM categories',
        )
        .getSingle();
    final nextSort = (maxSort.data['m'] as int) + 1;
    return _db
        .into(_db.categories)
        .insert(
          CategoriesCompanion.insert(
            name: name,
            icon: icon,
            color: color,
            sortOrder: Value(nextSort),
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<void> update(Category category) {
    return _db.update(_db.categories).replace(category);
  }

  Future<void> reorder(List<int> orderedCategoryIds) async {
    await _db.transaction(() async {
      for (var i = 0; i < orderedCategoryIds.length; i++) {
        await (_db.update(_db.categories)
              ..where((c) => c.id.equals(orderedCategoryIds[i])))
            .write(CategoriesCompanion(sortOrder: Value(i)));
      }
    });
  }

  /// Default categories are seeded once, in whatever locale was active at
  /// the time (see [AppDatabase._seedDefaultCategories]) — an app update
  /// that changes those translations, or the user switching languages
  /// later, can't retroactively change a name already written to the DB.
  /// This re-syncs any [Category.isSystemDefault] row whose current name
  /// still exactly matches that slot's default name in *some* supported
  /// locale (i.e. the user never renamed it) to [l10n]'s name for that
  /// slot. A category the user has personally renamed no longer matches
  /// any known default name and is left untouched.
  Future<void> syncDefaultCategoryNames(AppLocalizations l10n) async {
    final all = await getAll();
    for (final category in all) {
      if (!category.isSystemDefault) continue;
      final slot = _defaultSlotForName(category.name);
      if (slot == null) continue;
      final target = kDefaultCategories[slot].$1(l10n);
      if (target != category.name) {
        await (_db.update(_db.categories)
              ..where((c) => c.id.equals(category.id)))
            .write(CategoriesCompanion(name: Value(target)));
      }
    }
  }

  int? _defaultSlotForName(String name) {
    for (final locale in kSupportedLocales) {
      final l10n = lookupAppLocalizations(Locale(locale.code));
      for (var i = 0; i < kDefaultCategories.length; i++) {
        if (kDefaultCategories[i].$1(l10n) == name) return i;
      }
    }
    return null;
  }

  Future<int> countReminders(int categoryId) async {
    final query = _db.selectOnly(_db.reminders)
      ..addColumns([_db.reminders.id.count()])
      ..where(_db.reminders.categoryId.equals(categoryId));
    final row = await query.getSingle();
    return row.read(_db.reminders.id.count()) ?? 0;
  }

  /// Deletes a category outright. Throws [CategoryDeleteRequiresDecision] if
  /// reminders still reference it — caller must resolve via
  /// [reassignAndDelete] or [deleteWithReminders] instead.
  Future<void> delete(int categoryId) async {
    final count = await countReminders(categoryId);
    if (count > 0) {
      throw CategoryDeleteRequiresDecision(count);
    }
    await (_db.delete(
      _db.categories,
    )..where((c) => c.id.equals(categoryId))).go();
  }

  Future<void> reassignAndDelete({
    required int fromCategoryId,
    required int toCategoryId,
  }) async {
    await _db.transaction(() async {
      await (_db.update(_db.reminders)
            ..where((r) => r.categoryId.equals(fromCategoryId)))
          .write(RemindersCompanion(categoryId: Value(toCategoryId)));
      await (_db.delete(
        _db.categories,
      )..where((c) => c.id.equals(fromCategoryId))).go();
    });
  }

  Future<void> deleteWithReminders(int categoryId) async {
    await _db.transaction(() async {
      await (_db.delete(
        _db.reminders,
      )..where((r) => r.categoryId.equals(categoryId))).go();
      await (_db.delete(
        _db.categories,
      )..where((c) => c.id.equals(categoryId))).go();
    });
  }
}
