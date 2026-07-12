import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/utils/lunar_converter.dart';
import '../../../data/database/app_database.dart';
import '../../providers/category_providers.dart';
import '../../providers/reminder_providers.dart';
import '../../providers/settings_providers.dart';
import 'reminder_form_screen.dart';

class ReminderDetailScreen extends ConsumerWidget {
  final Reminder reminder;

  const ReminderDetailScreen({super.key, required this.reminder});

  /// Done/Snooze only make sense once a reminder's due day has actually
  /// arrived — showing them for a reminder merely scheduled for a future
  /// day (e.g. browsing ahead in the calendar to a future occurrence)
  /// invites completing something that hasn't happened yet, which for a
  /// recurring reminder logs a duplicate "done" entry and for a one-off
  /// deactivates it while its due date stays in the future, making it
  /// vanish from every list. Gated at the day level rather than the exact
  /// fire time, so a reminder due later today can still be completed
  /// early today (matching ReminderCard.completionLocked elsewhere).
  bool _isTriggered(Reminder r) {
    final due = r.snoozeUntil ?? r.nextDueDate;
    final dueDay = DateTime(due.year, due.month, due.day);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return !dueDay.isAfter(today);
  }

  Future<void> _runGuarded(
    BuildContext context,
    WidgetRef ref,
    Future<void> Function() action, {
    String? successMessage,
  }) async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    try {
      await action();
      if (context.mounted) navigator.pop();
      if (successMessage != null) {
        messenger.showSnackBar(SnackBar(content: Text(successMessage)));
      }
    } catch (_) {
      if (context.mounted) {
        messenger.showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).errorGeneric)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final categoriesAsync = ref.watch(categoriesStreamProvider);
    final snoozeMinutes =
        ref.watch(settingsStreamProvider).valueOrNull?.snoozeDurationMinutes ??
        60;
    // Watches the live row so edits made via the Edit screen (or a bulk
    // category reassignment/delete elsewhere) are reflected here instead of
    // this screen staying stuck showing the stale object it was opened with.
    final liveAsync = ref.watch(reminderByIdStreamProvider(reminder.id));

    if (liveAsync.hasValue && liveAsync.value == null) {
      // Deleted from underneath this screen — leave gracefully.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted && Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      });
      return const Scaffold(body: SizedBox.shrink());
    }
    final current = liveAsync.valueOrNull ?? reminder;

    return Scaffold(
      appBar: AppBar(
        title: Text(current.title, overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ReminderFormScreen(existing: current),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(l10n.reminderDeleteConfirmTitle),
                  content: Text(l10n.reminderDeleteConfirmBody),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(false),
                      child: Text(l10n.actionCancel),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(true),
                      child: Text(l10n.actionDelete),
                    ),
                  ],
                ),
              );
              if (confirmed == true && context.mounted) {
                await _runGuarded(
                  context,
                  ref,
                  () => ref.read(reminderActionsProvider).delete(current.id),
                );
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        // Without this, the Done/Snooze row (pushed to the bottom via the
        // Spacer below) renders flush against the very edge of the screen
        // and gets overlapped by the system navigation bar on devices that
        // use on-screen nav buttons instead of gesture navigation.
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (current.description != null &&
                  current.description!.isNotEmpty) ...[
                Text(current.description!),
                const SizedBox(height: 16),
              ],
              categoriesAsync.when(
                data: (categories) {
                  final cat = categories
                      .where((c) => c.id == current.categoryId)
                      .firstOrNull;
                  return Text(cat?.name ?? '');
                },
                loading: () => const SizedBox.shrink(),
                error: (e, st) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    DateFormatter.formatDate(current.nextDueDate, locale),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (current.isLunar) ...[
                    const SizedBox(width: 8),
                    Icon(
                      Icons.brightness_2_outlined,
                      size: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      l10n.reminderLunarDateLabel(
                        LunarConverter.formatDayMonth(current.nextDueDate),
                      ),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ],
              ),
              Text(DateFormatter.formatTime(current.reminderTime, locale)),
              const Spacer(),
              if (_isTriggered(current))
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        icon: const Icon(Icons.check),
                        label: Text(l10n.actionDone),
                        onPressed: () => _runGuarded(
                          context,
                          ref,
                          () => ref
                              .read(reminderActionsProvider)
                              .complete(current.id),
                          successMessage: l10n.reminderCompletedFeedback,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.snooze),
                        label: Text(
                          l10n.actionSnooze,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onPressed: () => _runGuarded(
                          context,
                          ref,
                          () => ref
                              .read(reminderActionsProvider)
                              .snooze(
                                current.id,
                                DateTime.now().add(
                                  Duration(minutes: snoozeMinutes),
                                ),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
