import 'package:drift/drift.dart';

import '../database/app_database.dart';

class CategoryDeleteRequiresDecision implements Exception {
  final int reminderCount;
  CategoryDeleteRequiresDecision(this.reminderCount);
}

class CategoryRepository {
  final AppDatabase _db;

  CategoryRepository(this._db);

  Stream<List<Category>> watchAll() {
    return (_db.select(_db.categories)
          ..orderBy([(c) => OrderingTerm.asc(c.sortOrder)]))
        .watch();
  }

  Future<List<Category>> getAll() {
    return (_db.select(_db.categories)
          ..orderBy([(c) => OrderingTerm.asc(c.sortOrder)]))
        .get();
  }

  Future<int> create({
    required String name,
    required String icon,
    required String color,
  }) async {
    final maxSort = await _db.customSelect(
      'SELECT COALESCE(MAX(sort_order), -1) AS m FROM categories',
    ).getSingle();
    final nextSort = (maxSort.data['m'] as int) + 1;
    return _db.into(_db.categories).insert(
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
    await (_db.delete(_db.categories)..where((c) => c.id.equals(categoryId)))
        .go();
  }

  Future<void> reassignAndDelete({
    required int fromCategoryId,
    required int toCategoryId,
  }) async {
    await _db.transaction(() async {
      await (_db.update(_db.reminders)
            ..where((r) => r.categoryId.equals(fromCategoryId)))
          .write(RemindersCompanion(categoryId: Value(toCategoryId)));
      await (_db.delete(_db.categories)
            ..where((c) => c.id.equals(fromCategoryId)))
          .go();
    });
  }

  Future<void> deleteWithReminders(int categoryId) async {
    await _db.transaction(() async {
      await (_db.delete(_db.reminders)
            ..where((r) => r.categoryId.equals(categoryId)))
          .go();
      await (_db.delete(_db.categories)..where((c) => c.id.equals(categoryId)))
          .go();
    });
  }
}
