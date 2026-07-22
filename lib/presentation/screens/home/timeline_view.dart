import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/utils/reminder_due_time.dart';
import '../../../core/utils/reminder_occurrence_builder.dart';
import '../../../data/database/app_database.dart';
import '../../../domain/models/agenda_entry.dart';
import '../../../domain/models/reminder_occurrence.dart';
import '../../providers/category_providers.dart';
import '../../providers/loan_providers.dart';
import '../../providers/reminder_providers.dart';
import '../../providers/settings_providers.dart';
import '../../widgets/guarded_action.dart';
import '../../widgets/installment_card.dart';
import '../../widgets/reminder_card.dart';
import '../loans/loan_detail_screen.dart';
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
    // Installments are also "something to be reminded about on a date",
    // so they're folded into the same sections as reminders instead of
    // living in a separate loans-only view.
    final installmentsAsync = ref.watch(
      unpaidInstallmentsWithLoanStreamProvider,
    );
    final snoozeMinutes =
        ref.watch(settingsStreamProvider).valueOrNull?.snoozeDurationMinutes ??
        60;

    return activeRemindersAsync.when(
      data: (activeReminders) {
        final categories = categoriesAsync.valueOrNull ?? const <Category>[];
        final byId = {for (final c in categories) c.id: c};
        final installments = installmentsAsync.valueOrNull ?? const [];

        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        final endOfWeek = today.add(Duration(days: 7 - today.weekday));

        final overdue = <AgendaEntry>[];
        final thisWeek = <AgendaEntry>[];
        final upcoming = <AgendaEntry>[];
        final todayEntries = <AgendaEntry>[];

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
            overdue.add(
              ReminderAgendaEntry(
                ReminderOccurrence(r, completed: false, historical: false),
                effectiveReminderDueDateTime(r),
              ),
            );
          } else if (due.isAtSameMomentAs(today)) {
            continue; // covered by the Today section below instead
          } else if (!due.isAfter(endOfWeek)) {
            thisWeek.add(
              ReminderAgendaEntry(
                ReminderOccurrence(r, completed: false, historical: false),
                effectiveReminderDueDateTime(r),
              ),
            );
          } else {
            upcoming.add(
              ReminderAgendaEntry(
                ReminderOccurrence(r, completed: false, historical: false),
                effectiveReminderDueDateTime(r),
              ),
            );
          }
        }

        for (final (installment, loan) in installments) {
          final dueDay = DateTime(
            installment.dueDate.year,
            installment.dueDate.month,
            installment.dueDate.day,
          );
          final entry = InstallmentAgendaEntry(installment, loan);
          if (dueDay.isBefore(today)) {
            overdue.add(entry);
          } else if (dueDay.isAtSameMomentAs(today)) {
            todayEntries.add(entry);
          } else if (!dueDay.isAfter(endOfWeek)) {
            thisWeek.add(entry);
          } else {
            upcoming.add(entry);
          }
        }

        final todayOccurrences =
            buildOccurrencesByDay(
              reminders: allRemindersAsync.valueOrNull ?? const [],
              completedLogs: completedLogsAsync.valueOrNull ?? const [],
              skippedLogs: skippedLogsAsync.valueOrNull ?? const [],
            )[today] ??
            const <ReminderOccurrence>[];
        for (final occurrence in todayOccurrences) {
          todayEntries.add(
            ReminderAgendaEntry(
              occurrence,
              effectiveReminderDueDateTime(occurrence.reminder),
            ),
          );
        }

        // Ascending by due date+time within each section — the DB
        // queries backing activeReminders/allReminders/installments only
        // order by the date part, so entries due the same day would
        // otherwise tie-break on arbitrary row order.
        int byDueAt(AgendaEntry a, AgendaEntry b) => a.dueAt.compareTo(b.dueAt);
        overdue.sort(byDueAt);
        thisWeek.sort(byDueAt);
        upcoming.sort(byDueAt);
        todayEntries.sort(byDueAt);

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
                entries: overdue,
                byId: byId,
                snoozeMinutes: snoozeMinutes,
                today: today,
              ),
            if (thisWeek.isNotEmpty)
              _Section(
                title: l10n.homeSectionThisWeek,
                entries: thisWeek,
                byId: byId,
                snoozeMinutes: snoozeMinutes,
                today: today,
              ),
            if (upcoming.isNotEmpty)
              _Section(
                title: l10n.homeSectionUpcoming,
                entries: upcoming,
                byId: byId,
                snoozeMinutes: snoozeMinutes,
                today: today,
              ),
            if (todayEntries.isNotEmpty)
              _Section(
                title: l10n.homeSectionToday,
                entries: todayEntries,
                byId: byId,
                snoozeMinutes: snoozeMinutes,
                today: today,
                isToday: true,
              ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text(l10n.errorLoadFailed)),
    );
  }
}

/// Renders a mix of reminders and installments, sorted together. Every
/// section except Today only ever contains still-actionable entries; the
/// Today section (see [isToday]) can also contain historical (already
/// completed/skipped today) reminder occurrences, so its rows use
/// [ReminderCard.allowToggle] to stay correctable same-day.
class _Section extends ConsumerWidget {
  final String title;
  final List<AgendaEntry> entries;
  final Map<int, Category> byId;
  final int snoozeMinutes;
  final DateTime today;
  final bool isToday;

  const _Section({
    required this.title,
    required this.entries,
    required this.byId,
    required this.snoozeMinutes,
    required this.today,
    this.isToday = false,
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
        ...entries.map((entry) {
          switch (entry) {
            case ReminderAgendaEntry(:final occurrence):
              final r = occurrence.reminder;
              final due = r.snoozeUntil ?? r.nextDueDate;
              final dueDay = DateTime(due.year, due.month, due.day);
              // A reminder whose due day hasn't arrived yet can't be
              // completed from here — see ReminderCard.completionLocked.
              final completionLocked = dueDay.isAfter(today);
              return ReminderCard(
                key: ValueKey(
                  'reminder_${r.id}_${occurrence.completed}_'
                  '${occurrence.historical}',
                ),
                reminder: r,
                category: byId[r.categoryId],
                completed: occurrence.completed,
                historical: occurrence.historical,
                occurrenceDate: isToday ? today : due,
                allowToggle: isToday,
                completionLocked: completionLocked,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ReminderDetailScreen(reminder: r),
                  ),
                ),
                onComplete: () => runGuarded(
                  context,
                  () => occurrence.completed
                      ? ref.read(reminderActionsProvider).uncomplete(r.id)
                      : ref.read(reminderActionsProvider).complete(r.id),
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
            case InstallmentAgendaEntry(:final installment, :final loan):
              return InstallmentCard(
                key: ValueKey('installment_${installment.id}'),
                installment: installment,
                loan: loan,
                category: loan.categoryId == null
                    ? null
                    : byId[loan.categoryId],
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => LoanDetailScreen(loan: loan),
                  ),
                ),
                onMarkPaid: () => runGuarded(
                  context,
                  () => ref
                      .read(loanActionsProvider)
                      .markPaid(
                        loanId: loan.id,
                        installmentIds: [installment.id],
                        paidDate: DateTime.now(),
                      ),
                ),
              );
          }
        }),
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
