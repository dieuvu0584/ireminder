import 'package:flutter_test/flutter_test.dart';
import 'package:ireminder/core/utils/reminder_due_time.dart';
import 'package:ireminder/data/database/app_database.dart';
import 'package:ireminder/domain/enums/recurrence_type.dart';

Reminder _reminder({
  required DateTime nextDueDate,
  String reminderTime = '09:00',
  DateTime? snoozeUntil,
}) {
  final now = DateTime(2026, 1, 1);
  return Reminder(
    id: 1,
    title: 'Exercise',
    categoryId: 1,
    recurrenceType: RecurrenceType.daily.dbValue,
    isLunar: false,
    startDate: now,
    nextDueDate: nextDueDate,
    reminderTime: reminderTime,
    advanceNoticeDays: 0,
    advanceNoticeHours: 0,
    advanceNoticeMinutes: 0,
    isActive: true,
    snoozeUntil: snoozeUntil,
    createdAt: now,
    updatedAt: now,
  );
}

void main() {
  group('dueDateTimeForDay', () {
    test(
      'a day other than the stored occurrence combines that day with reminderTime',
      () {
        final r = _reminder(
          nextDueDate: DateTime(2026, 7, 24),
          reminderTime: '09:00',
        );

        // The Calendar screen projects a daily reminder onto every day in
        // the browsed month — each projected day must get its own date,
        // not the one stored on the reminder's single nextDueDate field.
        expect(
          dueDateTimeForDay(r, DateTime(2026, 7, 25)),
          DateTime(2026, 7, 25, 9, 0),
        );
        expect(
          dueDateTimeForDay(r, DateTime(2026, 7, 31)),
          DateTime(2026, 7, 31, 9, 0),
        );
      },
    );

    test(
      'the stored occurrence\'s own day matches effectiveReminderDueDateTime',
      () {
        final r = _reminder(
          nextDueDate: DateTime(2026, 7, 24),
          reminderTime: '09:00',
        );

        expect(
          dueDateTimeForDay(r, DateTime(2026, 7, 24)),
          effectiveReminderDueDateTime(r),
        );
      },
    );

    test('a snoozed reminder keeps its precise snooze time on its own day', () {
      final r = _reminder(
        nextDueDate: DateTime(2026, 7, 24),
        reminderTime: '09:00',
        snoozeUntil: DateTime(2026, 7, 24, 14, 30),
      );

      expect(
        dueDateTimeForDay(r, DateTime(2026, 7, 24)),
        DateTime(2026, 7, 24, 14, 30),
      );
    });
  });
}
