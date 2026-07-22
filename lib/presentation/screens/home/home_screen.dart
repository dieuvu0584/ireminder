import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../providers/calendar_providers.dart';
import '../loans/loan_form_screen.dart';
import '../reminders/reminder_form_screen.dart';
import '../settings/settings_screen.dart';
import 'calendar_view.dart';
import 'timeline_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Future<void> _showAddSheet(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final choice = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: Text(l10n.fabAddReminder),
              onTap: () => Navigator.of(ctx).pop('reminder'),
            ),
            ListTile(
              leading: const Icon(Icons.payments_outlined),
              title: Text(l10n.fabAddLoan),
              onTap: () => Navigator.of(ctx).pop('loan'),
            ),
          ],
        ),
      ),
    );
    // Shared with the Calendar tab's day grid, so creating a reminder or
    // loan while a specific day is selected there starts from that day —
    // defaults to today when nothing's been selected yet (the provider's
    // own initial value), matching the "otherwise default to today" half
    // of the same request.
    final selectedDay = ref.read(selectedCalendarDayProvider);
    if (choice == 'reminder' && context.mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ReminderFormScreen(initialStartDate: selectedDay),
        ),
      );
    } else if (choice == 'loan' && context.mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => LoanFormScreen(initialStartDate: selectedDay),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            tabs: [Tab(text: l10n.navToday), Tab(text: l10n.navCalendar)],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              tooltip: l10n.navSettings,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              ),
            ),
          ],
        ),
        body: const TabBarView(children: [TimelineView(), CalendarView()]),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddSheet(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
