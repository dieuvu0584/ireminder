import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/utils/reminder_occurrence_builder.dart';
import '../../../data/database/app_database.dart';
import '../../../domain/models/reminder_occurrence.dart';
import '../../providers/category_providers.dart';
import '../../providers/reminder_providers.dart';
import '../../providers/settings_providers.dart';
import '../../widgets/guarded_action.dart';
import '../../widgets/reminder_card.dart';
import '../reminders/reminder_detail_screen.dart';

class TimelineView extends ConsumerWidget {
  const TimelineView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final activeRemindersAsync = ref.watch(activeRemindersStreamProvider);
    // Today gets its own section below, built separately from all
    // reminders (not just active ones) plus completed/skipped logs — an
    // item completed earlier today would otherwise vanish from this tab
    // entirely (deactivated if one-off, or its next_due_date already
    // moved to a future day if recurring), even though it legitimately
    // happened today.
    final allRemindersAsync = ref.watch(allRemindersStreamProvider);
    final completedLogsAsync = ref.watch(completedReminderLogsStreamProvider);
    final skippedLogsAsync = ref.watch(skippedReminderLogsStreamProvider);
    final categoriesAsync = ref.watch(categoriesStreamProvider);
    final snoozeMinutes =
        ref.watch(settingsStreamProvider).valueOrNull?.snoozeDurationMinutes ??
        60;

    return activeRemindersAsync.when(
      data: (activeReminders) {
        final categories = categoriesAsync.valueOrNull ?? const <Category>[];
        final byId = {for (final c in categories) c.id: c};

        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        final endOfWeek = today.add(Duration(days: 7 - today.weekday));

        final overdue = <Reminder>[];
        final thisWeek = <Reminder>[];
        final upcoming = <Reminder>[];

        for (final r in activeReminders) {
          final due = r.snoozeUntil != null
              ? DateTime(
                  r.snoozeUntil!.year,
                  r.snoozeUntil!.month,
                  r.snoozeUntil!.day,
                )
              : DateTime(
                  r.nextDueDate.year,
                  r.nextDueDate.month,
                  r.nextDueDate.day,
                );
          if (due.isBefore(today)) {
            overdue.add(r);
          } else if (due.isAtSameMomentAs(today)) {
            continue; // covered by the Today section below instead
          } else if (!due.isAfter(endOfWeek)) {
            thisWeek.add(r);
          } else {
            upcoming.add(r);
          }
        }

        final todayEntries =
            buildOccurrencesByDay(
              reminders: allRemindersAsync.valueOrNull ?? const [],
              completedLogs: completedLogsAsync.valueOrNull ?? const [],
              skippedLogs: skippedLogsAsync.valueOrNull ?? const [],
            )[today] ??
            const <ReminderOccurrence>[];

        if (overdue.isEmpty &&
            thisWeek.isEmpty &&
            upcoming.isEmpty &&
            todayEntries.isEmpty) {
          return _EmptyState(l10n: l10n);
        }

        return ListView(
          padding: const EdgeInsets.only(bottom: 88),
          children: [
            if (overdue.isNotEmpty)
              _Section(
                title: l10n.homeSectionOverdue,
                reminders: overdue,
                byId: byId,
                snoozeMinutes: snoozeMinutes,
                today: today,
              ),
            if (thisWeek.isNotEmpty)
              _Section(
                title: l10n.homeSectionThisWeek,
                reminders: thisWeek,
                byId: byId,
                snoozeMinutes: snoozeMinutes,
                today: today,
              ),
            if (upcoming.isNotEmpty)
              _Section(
                title: l10n.homeSectionUpcoming,
                reminders: upcoming,
                byId: byId,
                snoozeMinutes: snoozeMinutes,
                today: today,
              ),
            if (todayEntries.isNotEmpty)
              _TodaySection(
                title: l10n.homeSectionToday,
                entries: todayEntries,
                today: today,
                byId: byId,
                snoozeMinutes: snoozeMinutes,
              ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text(l10n.errorLoadFailed)),
    );
  }
}

class _Section extends ConsumerWidget {
  final String title;
  final List<Reminder> reminders;
  final Map<int, Category> byId;
  final int snoozeMinutes;
  final DateTime today;

  const _Section({
    required this.title,
    required this.reminders,
    required this.byId,
    required this.snoozeMinutes,
    required this.today,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        ...reminders.map((r) {
          final due = r.snoozeUntil ?? r.nextDueDate;
          final dueDay = DateTime(due.year, due.month, due.day);
          // A reminder whose due day hasn't arrived yet can't be completed
          // from here — see ReminderCard.completionLocked. Overdue entries
          // (dueDay before today) stay completable as before.
          final completionLocked = dueDay.isAfter(today);
          return ReminderCard(
            reminder: r,
            category: byId[r.categoryId],
            occurrenceDate: r.snoozeUntil ?? r.nextDueDate,
            completionLocked: completionLocked,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ReminderDetailScreen(reminder: r),
              ),
            ),
            onComplete: () => runGuarded(
              context,
              () => ref.read(reminderActionsProvider).complete(r.id),
            ),
            onSnooze: () => runGuarded(
              context,
              () => ref
                  .read(reminderActionsProvider)
                  .snooze(
                    r.id,
                    DateTime.now().add(Duration(minutes: snoozeMinutes)),
                  ),
            ),
          );
        }),
      ],
    );
  }
}

/// Every reminder that touches today — done, skipped, or still pending —
/// unlike [_Section], which only ever lists still-actionable reminders.
/// Each row shows the date too, since a completed/skipped entry here is
/// a historical record (see ReminderCard's `historical`) rather than
/// today's own live state.
class _TodaySection extends ConsumerWidget {
  final String title;
  final List<ReminderOccurrence> entries;
  final DateTime today;
  final Map<int, Category> byId;
  final int snoozeMinutes;

  const _TodaySection({
    required this.title,
    required this.entries,
    required this.today,
    required this.byId,
    required this.snoozeMinutes,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        ...entries.map(
          (entry) => ReminderCard(
            key: ValueKey(
              'today_${entry.reminder.id}_${entry.completed}_'
              '${entry.historical}',
            ),
            reminder: entry.reminder,
            category: byId[entry.reminder.categoryId],
            completed: entry.completed,
            historical: entry.historical,
            occurrenceDate: today,
            // Today's own entries stay correctable same-day — a skip
            // never lands on today (autoSkipOverdue only ever fires for
            // days strictly before today), so the only historical state
            // reachable here is "completed today", and toggling it back
            // just undoes that.
            allowToggle: true,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ReminderDetailScreen(reminder: entry.reminder),
              ),
            ),
            onComplete: () => runGuarded(
              context,
              () => entry.completed
                  ? ref
                        .read(reminderActionsProvider)
                        .uncomplete(entry.reminder.id)
                  : ref
                        .read(reminderActionsProvider)
                        .complete(entry.reminder.id),
            ),
            onSnooze: () => runGuarded(
              context,
              () => ref
                  .read(reminderActionsProvider)
                  .snooze(
                    entry.reminder.id,
                    DateTime.now().add(Duration(minutes: snoozeMinutes)),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  final AppLocalizations l10n;
  const _EmptyState({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🗓️', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 12),
            Text(
              l10n.homeEmptyTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              l10n.homeEmptyBody,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
