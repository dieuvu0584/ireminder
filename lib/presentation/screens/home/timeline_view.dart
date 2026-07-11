import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../data/database/app_database.dart';
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
    final remindersAsync = ref.watch(activeRemindersStreamProvider);
    final categoriesAsync = ref.watch(categoriesStreamProvider);
    final snoozeMinutes =
        ref.watch(settingsStreamProvider).valueOrNull?.snoozeDurationMinutes ??
        60;

    return remindersAsync.when(
      data: (reminders) {
        final categories = categoriesAsync.valueOrNull ?? const <Category>[];
        final byId = {for (final c in categories) c.id: c};

        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        final endOfWeek = today.add(Duration(days: 7 - today.weekday));

        final overdue = <Reminder>[];
        final dueToday = <Reminder>[];
        final thisWeek = <Reminder>[];
        final upcoming = <Reminder>[];

        for (final r in reminders) {
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
            dueToday.add(r);
          } else if (!due.isAfter(endOfWeek)) {
            thisWeek.add(r);
          } else {
            upcoming.add(r);
          }
        }

        if (reminders.isEmpty) {
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
              ),
            if (dueToday.isNotEmpty)
              _Section(
                title: l10n.homeSectionToday,
                reminders: dueToday,
                byId: byId,
                snoozeMinutes: snoozeMinutes,
              ),
            if (thisWeek.isNotEmpty)
              _Section(
                title: l10n.homeSectionThisWeek,
                reminders: thisWeek,
                byId: byId,
                snoozeMinutes: snoozeMinutes,
              ),
            if (upcoming.isNotEmpty)
              _Section(
                title: l10n.homeSectionUpcoming,
                reminders: upcoming,
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

  const _Section({
    required this.title,
    required this.reminders,
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
        ...reminders.map(
          (r) => ReminderCard(
            reminder: r,
            category: byId[r.categoryId],
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ReminderDetailScreen(reminder: r),
              ),
            ),
            onComplete: () => runGuarded(
              context,
              () => ref.read(reminderActionsProvider).complete(r.id),
              successMessage: AppLocalizations.of(
                context,
              ).reminderCompletedFeedback,
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
