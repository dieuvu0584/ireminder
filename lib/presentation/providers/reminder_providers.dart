import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/app_database.dart';
import '../../domain/enums/recurrence_type.dart';
import '../../domain/models/daily_exclusion.dart';
import 'notification_providers.dart';
import 'repository_providers.dart';

final activeRemindersStreamProvider = StreamProvider<List<Reminder>>((ref) {
  return ref.watch(reminderRepositoryProvider).watchActive();
});

final allRemindersStreamProvider = StreamProvider<List<Reminder>>((ref) {
  return ref.watch(reminderRepositoryProvider).watchAll();
});

final completedReminderLogsStreamProvider = StreamProvider<List<ReminderLog>>((
  ref,
) {
  return ref.watch(reminderRepositoryProvider).watchCompletedLogs();
});

final skippedReminderLogsStreamProvider = StreamProvider<List<ReminderLog>>((
  ref,
) {
  return ref.watch(reminderRepositoryProvider).watchSkippedLogs();
});

final remindersByCategoryStreamProvider =
    StreamProvider.family<List<Reminder>, int>((ref, categoryId) {
      return ref.watch(reminderRepositoryProvider).watchByCategory(categoryId);
    });

final reminderByIdStreamProvider = StreamProvider.family<Reminder?, int>((
  ref,
  id,
) {
  return ref.watch(reminderRepositoryProvider).watchById(id);
});

final reminderActionsProvider = Provider<ReminderActions>((ref) {
  return ReminderActions(ref);
});

class ReminderActions {
  final Ref _ref;
  ReminderActions(this._ref);

  /// Returns (id, notificationScheduled, error) — the caller (UI layer)
  /// uses the last two to warn the user, with the actual error text, when
  /// the reminder saved fine but the OS-level alarm failed to schedule,
  /// instead of that failing silently.
  Future<(int, bool, String?)> create({
    required String title,
    String? description,
    required int categoryId,
    required RecurrenceType recurrenceType,
    int? recurrenceInterval,
    int? recurrenceDay,
    int? recurrenceMonth,
    int? recurrenceWeekday,
    bool isLunar = false,
    DailyExclusion? dailyExclusion,
    required DateTime startDate,
    required String reminderTime,
    int advanceNoticeDays = 0,
    int advanceNoticeHours = 0,
    int advanceNoticeMinutes = 0,
  }) async {
    final id = await _ref
        .read(reminderRepositoryProvider)
        .create(
          title: title,
          description: description,
          categoryId: categoryId,
          recurrenceType: recurrenceType,
          recurrenceInterval: recurrenceInterval,
          recurrenceDay: recurrenceDay,
          recurrenceMonth: recurrenceMonth,
          recurrenceWeekday: recurrenceWeekday,
          isLunar: isLunar,
          dailyExclusion: dailyExclusion,
          startDate: startDate,
          reminderTime: reminderTime,
          advanceNoticeDays: advanceNoticeDays,
          advanceNoticeHours: advanceNoticeHours,
          advanceNoticeMinutes: advanceNoticeMinutes,
        );
    final reminder = await _ref.read(reminderRepositoryProvider).getById(id);
    var scheduled = true;
    String? error;
    if (reminder != null) {
      (scheduled, error) = await _ref
          .read(alarmSchedulerServiceProvider)
          .scheduleForReminder(reminder);
    }
    return (id, scheduled, error);
  }

  Future<(bool, String?)> update(Reminder reminder) async {
    await _ref.read(reminderRepositoryProvider).update(reminder);
    final updated = await _ref
        .read(reminderRepositoryProvider)
        .getById(reminder.id);
    if (updated == null) return (true, null);
    return _ref
        .read(alarmSchedulerServiceProvider)
        .scheduleForReminder(updated);
  }

  Future<void> delete(int reminderId) async {
    await _ref
        .read(alarmSchedulerServiceProvider)
        .cancelForReminder(reminderId);
    await _ref.read(reminderRepositoryProvider).delete(reminderId);
  }

  Future<void> complete(int reminderId) async {
    final updated = await _ref
        .read(reminderRepositoryProvider)
        .complete(reminderId);
    if (updated.isActive) {
      await _ref
          .read(alarmSchedulerServiceProvider)
          .scheduleForReminder(updated);
    } else {
      await _ref
          .read(alarmSchedulerServiceProvider)
          .cancelForReminder(reminderId);
    }
  }

  /// Undoes [complete] for a reminder marked done earlier today — always
  /// leaves it due today again and re-schedules its notification, since
  /// undoing anything but today's own completion isn't offered anywhere
  /// in the UI (see ReminderRepository.uncomplete).
  Future<void> uncomplete(int reminderId) async {
    final updated = await _ref
        .read(reminderRepositoryProvider)
        .uncomplete(reminderId);
    await _ref.read(alarmSchedulerServiceProvider).scheduleForReminder(updated);
  }

  Future<(bool, String?)> snooze(int reminderId, DateTime snoozeUntil) async {
    final updated = await _ref
        .read(reminderRepositoryProvider)
        .snooze(reminderId, snoozeUntil);
    return _ref
        .read(alarmSchedulerServiceProvider)
        .scheduleForReminder(updated);
  }
}
