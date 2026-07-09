import 'package:flutter/material.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../categories/category_manager_screen.dart';
import '../loans/loan_form_screen.dart';
import '../loans/loan_list_screen.dart';
import '../reminders/reminder_form_screen.dart';
import '../settings/settings_screen.dart';
import 'calendar_view.dart';
import 'timeline_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const ReminderFormScreen()),
      );
    } else if (choice == 'loan' && context.mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const LoanFormScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tabs = [
      _RootTab(
        body: DefaultTabController(
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
                child: TabBarView(
                  children: [TimelineView(), CalendarView()],
                ),
              ),
            ],
          ),
        ),
      ),
      const _RootTab(body: LoanListScreen()),
      const _RootTab(body: CategoryManagerScreen()),
      const _RootTab(body: SettingsScreen()),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _tabIndex,
        children: tabs.map((t) => t.body).toList(),
      ),
      floatingActionButton: _tabIndex == 0
          ? FloatingActionButton(
              onPressed: () => _showAddSheet(context),
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tabIndex,
        onDestinationSelected: (i) => setState(() => _tabIndex = i),
        destinations: [
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
        ],
      ),
    );
  }
}

class _RootTab {
  final Widget body;
  const _RootTab({required this.body});
}
