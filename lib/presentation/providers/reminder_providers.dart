import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/app_database.dart';
import '../../domain/enums/recurrence_type.dart';
import 'notification_providers.dart';
import 'repository_providers.dart';

final activeRemindersStreamProvider = StreamProvider<List<Reminder>>((ref) {
  return ref.watch(reminderRepositoryProvider).watchActive();
});

final remindersByCategoryStreamProvider =
    StreamProvider.family<List<Reminder>, int>((ref, categoryId) {
  return ref.watch(reminderRepositoryProvider).watchByCategory(categoryId);
});

final reminderActionsProvider = Provider<ReminderActions>((ref) {
  return ReminderActions(ref);
});

class ReminderActions {
  final Ref _ref;
  ReminderActions(this._ref);

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
    final id = await _ref.read(reminderRepositoryProvider).create(
          title: title,
          description: description,
          categoryId: categoryId,
          recurrenceType: recurrenceType,
          recurrenceInterval: recurrenceInterval,
          recurrenceDay: recurrenceDay,
          recurrenceMonth: recurrenceMonth,
          recurrenceWeekday: recurrenceWeekday,
          isLunar: isLunar,
          startDate: startDate,
          reminderTime: reminderTime,
          advanceNoticeDays: advanceNoticeDays,
        );
    final reminder = await _ref.read(reminderRepositoryProvider).getById(id);
    if (reminder != null) {
      await _ref
          .read(alarmSchedulerServiceProvider)
          .scheduleForReminder(reminder);
    }
    return id;
  }

  Future<void> update(Reminder reminder) async {
    await _ref.read(reminderRepositoryProvider).update(reminder);
    final updated =
        await _ref.read(reminderRepositoryProvider).getById(reminder.id);
    if (updated != null) {
      await _ref
          .read(alarmSchedulerServiceProvider)
          .scheduleForReminder(updated);
    }
  }

  Future<void> delete(int reminderId) async {
    await _ref
        .read(alarmSchedulerServiceProvider)
        .cancelForReminder(reminderId);
    await _ref.read(reminderRepositoryProvider).delete(reminderId);
  }

  Future<void> complete(int reminderId) async {
    final updated =
        await _ref.read(reminderRepositoryProvider).complete(reminderId);
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

  Future<void> snooze(int reminderId, DateTime snoozeUntil) async {
    final updated = await _ref
        .read(reminderRepositoryProvider)
        .snooze(reminderId, snoozeUntil);
    await _ref
        .read(alarmSchedulerServiceProvider)
        .scheduleForReminder(updated);
  }
}
