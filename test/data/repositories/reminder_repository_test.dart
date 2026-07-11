import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ireminder/core/utils/lunar_converter.dart';
import 'package:ireminder/data/database/app_database.dart';
import 'package:ireminder/data/repositories/category_repository.dart';
import 'package:ireminder/data/repositories/reminder_repository.dart';
import 'package:ireminder/domain/enums/recurrence_type.dart';

void main() {
  late AppDatabase db;
  late ReminderRepository reminders;
  late CategoryRepository categories;
  late int categoryId;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    reminders = ReminderRepository(db);
    categories = CategoryRepository(db);
    // onCreate seeds default categories; grab the first one.
    final all = await categories.getAll();
    categoryId = all.first.id;
  });

  tearDown(() => db.close());

  test(
    'complete() on a daily reminder recomputes next_due_date and stays active',
    () async {
      final id = await reminders.create(
        title: 'Water plants',
        categoryId: categoryId,
        recurrenceType: RecurrenceType.daily,
        startDate: DateTime(2026, 1, 1),
        reminderTime: '08:00',
      );

      final updated = await reminders.complete(id);

      expect(updated.isActive, isTrue);
      final today = DateTime.now();
      final expected = DateTime(
        today.year,
        today.month,
        today.day,
      ).add(const Duration(days: 1));
      expect(updated.nextDueDate, expected);
    },
  );

  test('complete() on a one-off (none) reminder deactivates it', () async {
    final id = await reminders.create(
      title: 'Company picnic',
      categoryId: categoryId,
      recurrenceType: RecurrenceType.none,
      startDate: DateTime(2026, 8, 1),
      reminderTime: '09:00',
    );

    final updated = await reminders.complete(id);

    expect(updated.isActive, isFalse);
  });

  test('complete() writes a reminder_logs row', () async {
    final id = await reminders.create(
      title: 'Change AC filter',
      categoryId: categoryId,
      recurrenceType: RecurrenceType.customIntervalDays,
      recurrenceInterval: 90,
      startDate: DateTime(2026, 1, 1),
      reminderTime: '10:00',
    );

    await reminders.complete(id);

    final logs = await (db.select(
      db.reminderLogs,
    )..where((l) => l.reminderId.equals(id))).get();
    expect(logs, hasLength(1));
    expect(logs.first.action, 'completed');
  });

  test('snooze() sets snooze_until and logs a snoozed action', () async {
    final id = await reminders.create(
      title: 'Pay motorcycle insurance',
      categoryId: categoryId,
      recurrenceType: RecurrenceType.yearly,
      recurrenceDay: 15,
      recurrenceMonth: 6,
      startDate: DateTime(2026, 6, 15),
      reminderTime: '09:00',
    );
    final snoozeUntil = DateTime.now().add(const Duration(hours: 1));

    final updated = await reminders.snooze(id, snoozeUntil);

    expect(updated.snoozeUntil, snoozeUntil);
    final logs = await (db.select(
      db.reminderLogs,
    )..where((l) => l.reminderId.equals(id))).get();
    expect(logs.single.action, 'snoozed');
  });

  test('create() with a lunar-yearly reminder respects the lunar day/month '
      'even when startDate has not "passed" yet', () async {
    // Reproduces a reported bug: startDate defaults to today (e.g. via the
    // calendar's "+" prefill), and since "today" never counts as already
    // passed, next_due_date was wrongly set to startDate itself instead of
    // being derived from the lunar day/month at all.
    final today = DateTime.now();
    final todayDateOnly = DateTime(today.year, today.month, today.day);
    final tomorrow = todayDateOnly.add(const Duration(days: 1));
    final tomorrowLunar = LunarConverter.solarToLunar(tomorrow);

    final id = await reminders.create(
      title: 'Death anniversary',
      categoryId: categoryId,
      recurrenceType: RecurrenceType.lunarYearly,
      recurrenceDay: tomorrowLunar.day,
      recurrenceMonth: tomorrowLunar.month,
      isLunar: true,
      startDate: todayDateOnly,
      reminderTime: '09:00',
    );

    final saved = await reminders.getById(id);
    expect(saved!.nextDueDate, tomorrow);
  });

  test('create() with a yearly reminder respects the day/month even when '
      'startDate has not "passed" yet', () async {
    final today = DateTime.now();
    final todayDateOnly = DateTime(today.year, today.month, today.day);
    final tomorrow = todayDateOnly.add(const Duration(days: 1));

    final id = await reminders.create(
      title: "Mom's birthday",
      categoryId: categoryId,
      recurrenceType: RecurrenceType.yearly,
      recurrenceDay: tomorrow.day,
      recurrenceMonth: tomorrow.month,
      startDate: todayDateOnly,
      reminderTime: '09:00',
    );

    final saved = await reminders.getById(id);
    expect(saved!.nextDueDate, tomorrow);
  });
}
