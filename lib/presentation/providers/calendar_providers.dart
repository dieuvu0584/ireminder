import 'package:flutter_riverpod/flutter_riverpod.dart';

DateTime _today() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

/// The day currently selected in the Calendar sub-tab. Defaults to today,
/// so behavior is unchanged unless the user has actually picked a
/// different day — read by HomeScreen's "+" FAB so creating a reminder
/// while browsing a different day pre-fills that day as the reminder's
/// start date instead of always defaulting to today regardless of what's
/// on screen.
final selectedCalendarDayProvider = StateProvider<DateTime>((ref) => _today());
