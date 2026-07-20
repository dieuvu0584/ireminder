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
