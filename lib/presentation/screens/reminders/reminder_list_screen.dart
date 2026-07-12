import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../data/database/app_database.dart';
import '../../providers/reminder_providers.dart';
import '../../providers/settings_providers.dart';
import '../../widgets/guarded_action.dart';
import '../../widgets/reminder_card.dart';
import 'reminder_detail_screen.dart';

/// Reminders scoped to a single category (opened from the category
/// manager). The main cross-category view lives in the home timeline tab.
class ReminderListScreen extends ConsumerWidget {
  final Category category;

  const ReminderListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remindersAsync = ref.watch(
      remindersByCategoryStreamProvider(category.id),
    );
    final snoozeMinutes =
        ref.watch(settingsStreamProvider).valueOrNull?.snoozeDurationMinutes ??
        60;

    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: remindersAsync.when(
        data: (reminders) {
          if (reminders.isEmpty) {
            return const Center(child: Icon(Icons.check_circle_outline));
          }
          final now = DateTime.now();
          final today = DateTime(now.year, now.month, now.day);
          return ListView.builder(
            itemCount: reminders.length,
            itemBuilder: (context, index) {
              final reminder = reminders[index];
              final due = reminder.snoozeUntil ?? reminder.nextDueDate;
              final dueDay = DateTime(due.year, due.month, due.day);
              // A reminder whose due day hasn't arrived yet can't be
              // completed from here — see ReminderCard.completionLocked.
              final completionLocked = dueDay.isAfter(today);
              return ReminderCard(
                reminder: reminder,
                category: category,
                occurrenceDate: reminder.snoozeUntil ?? reminder.nextDueDate,
                completionLocked: completionLocked,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ReminderDetailScreen(reminder: reminder),
                  ),
                ),
                onComplete: () => runGuarded(
                  context,
                  () => ref.read(reminderActionsProvider).complete(reminder.id),
                  successMessage: AppLocalizations.of(
                    context,
                  ).reminderCompletedFeedback,
                ),
                onSnooze: () => runGuarded(
                  context,
                  () => ref
                      .read(reminderActionsProvider)
                      .snooze(
                        reminder.id,
                        DateTime.now().add(Duration(minutes: snoozeMinutes)),
                      ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => const Center(child: Icon(Icons.error_outline)),
      ),
    );
  }
}
