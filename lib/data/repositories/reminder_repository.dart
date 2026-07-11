import 'package:drift/drift.dart';

import '../../core/utils/lunar_converter.dart';
import '../../core/utils/recurrence_calculator.dart';
import '../../domain/enums/recurrence_type.dart';
import '../../domain/enums/loan_frequency.dart' show ReminderLogAction;
import '../../domain/models/recurrence_params.dart';
import '../database/app_database.dart';

int _daysInMonth(int year, int month) {
  final firstOfNextMonth = month == 12
      ? DateTime(year + 1, 1, 1)
      : DateTime(year, month + 1, 1);
  return firstOfNextMonth.subtract(const Duration(days: 1)).day;
}

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
    return (_db.select(
      _db.reminders,
    )..where((r) => r.categoryId.equals(categoryId))).watch();
  }

  Future<Reminder?> getById(int id) {
    return (_db.select(
      _db.reminders,
    )..where((r) => r.id.equals(id))).getSingleOrNull();
  }

  Stream<Reminder?> watchById(int id) {
    return (_db.select(
      _db.reminders,
    )..where((r) => r.id.equals(id))).watchSingleOrNull();
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

  /// First occurrence for the reminder being created/edited.
  ///
  /// [RecurrenceType.weekly]/[monthly]/[yearly]/[lunarYearly] carry their
  /// own day/month/weekday anchor independent of [startDate] (the form
  /// lets a user set e.g. a lunar day/month with an unrelated start date,
  /// such as "today" from the calendar's "+" prefill) — for those,
  /// [startDate] is only a lower bound, and the actual due date must
  /// respect the rule's anchor via [calculateFirstOccurrenceOnOrAfter].
  ///
  /// [RecurrenceType.none]/[daily]/[customIntervalDays] have no such
  /// anchor: their first occurrence is [startDate] itself unless it
  /// already passed, in which case roll forward once.
  DateTime _firstOccurrence(RecurrenceParams params, DateTime startDate) {
    switch (params.type) {
      case RecurrenceType.none:
      case RecurrenceType.daily:
      case RecurrenceType.customIntervalDays:
        final alreadyPassed = startDate.isBefore(
          DateTime.now().subtract(const Duration(days: 1)),
        );
        return alreadyPassed
            ? calculateNextDueDate(params, startDate)
            : startDate;
      case RecurrenceType.weekly:
      case RecurrenceType.monthly:
      case RecurrenceType.yearly:
      case RecurrenceType.lunarYearly:
        return calculateFirstOccurrenceOnOrAfter(params, startDate);
    }
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
    final nextDue = _firstOccurrence(params, startDate);

    return _db
        .into(_db.reminders)
        .insert(
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

  /// Recomputes `next_due_date` whenever the edit changed a
  /// recurrence-affecting field (type/interval/day/month/weekday/start
  /// date). Otherwise leaves it untouched — a reminder that's already
  /// progressed through several cycles must not have its schedule rewound
  /// just because the user edited its title.
  Future<void> update(Reminder reminder) async {
    final existing = await getById(reminder.id);
    if (existing == null) {
      throw ArgumentError('Reminder ${reminder.id} not found');
    }
    final recurrenceChanged =
        existing.recurrenceType != reminder.recurrenceType ||
        existing.recurrenceInterval != reminder.recurrenceInterval ||
        existing.recurrenceDay != reminder.recurrenceDay ||
        existing.recurrenceMonth != reminder.recurrenceMonth ||
        existing.recurrenceWeekday != reminder.recurrenceWeekday ||
        existing.startDate != reminder.startDate;

    final toSave = recurrenceChanged
        ? reminder.copyWith(
            nextDueDate: _firstOccurrence(
              paramsOf(reminder),
              reminder.startDate,
            ),
            updatedAt: DateTime.now(),
          )
        : reminder.copyWith(updatedAt: DateTime.now());

    await _db.update(_db.reminders).replace(toSave);
  }

  Future<void> delete(int id) {
    return (_db.delete(_db.reminders)..where((r) => r.id.equals(id))).go();
  }

  /// Self-heal for reminders whose `next_due_date` was set by a fixed
  /// bug: yearly/lunar-yearly reminders created with a start date that
  /// hadn't "passed" yet got `next_due_date` set to that start date
  /// itself, ignoring the day/month the user actually entered. Only
  /// touches rows whose stored due date doesn't match what their own
  /// day/month rule implies — a reminder that's simply overdue (rule
  /// satisfied, date just in the past) is left alone, so this never
  /// erases a legitimately-overdue reminder by fast-forwarding it.
  Future<void> healStaleYearlyDueDates() async {
    final all = await (_db.select(
      _db.reminders,
    )..where((r) => r.isActive.equals(true) & r.snoozeUntil.isNull())).get();
    for (final r in all) {
      final type = RecurrenceType.fromDbValue(r.recurrenceType);
      if (type != RecurrenceType.yearly && type != RecurrenceType.lunarYearly) {
        continue;
      }
      if (r.recurrenceDay == null || r.recurrenceMonth == null) continue;
      if (_dueDateMatchesRule(
        r.nextDueDate,
        type,
        r.recurrenceDay!,
        r.recurrenceMonth!,
      )) {
        continue;
      }
      final corrected = calculateFirstOccurrenceOnOrAfter(
        paramsOf(r),
        r.startDate,
      );
      await (_db.update(_db.reminders)..where((t) => t.id.equals(r.id))).write(
        RemindersCompanion(nextDueDate: Value(corrected)),
      );
    }
  }

  bool _dueDateMatchesRule(
    DateTime dueDate,
    RecurrenceType type,
    int day,
    int month,
  ) {
    if (type == RecurrenceType.yearly) {
      final expectedDay = day.clamp(1, _daysInMonth(dueDate.year, month));
      return dueDate.month == month && dueDate.day == expectedDay;
    }
    final lunar = LunarConverter.solarToLunar(dueDate);
    return lunar.day == day && lunar.month == month;
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

    await _db
        .into(_db.reminderLogs)
        .insert(
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
    await _db
        .into(_db.reminderLogs)
        .insert(
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
