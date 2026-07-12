import 'package:drift/drift.dart' show Value;
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

  group('healStaleYearlyDueDates', () {
    test('corrects a lunar-yearly reminder stuck on its start date', () async {
      final today = DateTime.now();
      final todayDateOnly = DateTime(today.year, today.month, today.day);
      final tomorrow = todayDateOnly.add(const Duration(days: 1));
      final tomorrowLunar = LunarConverter.solarToLunar(tomorrow);
      final now = DateTime.now();

      // Simulate the pre-fix bug directly (bypassing the now-fixed
      // create()): next_due_date == startDate, ignoring the lunar rule.
      final id = await db
          .into(db.reminders)
          .insert(
            RemindersCompanion.insert(
              title: 'Death anniversary',
              categoryId: categoryId,
              recurrenceType: RecurrenceType.lunarYearly.dbValue,
              recurrenceDay: Value(tomorrowLunar.day),
              recurrenceMonth: Value(tomorrowLunar.month),
              isLunar: const Value(true),
              startDate: todayDateOnly,
              nextDueDate: todayDateOnly,
              reminderTime: '09:00',
              createdAt: now,
              updatedAt: now,
            ),
          );

      await reminders.healStaleYearlyDueDates();

      final healed = await reminders.getById(id);
      expect(healed!.nextDueDate, tomorrow);
    });

    test(
      'leaves a correctly-scheduled but overdue reminder untouched',
      () async {
        // The rule *is* satisfied here — it's just in the past, meaning the
        // user simply hasn't completed it yet. Must not be "fixed" into the
        // future, which would silently erase a legitimately overdue item.
        final pastDue = DateTime(2020, 3, 15);
        final now = DateTime.now();
        final id = await db
            .into(db.reminders)
            .insert(
              RemindersCompanion.insert(
                title: 'Overdue yearly thing',
                categoryId: categoryId,
                recurrenceType: RecurrenceType.yearly.dbValue,
                recurrenceDay: const Value(15),
                recurrenceMonth: const Value(3),
                startDate: DateTime(2019, 3, 15),
                nextDueDate: pastDue,
                reminderTime: '09:00',
                createdAt: now,
                updatedAt: now,
              ),
            );

        await reminders.healStaleYearlyDueDates();

        final unchanged = await reminders.getById(id);
        expect(unchanged!.nextDueDate, pastDue);
      },
    );
  });

  test(
    'watchAll() includes a completed (inactive) one-off reminder, unlike watchActive()',
    () async {
      final id = await reminders.create(
        title: 'One-off task',
        categoryId: categoryId,
        recurrenceType: RecurrenceType.none,
        startDate: DateTime.now().add(const Duration(days: 1)),
        reminderTime: '08:00',
      );
      await reminders.complete(id);

      final active = await reminders.watchActive().first;
      expect(active.any((r) => r.id == id), isFalse);

      final all = await reminders.watchAll().first;
      final completed = all.firstWhere((r) => r.id == id);
      expect(completed.isActive, isFalse);
    },
  );

  test(
    'watchCompletedLogs() returns only completed-action logs, most recent first',
    () async {
      final id = await reminders.create(
        title: 'Recurring task',
        categoryId: categoryId,
        recurrenceType: RecurrenceType.daily,
        startDate: DateTime(2026, 1, 1),
        reminderTime: '08:00',
      );
      await reminders.complete(id);
      await reminders.snooze(id, DateTime.now().add(const Duration(hours: 1)));
      await reminders.complete(id);

      final logs = await reminders.watchCompletedLogs().first;
      expect(logs.every((l) => l.action == 'completed'), isTrue);
      expect(logs.length, 2);
      expect(
        logs.first.completedAt.isAfter(logs.last.completedAt) ||
            logs.first.completedAt.isAtSameMomentAs(logs.last.completedAt),
        isTrue,
      );
    },
  );

  group('autoSkipOverdue', () {
    test(
      'advances a recurring reminder past its missed day and logs it as skipped, not completed',
      () async {
        final now = DateTime.now();
        final yesterday = DateTime(
          now.year,
          now.month,
          now.day,
        ).subtract(const Duration(days: 1));
        final id = await db
            .into(db.reminders)
            .insert(
              RemindersCompanion.insert(
                title: 'Water plants',
                categoryId: categoryId,
                recurrenceType: RecurrenceType.daily.dbValue,
                startDate: yesterday,
                nextDueDate: yesterday,
                reminderTime: '08:00',
                createdAt: now,
                updatedAt: now,
              ),
            );

        await reminders.autoSkipOverdue();

        final updated = await reminders.getById(id);
        expect(updated!.isActive, isTrue);
        expect(
          updated.nextDueDate.isBefore(DateTime(now.year, now.month, now.day)),
          isFalse,
        );

        final skipped = await reminders.watchSkippedLogs().first;
        expect(skipped, hasLength(1));
        expect(skipped.first.reminderId, id);
        final completed = await reminders.watchCompletedLogs().first;
        expect(completed, isEmpty);
      },
    );

    test(
      'deactivates a one-off reminder past its missed day without marking it completed',
      () async {
        final now = DateTime.now();
        final yesterday = DateTime(
          now.year,
          now.month,
          now.day,
        ).subtract(const Duration(days: 1));
        final id = await db
            .into(db.reminders)
            .insert(
              RemindersCompanion.insert(
                title: 'One-off errand',
                categoryId: categoryId,
                recurrenceType: RecurrenceType.none.dbValue,
                startDate: yesterday,
                nextDueDate: yesterday,
                reminderTime: '08:00',
                createdAt: now,
                updatedAt: now,
              ),
            );

        await reminders.autoSkipOverdue();

        final updated = await reminders.getById(id);
        expect(updated!.isActive, isFalse);

        final skipped = await reminders.watchSkippedLogs().first;
        expect(skipped.map((l) => l.reminderId), contains(id));
        final completed = await reminders.watchCompletedLogs().first;
        expect(completed.map((l) => l.reminderId), isNot(contains(id)));
      },
    );

    test('leaves a reminder due later today untouched', () async {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final id = await reminders.create(
        title: 'Take medicine',
        categoryId: categoryId,
        recurrenceType: RecurrenceType.daily,
        startDate: today,
        reminderTime: '23:59',
      );

      await reminders.autoSkipOverdue();

      final unchanged = await reminders.getById(id);
      expect(unchanged!.nextDueDate, today);
      final skipped = await reminders.watchSkippedLogs().first;
      expect(skipped, isEmpty);
    });

    test(
      'skips a reminder whose snooze target has also passed, clearing the snooze',
      () async {
        final now = DateTime.now();
        final yesterday = DateTime(
          now.year,
          now.month,
          now.day,
        ).subtract(const Duration(days: 1));
        final id = await db
            .into(db.reminders)
            .insert(
              RemindersCompanion.insert(
                title: 'Snoozed and forgotten',
                categoryId: categoryId,
                recurrenceType: RecurrenceType.daily.dbValue,
                startDate: yesterday,
                nextDueDate: yesterday,
                snoozeUntil: Value(yesterday.add(const Duration(hours: 20))),
                reminderTime: '08:00',
                createdAt: now,
                updatedAt: now,
              ),
            );

        await reminders.autoSkipOverdue();

        final updated = await reminders.getById(id);
        expect(updated!.snoozeUntil, isNull);
        expect(
          updated.nextDueDate.isBefore(DateTime(now.year, now.month, now.day)),
          isFalse,
        );
      },
    );
  });
}
