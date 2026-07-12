import 'package:flutter_test/flutter_test.dart';
import 'package:ireminder/core/utils/reminder_occurrence_builder.dart';
import 'package:ireminder/data/database/app_database.dart';
import 'package:ireminder/domain/enums/recurrence_type.dart';

Reminder _reminder({
  required int id,
  required RecurrenceType type,
  required DateTime nextDueDate,
  bool isActive = true,
  DateTime? snoozeUntil,
}) {
  final now = DateTime(2026, 1, 1);
  return Reminder(
    id: id,
    title: 'Reminder $id',
    categoryId: 1,
    recurrenceType: type.dbValue,
    isLunar: false,
    startDate: now,
    nextDueDate: nextDueDate,
    reminderTime: '08:00',
    advanceNoticeDays: 0,
    advanceNoticeHours: 0,
    advanceNoticeMinutes: 0,
    isActive: isActive,
    snoozeUntil: snoozeUntil,
    createdAt: now,
    updatedAt: now,
  );
}

ReminderLog _log({
  required int id,
  required int reminderId,
  required DateTime completedAt,
  required String action,
}) {
  return ReminderLog(
    id: id,
    reminderId: reminderId,
    completedAt: completedAt,
    action: action,
  );
}

void main() {
  final today = DateTime(2026, 7, 12);
  final tomorrow = DateTime(2026, 7, 13);
  final yesterday = DateTime(2026, 7, 11);

  test(
    'an active reminder appears at its own next_due_date, not completed, not historical',
    () {
      final r = _reminder(
        id: 1,
        type: RecurrenceType.daily,
        nextDueDate: today,
      );

      final byDay = buildOccurrencesByDay(
        reminders: [r],
        completedLogs: const [],
        skippedLogs: const [],
      );

      final entries = byDay[today]!;
      expect(entries, hasLength(1));
      expect(entries.single.completed, isFalse);
      expect(entries.single.historical, isFalse);
    },
  );

  test(
    'a completed one-off reminder shows at its due day as completed and historical, without a duplicate log entry',
    () {
      final r = _reminder(
        id: 2,
        type: RecurrenceType.none,
        nextDueDate: today,
        isActive: false,
      );
      final log = _log(
        id: 1,
        reminderId: 2,
        completedAt: today,
        action: 'completed',
      );

      final byDay = buildOccurrencesByDay(
        reminders: [r],
        completedLogs: [log],
        skippedLogs: const [],
      );

      final entries = byDay[today]!;
      expect(entries, hasLength(1));
      expect(entries.single.completed, isTrue);
      expect(entries.single.historical, isTrue);
    },
  );

  test(
    'a skipped one-off reminder shows as historical but not completed (gray, not green)',
    () {
      final r = _reminder(
        id: 3,
        type: RecurrenceType.none,
        nextDueDate: yesterday,
        isActive: false,
      );
      final log = _log(
        id: 1,
        reminderId: 3,
        completedAt: yesterday,
        action: 'skipped',
      );

      final byDay = buildOccurrencesByDay(
        reminders: [r],
        completedLogs: const [],
        skippedLogs: [log],
      );

      final entries = byDay[yesterday]!;
      expect(entries, hasLength(1));
      expect(entries.single.completed, isFalse);
      expect(entries.single.historical, isTrue);
    },
  );

  test(
    'a recurring reminder completed today but already advanced to tomorrow shows on both days',
    () {
      final r = _reminder(
        id: 4,
        type: RecurrenceType.daily,
        nextDueDate: tomorrow,
      );
      final log = _log(
        id: 1,
        reminderId: 4,
        completedAt: today,
        action: 'completed',
      );

      final byDay = buildOccurrencesByDay(
        reminders: [r],
        completedLogs: [log],
        skippedLogs: const [],
      );

      final todayEntries = byDay[today]!;
      expect(todayEntries, hasLength(1));
      expect(todayEntries.single.completed, isTrue);
      expect(todayEntries.single.historical, isTrue);

      final tomorrowEntries = byDay[tomorrow]!;
      expect(tomorrowEntries, hasLength(1));
      expect(tomorrowEntries.single.completed, isFalse);
      expect(tomorrowEntries.single.historical, isFalse);
    },
  );

  test('a snoozed reminder is keyed by snooze_until, not next_due_date', () {
    final snoozeTarget = DateTime(2026, 7, 12, 15, 0);
    final r = _reminder(
      id: 5,
      type: RecurrenceType.daily,
      nextDueDate: yesterday,
      snoozeUntil: snoozeTarget,
    );

    final byDay = buildOccurrencesByDay(
      reminders: [r],
      completedLogs: const [],
      skippedLogs: const [],
    );

    expect(byDay.containsKey(yesterday), isFalse);
    expect(byDay[today], hasLength(1));
  });
}
