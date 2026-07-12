import '../../data/database/app_database.dart';
import '../../domain/enums/recurrence_type.dart';
import '../../domain/models/reminder_occurrence.dart';

DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

/// Reconstructs, per calendar day, every reminder occurrence that touches
/// it: the current occurrence (from next_due_date/snooze_until) plus any
/// past logged completion/skip. next_due_date only ever holds a recurring
/// reminder's single upcoming occurrence, so its past cycles are otherwise
/// unreachable — [completedLogs]/[skippedLogs] fill that in. One-off
/// (`none`) reminders are excluded from the log loops since they're
/// already fully represented by their (unmoving) current-occurrence entry.
///
/// Shared by the calendar month grid (every day at once) and the Today
/// tab's "what happened today" section (today's day only).
Map<DateTime, List<ReminderOccurrence>> buildOccurrencesByDay({
  required List<Reminder> reminders,
  required List<ReminderLog> completedLogs,
  required List<ReminderLog> skippedLogs,
}) {
  final remindersById = {for (final r in reminders) r.id: r};
  // A one-off reminder going inactive means either it was completed or
  // auto-skipped (see ReminderRepository.autoSkipOverdue) — this set is
  // how entries below tell those two apart, since next_due_date/isActive
  // alone can't distinguish them.
  final completedReminderIds = {
    for (final log in completedLogs) log.reminderId,
  };

  final byDay = <DateTime, List<ReminderOccurrence>>{};

  for (final r in reminders) {
    final key = _dateOnly(r.snoozeUntil ?? r.nextDueDate);
    final done = !r.isActive && completedReminderIds.contains(r.id);
    byDay
        .putIfAbsent(key, () => [])
        .add(ReminderOccurrence(r, completed: done, historical: !r.isActive));
  }

  for (final log in completedLogs) {
    final reminder = remindersById[log.reminderId];
    if (reminder == null) continue;
    if (RecurrenceType.fromDbValue(reminder.recurrenceType) ==
        RecurrenceType.none) {
      continue;
    }
    final key = _dateOnly(log.completedAt);
    byDay
        .putIfAbsent(key, () => [])
        .add(ReminderOccurrence(reminder, completed: true, historical: true));
  }

  for (final log in skippedLogs) {
    final reminder = remindersById[log.reminderId];
    if (reminder == null) continue;
    if (RecurrenceType.fromDbValue(reminder.recurrenceType) ==
        RecurrenceType.none) {
      continue;
    }
    final key = _dateOnly(log.completedAt);
    byDay
        .putIfAbsent(key, () => [])
        .add(ReminderOccurrence(reminder, completed: false, historical: true));
  }

  return byDay;
}
