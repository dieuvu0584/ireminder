import 'package:drift/drift.dart';

import '../../core/utils/recurrence_calculator.dart';
import '../../domain/enums/recurrence_type.dart';
import '../../domain/enums/loan_frequency.dart' show ReminderLogAction;
import '../../domain/models/recurrence_params.dart';
import '../database/app_database.dart';

class ReminderRepository {
  final AppDatabase _db;

  ReminderRepository(this._db);

  Stream<List<Reminder>> watchActive() {
    return (_db.select(_db.reminders)
          ..where((r) => r.isActive.equals(true))
          ..orderBy([(r) => OrderingTerm.asc(r.nextDueDate)]))
        .watch();
  }

  Stream<List<Reminder>> watchByCategory(int categoryId) {
    return (_db.select(_db.reminders)
          ..where((r) => r.categoryId.equals(categoryId)))
        .watch();
  }

  Future<Reminder?> getById(int id) {
    return (_db.select(_db.reminders)..where((r) => r.id.equals(id)))
        .getSingleOrNull();
  }

  RecurrenceParams paramsOf(Reminder r) {
    return RecurrenceParams(
      type: RecurrenceType.fromDbValue(r.recurrenceType),
      intervalDays: r.recurrenceInterval,
      day: r.recurrenceDay,
      month: r.recurrenceMonth,
      weekday: r.recurrenceWeekday,
    );
  }

  Future<int> create({
    required String title,
    String? description,
    required int categoryId,
    required RecurrenceType recurrenceType,
    int? recurrenceInterval,
    int? recurrenceDay,
    int? recurrenceMonth,
    int? recurrenceWeekday,
    bool isLunar = false,
    required DateTime startDate,
    required String reminderTime,
    int advanceNoticeDays = 0,
  }) async {
    final now = DateTime.now();
    final params = RecurrenceParams(
      type: recurrenceType,
      intervalDays: recurrenceInterval,
      day: recurrenceDay,
      month: recurrenceMonth,
      weekday: recurrenceWeekday,
    );
    // First occurrence is start_date itself unless it already passed for a
    // repeating rule, in which case roll forward once.
    final nextDue = recurrenceType == RecurrenceType.none
        ? startDate
        : (startDate.isAfter(DateTime.now().subtract(const Duration(days: 1)))
            ? startDate
            : calculateNextDueDate(params, startDate));

    return _db.into(_db.reminders).insert(
          RemindersCompanion.insert(
            title: title,
            description: Value(description),
            categoryId: categoryId,
            recurrenceType: recurrenceType.dbValue,
            recurrenceInterval: Value(recurrenceInterval),
            recurrenceDay: Value(recurrenceDay),
            recurrenceMonth: Value(recurrenceMonth),
            recurrenceWeekday: Value(recurrenceWeekday),
            isLunar: Value(isLunar),
            startDate: startDate,
            nextDueDate: nextDue,
            reminderTime: reminderTime,
            advanceNoticeDays: Value(advanceNoticeDays),
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  Future<void> update(Reminder reminder) {
    return _db.update(_db.reminders).replace(
          reminder.copyWith(updatedAt: DateTime.now()),
        );
  }

  Future<void> delete(int id) {
    return (_db.delete(_db.reminders)..where((r) => r.id.equals(id))).go();
  }

  /// Marks the reminder as completed today: logs it, recomputes
  /// `next_due_date`, and deactivates one-off (`none`) reminders.
  /// Returns the updated row so the caller (provider layer) can
  /// cancel/reschedule the associated notification.
  Future<Reminder> complete(int reminderId, {String? note}) async {
    final reminder = await getById(reminderId);
    if (reminder == null) {
      throw ArgumentError('Reminder $reminderId not found');
    }
    final now = DateTime.now();

    await _db.into(_db.reminderLogs).insert(
          ReminderLogsCompanion.insert(
            reminderId: reminderId,
            completedAt: now,
            action: ReminderLogAction.completed.dbValue,
            note: Value(note),
          ),
        );

    final type = RecurrenceType.fromDbValue(reminder.recurrenceType);
    if (type == RecurrenceType.none) {
      final updated = reminder.copyWith(isActive: false, updatedAt: now);
      await _db.update(_db.reminders).replace(updated);
      return updated;
    }

    final nextDue = calculateNextDueDate(paramsOf(reminder), now);
    final updated = reminder.copyWith(
      nextDueDate: nextDue,
      snoozeUntil: const Value(null),
      updatedAt: now,
    );
    await _db.update(_db.reminders).replace(updated);
    return updated;
  }

  Future<Reminder> snooze(int reminderId, DateTime snoozeUntil) async {
    final reminder = await getById(reminderId);
    if (reminder == null) {
      throw ArgumentError('Reminder $reminderId not found');
    }
    await _db.into(_db.reminderLogs).insert(
          ReminderLogsCompanion.insert(
            reminderId: reminderId,
            completedAt: DateTime.now(),
            action: ReminderLogAction.snoozed.dbValue,
          ),
        );
    final updated = reminder.copyWith(
      snoozeUntil: Value(snoozeUntil),
      updatedAt: DateTime.now(),
    );
    await _db.update(_db.reminders).replace(updated);
    return updated;
  }
}
