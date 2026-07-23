import '../../data/database/app_database.dart';

/// The moment a reminder is actually due. snoozeUntil already carries a
/// precise date+time (set from `DateTime.now().add(...)`), so it's used
/// as-is; nextDueDate is date-only, so it needs combining with the
/// separately-stored reminderTime ("HH:mm") — otherwise reminders due the
/// same day would tie on an arbitrary sort order instead of sorting by
/// time-of-day. Shared by the Task List and Calendar tabs.
DateTime effectiveReminderDueDateTime(Reminder r) {
  if (r.snoozeUntil != null) return r.snoozeUntil!;
  final parts = r.reminderTime.split(':');
  return DateTime(
    r.nextDueDate.year,
    r.nextDueDate.month,
    r.nextDueDate.day,
    int.parse(parts[0]),
    int.parse(parts[1]),
  );
}

/// The moment a specific projected occurrence of [r] on [day] is due.
/// [r]'s own nextDueDate/snoozeUntil only ever holds its single nearest
/// occurrence, but the Calendar screen also projects a recurring
/// reminder onto every other day it lands on within the browsed month —
/// each of those needs [day] combined with the reminder's own
/// reminderTime, not the stored occurrence's date repeated for every row.
/// [day] matching the stored occurrence's own day is the one case that
/// still defers to [effectiveReminderDueDateTime], so a snooze's precise
/// time isn't rounded off.
DateTime dueDateTimeForDay(Reminder r, DateTime day) {
  final current = effectiveReminderDueDateTime(r);
  if (day.year == current.year &&
      day.month == current.month &&
      day.day == current.day) {
    return current;
  }
  final parts = r.reminderTime.split(':');
  return DateTime(
    day.year,
    day.month,
    day.day,
    int.parse(parts[0]),
    int.parse(parts[1]),
  );
}
