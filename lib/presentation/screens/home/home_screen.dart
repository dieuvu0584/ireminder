import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../providers/calendar_providers.dart';
import '../categories/category_manager_screen.dart';
import '../loans/loan_form_screen.dart';
import '../loans/loan_list_screen.dart';
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
  int _tabIndex = 0;

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
    if (choice == 'reminder' && context.mounted) {
      // Pre-fills whichever day is currently selected on the Calendar
      // sub-tab (defaults to today if the user hasn't picked one), so
      // adding a reminder while browsing a future/past day doesn't
      // silently ignore it in favor of today.
      final initialStartDate = ref.read(selectedCalendarDayProvider);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) =>
              ReminderFormScreen(initialStartDate: initialStartDate),
        ),
      );
    } else if (choice == 'loan' && context.mounted) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const LoanFormScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final tabs = <Widget>[
      // Unlike the other tabs, this one has no Scaffold/AppBar of its own
      // to provide top status-bar inset, so without an explicit SafeArea
      // its TabBar renders directly under (and gets visually overlapped
      // by) the system status bar icons/clock.
      SafeArea(
        bottom: false,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: l10n.navToday),
                  Tab(text: l10n.navCalendar),
                ],
              ),
              const Expanded(
                child: TabBarView(children: [TimelineView(), CalendarView()]),
              ),
            ],
          ),
        ),
      ),
      const LoanListScreen(),
      const CategoryManagerScreen(),
      const SettingsScreen(),
    ];

    if (_tabIndex >= tabs.length) {
      _tabIndex = tabs.length - 1;
    }

    final destinations = <NavigationDestination>[
      NavigationDestination(
        icon: const Icon(Icons.today_outlined),
        selectedIcon: const Icon(Icons.today),
        label: l10n.navToday,
      ),
      NavigationDestination(
        icon: const Icon(Icons.payments_outlined),
        selectedIcon: const Icon(Icons.payments),
        label: l10n.navLoans,
      ),
      NavigationDestination(
        icon: const Icon(Icons.category_outlined),
        selectedIcon: const Icon(Icons.category),
        label: l10n.navCategories,
      ),
      NavigationDestination(
        icon: const Icon(Icons.settings_outlined),
        selectedIcon: const Icon(Icons.settings),
        label: l10n.navSettings,
      ),
    ];

    return Scaffold(
      body: IndexedStack(index: _tabIndex, children: tabs),
      floatingActionButton: _tabIndex == 0
          ? FloatingActionButton(
              onPressed: () => _showAddSheet(context),
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tabIndex,
        onDestinationSelected: (i) => setState(() => _tabIndex = i),
        destinations: destinations,
      ),
    );
  }
}
