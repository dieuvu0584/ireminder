import '../../data/database/app_database.dart';

/// A reminder plotted on a specific calendar day. [completed] marks
/// whether that particular occurrence was actually done (green) vs not
/// (orange/gray, see [historical]). [historical] marks whether it's a
/// past completed/skipped occurrence — shown as a static row rather than
/// an actionable one, since there's nothing to swipe-complete/snooze about
/// something already resolved one way or the other. The same [Reminder]
/// can appear on more than one day (its current occurrence, plus any of
/// its past logged completions/skips), each with its own values.
class ReminderOccurrence {
  final Reminder reminder;
  final bool completed;
  final bool historical;

  const ReminderOccurrence(
    this.reminder, {
    required this.completed,
    required this.historical,
  });
}
