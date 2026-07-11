import 'dart:convert';
import 'dart:ui' show Locale;

import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ireminder/core/localization/gen/app_localizations.dart';
import 'package:ireminder/data/database/app_database.dart';
import 'package:ireminder/data/repositories/category_repository.dart';
import 'package:ireminder/data/repositories/reminder_repository.dart';
import 'package:ireminder/domain/enums/recurrence_type.dart';

void main() {
  late AppDatabase db;
  late CategoryRepository categories;
  late ReminderRepository reminders;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    categories = CategoryRepository(db);
    reminders = ReminderRepository(db);
  });

  tearDown(() => db.close());

  test('onCreate seeds exactly the 8 default categories', () async {
    final all = await categories.getAll();
    expect(all, hasLength(8));
    expect(all.every((c) => c.isSystemDefault), isTrue);
  });

  test(
    'AI assistant defaults to allowing every category except Finance',
    () async {
      final all = await categories.getAll();
      final financeCategory = all[3]; // kDefaultCategories[3] is Finance
      final aiSettings = await db.select(db.aiSettings).getSingle();
      final allowedIds = (jsonDecode(aiSettings.allowedCategoryIds) as List)
          .cast<int>()
          .toSet();

      expect(allowedIds, hasLength(7));
      expect(allowedIds.contains(financeCategory.id), isFalse);
      expect(
        allowedIds,
        containsAll(
          all.where((c) => c.id != financeCategory.id).map((c) => c.id),
        ),
      );
    },
  );

  test('syncDefaultCategoryNames retranslates an untouched default category '
      'and leaves a renamed one alone', () async {
    final all = await categories.getAll();

    // Simulate the real-world case this exists for: a default category
    // seeded under one locale (here, whatever locale seeded it — likely
    // English in this test environment) needs to follow the user to a
    // different locale.
    final viL10n = lookupAppLocalizations(const Locale('vi'));
    await categories.syncDefaultCategoryNames(viL10n);
    var refreshed = await categories.getAll();
    expect(refreshed[3].name, viL10n.defaultCategoryFinance);

    // A category the user has personally renamed no longer matches any
    // known default name in any locale, so it must be left untouched.
    await (db.update(db.categories)..where((c) => c.id.equals(all[4].id)))
        .write(const CategoriesCompanion(name: Value('My custom work name')));
    final enL10n = lookupAppLocalizations(const Locale('en'));
    await categories.syncDefaultCategoryNames(enL10n);
    refreshed = await categories.getAll();
    expect(refreshed[4].name, 'My custom work name');
    expect(refreshed[3].name, enL10n.defaultCategoryFinance);
  });

  test('delete() removes an empty category outright', () async {
    final id = await categories.create(
      name: 'Test category',
      icon: 'star',
      color: '#000000',
    );

    await categories.delete(id);

    final all = await categories.getAll();
    expect(all.any((c) => c.id == id), isFalse);
  });

  test(
    'delete() throws CategoryDeleteRequiresDecision when reminders exist',
    () async {
      final catId = await categories.create(
        name: 'Has reminders',
        icon: 'star',
        color: '#000000',
      );
      await reminders.create(
        title: 'Some reminder',
        categoryId: catId,
        recurrenceType: RecurrenceType.none,
        startDate: DateTime(2030, 1, 1),
        reminderTime: '09:00',
      );

      expect(
        () => categories.delete(catId),
        throwsA(isA<CategoryDeleteRequiresDecision>()),
      );
    },
  );

  test(
    'reassignAndDelete moves reminders then deletes the source category',
    () async {
      final fromId = await categories.create(
        name: 'From',
        icon: 'star',
        color: '#111111',
      );
      final toId = await categories.create(
        name: 'To',
        icon: 'star',
        color: '#222222',
      );
      final reminderId = await reminders.create(
        title: 'Move me',
        categoryId: fromId,
        recurrenceType: RecurrenceType.none,
        startDate: DateTime(2030, 1, 1),
        reminderTime: '09:00',
      );

      await categories.reassignAndDelete(
        fromCategoryId: fromId,
        toCategoryId: toId,
      );

      final moved = await reminders.getById(reminderId);
      expect(moved!.categoryId, toId);
      final all = await categories.getAll();
      expect(all.any((c) => c.id == fromId), isFalse);
    },
  );

  test(
    'deleteWithReminders deletes the category and all its reminders',
    () async {
      final catId = await categories.create(
        name: 'Delete all',
        icon: 'star',
        color: '#333333',
      );
      final reminderId = await reminders.create(
        title: 'Goes away too',
        categoryId: catId,
        recurrenceType: RecurrenceType.none,
        startDate: DateTime(2030, 1, 1),
        reminderTime: '09:00',
      );

      await categories.deleteWithReminders(catId);

      final all = await categories.getAll();
      expect(all.any((c) => c.id == catId), isFalse);
      final reminder = await reminders.getById(reminderId);
      expect(reminder, isNull);
    },
  );

  test('never leaves category_id NULL: no orphan state exists', () async {
    // Schema itself enforces NOT NULL on reminders.category_id; this test
    // documents that the only supported delete paths (reassign / delete-all)
    // never attempt to null it out.
    final catId = await categories.create(
      name: 'Orphan check',
      icon: 'star',
      color: '#444444',
    );
    await reminders.create(
      title: 'r',
      categoryId: catId,
      recurrenceType: RecurrenceType.none,
      startDate: DateTime(2030, 1, 1),
      reminderTime: '09:00',
    );

    expect(
      () => categories.delete(catId),
      throwsA(isA<CategoryDeleteRequiresDecision>()),
    );
  });
}
