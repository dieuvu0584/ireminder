import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The day currently selected on the Calendar screen. Null means "no
/// specific day picked" — the Calendar shows the whole visible month's
/// entries in that state instead of a single day's, switching to just
/// that day's entries once the user taps one (tapping the same day again
/// clears it back to null). Also read by HomeScreen's "+" FAB, so creating
/// a reminder while a day is selected pre-fills it as the start date; the
/// reminder form already falls back to today when this is null.
final selectedCalendarDayProvider = StateProvider<DateTime?>((ref) => null);
