import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/utils/lunar_converter.dart';
import '../../../core/utils/recurrence_label.dart';
import '../../../data/database/app_database.dart';
import '../../../domain/enums/recurrence_type.dart';
import '../../providers/category_providers.dart';
import '../../providers/reminder_providers.dart';
import '../../providers/settings_providers.dart';
import '../../widgets/color_picker.dart';
import '../../widgets/icon_catalog.dart';
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
        child: categoriesAsync.when(
          data: (categories) {
            final category = categories
                .where((c) => c.id == current.categoryId)
                .firstOrNull;
            final color = category != null
                ? parseHexColor(category.color)
                : Theme.of(context).colorScheme.primary;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: color.withValues(alpha: 0.15),
                          child: Icon(
                            category != null
                                ? resolveCategoryIcon(category.icon)
                                : Icons.notifications,
                            size: 40,
                            color: color,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          current.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        if (category != null) ...[
                          const SizedBox(height: 8),
                          Chip(
                            label: Text(category.name),
                            backgroundColor: color.withValues(alpha: 0.15),
                            labelStyle: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w600,
                            ),
                            side: BorderSide.none,
                          ),
                        ],
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.event, size: 22, color: color),
                                  const SizedBox(width: 8),
                                  Text(
                                    DateFormatter.formatDate(
                                      current.nextDueDate,
                                      locale,
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: color,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 18,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    DateFormatter.formatTime(
                                      current.reminderTime,
                                      locale,
                                    ),
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              if (current.isLunar) ...[
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.brightness_2_outlined,
                                      size: 16,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      l10n.reminderLunarDateLabel(
                                        LunarConverter.formatDayMonth(
                                          current.nextDueDate,
                                        ),
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Chip(
                          avatar: const Icon(Icons.repeat, size: 18),
                          label: Text(
                            recurrenceTypeLabel(
                              l10n,
                              RecurrenceType.fromDbValue(
                                current.recurrenceType,
                              ),
                            ),
                          ),
                        ),
                        if (current.description != null &&
                            current.description!.isNotEmpty) ...[
                          const SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              current.description!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                if (_isTriggered(current))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Row(
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
                  ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text(l10n.errorLoadFailed)),
        ),
      ),
    );
  }
}
