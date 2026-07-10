import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/app_database.dart';
import 'repository_providers.dart';

final categoriesStreamProvider = StreamProvider<List<Category>>((ref) {
  return ref.watch(categoryRepositoryProvider).watchAll();
});

final categoryActionsProvider = Provider<CategoryActions>((ref) {
  return CategoryActions(ref);
});

class CategoryActions {
  final Ref _ref;
  CategoryActions(this._ref);

  Future<int> create({
    required String name,
    required String icon,
    required String color,
  }) {
    return _ref.read(categoryRepositoryProvider).create(
          name: name,
          icon: icon,
          color: color,
        );
  }

  Future<void> update(Category category) {
    return _ref.read(categoryRepositoryProvider).update(category);
  }

  Future<void> reorder(List<int> orderedIds) {
    return _ref.read(categoryRepositoryProvider).reorder(orderedIds);
  }

  Future<int> countReminders(int categoryId) {
    return _ref.read(categoryRepositoryProvider).countReminders(categoryId);
  }

  Future<void> delete(int categoryId) {
    return _ref.read(categoryRepositoryProvider).delete(categoryId);
  }

  Future<void> reassignAndDelete({
    required int fromCategoryId,
    required int toCategoryId,
  }) {
    return _ref.read(categoryRepositoryProvider).reassignAndDelete(
          fromCategoryId: fromCategoryId,
          toCategoryId: toCategoryId,
        );
  }

  Future<void> deleteWithReminders(int categoryId) {
    return _ref
        .read(categoryRepositoryProvider)
        .deleteWithReminders(categoryId);
  }
}
