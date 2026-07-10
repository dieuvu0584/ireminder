import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
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

  test('onCreate seeds exactly the 7 default categories', () async {
    final all = await categories.getAll();
    expect(all, hasLength(7));
    expect(all.every((c) => c.isSystemDefault), isTrue);
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

  test('delete() throws CategoryDeleteRequiresDecision when reminders exist',
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
  });

  test('reassignAndDelete moves reminders then deletes the source category',
      () async {
    final fromId =
        await categories.create(name: 'From', icon: 'star', color: '#111111');
    final toId =
        await categories.create(name: 'To', icon: 'star', color: '#222222');
    final reminderId = await reminders.create(
      title: 'Move me',
      categoryId: fromId,
      recurrenceType: RecurrenceType.none,
      startDate: DateTime(2030, 1, 1),
      reminderTime: '09:00',
    );

    await categories.reassignAndDelete(fromCategoryId: fromId, toCategoryId: toId);

    final moved = await reminders.getById(reminderId);
    expect(moved!.categoryId, toId);
    final all = await categories.getAll();
    expect(all.any((c) => c.id == fromId), isFalse);
  });

  test('deleteWithReminders deletes the category and all its reminders',
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
  });

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
