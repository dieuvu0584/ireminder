import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../data/database/app_database.dart';
import '../../providers/category_providers.dart';
import '../../providers/reminder_providers.dart';
import 'reminder_form_screen.dart';

class ReminderDetailScreen extends ConsumerWidget {
  final Reminder reminder;

  const ReminderDetailScreen({super.key, required this.reminder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final categoriesAsync = ref.watch(categoriesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(reminder.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ReminderFormScreen(existing: reminder),
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
              if (confirmed == true) {
                await ref.read(reminderActionsProvider).delete(reminder.id);
                if (context.mounted) Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (reminder.description != null &&
                reminder.description!.isNotEmpty) ...[
              Text(reminder.description!),
              const SizedBox(height: 16),
            ],
            categoriesAsync.when(
              data: (categories) {
                final cat = categories
                    .where((c) => c.id == reminder.categoryId)
                    .firstOrNull;
                return Text(cat?.name ?? '');
              },
              loading: () => const SizedBox.shrink(),
              error: (e, st) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 8),
            Text(
              DateFormatter.formatDate(reminder.nextDueDate, locale),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(DateFormatter.formatTime(reminder.reminderTime, locale)),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    icon: const Icon(Icons.check),
                    label: Text(l10n.actionDone),
                    onPressed: () async {
                      await ref
                          .read(reminderActionsProvider)
                          .complete(reminder.id);
                      if (context.mounted) Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.snooze),
                    label: Text(l10n.actionSnooze),
                    onPressed: () async {
                      final snoozeUntil =
                          DateTime.now().add(const Duration(hours: 1));
                      await ref
                          .read(reminderActionsProvider)
                          .snooze(reminder.id, snoozeUntil);
                      if (context.mounted) Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
