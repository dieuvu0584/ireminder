import 'package:flutter/material.dart';

import '../../core/localization/gen/app_localizations.dart';
import '../../core/utils/lunar_converter.dart';
import '../../data/database/app_database.dart';
import 'color_picker.dart';
import 'icon_catalog.dart';

class ReminderCard extends StatelessWidget {
  final Reminder reminder;
  final Category? category;
  final VoidCallback onTap;
  final VoidCallback onComplete;
  final VoidCallback onSnooze;

  /// Whether this occurrence was actually completed — controls the trailing
  /// icon's color (green vs. gray/outline) when [historical] is true.
  /// Ignored when [historical] is false: the current, still-actionable
  /// occurrence always shows the plain outline icon regardless.
  final bool completed;

  /// True for an entry the calendar plots on a past day (either completed
  /// or auto-skipped) — shown as a plain, non-interactive row instead of
  /// swipe-to-complete/snooze actions, since a past occurrence isn't
  /// something to act on again.
  final bool historical;

  const ReminderCard({
    super.key,
    required this.reminder,
    required this.category,
    required this.onTap,
    required this.onComplete,
    required this.onSnooze,
    this.completed = false,
    this.historical = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final color = category != null
        ? parseHexColor(category!.color)
        : Colors.grey;

    final card = Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(
            category != null
                ? resolveCategoryIcon(category!.icon)
                : Icons.notifications,
            color: color,
          ),
        ),
        title: Text(reminder.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${reminder.reminderTime} · ${category?.name ?? ''}'),
            if (reminder.isLunar)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.brightness_2_outlined,
                    size: 12,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    l10n.reminderLunarDateLabel(
                      LunarConverter.formatDayMonth(
                        reminder.snoozeUntil ?? reminder.nextDueDate,
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
          ],
        ),
        trailing: historical
            ? Icon(
                Icons.check_circle,
                color: completed
                    ? Colors.green
                    : Theme.of(context).colorScheme.outline,
              )
            : IconButton(
                icon: const Icon(Icons.check_circle_outline),
                onPressed: onComplete,
              ),
      ),
    );

    if (historical) return card;

    return Dismissible(
      key: ValueKey('reminder_${reminder.id}'),
      background: _swipeBackground(
        context,
        alignment: Alignment.centerLeft,
        color: Colors.green,
        icon: Icons.check_circle,
        label: l10n.actionDone,
      ),
      secondaryBackground: _swipeBackground(
        context,
        alignment: Alignment.centerRight,
        color: Colors.orange,
        icon: Icons.snooze,
        label: l10n.actionSnooze,
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          onComplete();
        } else {
          onSnooze();
        }
        return false; // let the provider-driven stream remove/update the row
      },
      child: card,
    );
  }

  Widget _swipeBackground(
    BuildContext context, {
    required Alignment alignment,
    required Color color,
    required IconData icon,
    required String label,
  }) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: color.withValues(alpha: 0.85),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
