import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/calendar_providers.dart';
import '../reminders/reminder_form_screen.dart';
import 'calendar_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void _addReminder(BuildContext context) {
    // Shared with the Calendar screen's day grid, so creating a reminder
    // while a specific day is selected there starts from that day —
    // defaults to today when nothing's been selected yet (the provider's
    // own initial value).
    final selectedDay = ref.read(selectedCalendarDayProvider);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ReminderFormScreen(initialStartDate: selectedDay),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // The Today/Calendar tabs are gone — Calendar is the only screen now,
    // so it owns the whole body (including its own header row, which is
    // where the settings entry point lives — see CalendarView).
    return Scaffold(
      body: const SafeArea(bottom: false, child: CalendarView()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addReminder(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
