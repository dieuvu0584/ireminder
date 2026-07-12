import 'package:flutter/material.dart';

import '../../core/localization/gen/app_localizations.dart';
import '../../core/utils/date_formatter.dart';
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

  /// Whether this occurrence was actually completed — green check if so.
  /// If not completed, the check is orange while still actionable
  /// ([historical] false) or gray once it's a past, auto-skipped
  /// occurrence ([historical] true) — see [_trailingColor].
  final bool completed;

  /// True for an entry the calendar plots on a past day (either completed
  /// or auto-skipped) — shown as a plain, non-interactive row instead of
  /// swipe-to-complete/snooze actions, since a past occurrence isn't
  /// something to act on again.
  final bool historical;

  /// When set, shown next to the time in the subtitle. Used by the Today
  /// tab's "what happened today" section, where every row is pinned to
  /// today by construction but a visible date still makes it explicit at
  /// a glance rather than implicit from the section heading alone.
  final DateTime? occurrenceDate;

  /// Only meaningful when [historical] is true: keeps the trailing check
  /// tappable (calling [onComplete], which the caller wires to whichever
  /// of complete/uncomplete undoes the current state) instead of locking
  /// it. Used for today's own entries, where "oops, wrong one" should
  /// still be fixable same-day — unlike a genuinely past day's entries,
  /// which stay locked since nothing lets you undo those.
  final bool allowToggle;

  /// True when this reminder's due day hasn't arrived yet. Completing a
  /// reminder before its actual due day either creates a duplicate "done"
  /// entry (recurring: tapping repeatedly before the due day each logs a
  /// separate completion for today) or makes it vanish entirely (one-off:
  /// it gets deactivated while nextDueDate stays in the future, so it's no
  /// longer listed as upcoming but also isn't today's date for the Today
  /// section to pick up). Locks the Complete action only — Snooze stays
  /// available regardless of due day.
  final bool completionLocked;

  const ReminderCard({
    super.key,
    required this.reminder,
    required this.category,
    required this.onTap,
    required this.onComplete,
    required this.onSnooze,
    this.completed = false,
    this.historical = false,
    this.occurrenceDate,
    this.allowToggle = false,
    this.completionLocked = false,
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
            Text(
              occurrenceDate != null
                  ? '${DateFormatter.formatDate(occurrenceDate!, Localizations.localeOf(context).toString())} · '
                        '${reminder.reminderTime} · ${category?.name ?? ''}'
                  : '${reminder.reminderTime} · ${category?.name ?? ''}',
            ),
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
        // Always the same IconButton, whether tappable or not (rather
        // than switching between IconButton and a bare Icon), so the
        // trailing check never shifts position/size between rows —
        // IconButton's own padding and minimum tap target differ from a
        // plain Icon's, which misaligned rows that mixed the two.
        trailing: IconButton(
          icon: Icon(
            completed || historical
                ? Icons.check_circle
                : Icons.check_circle_outline,
            color: _trailingColor(context),
          ),
          onPressed: (!historical || allowToggle) && !completionLocked
              ? onComplete
              : null,
        ),
      ),
    );

    if (historical) return card;

    return Dismissible(
      key: ValueKey('reminder_${reminder.id}'),
      direction: completionLocked
          ? DismissDirection.endToStart
          : DismissDirection.horizontal,
      background: completionLocked
          ? null
          : _swipeBackground(
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

  /// Green once done; orange while still due and actionable; gray once
  /// it's moved past its day without being done (see
  /// ReminderRepository.autoSkipOverdue) — a glance at the color alone
  /// tells you whether something still needs attention.
  Color _trailingColor(BuildContext context) {
    if (completed) return Colors.green;
    if (historical) return Theme.of(context).colorScheme.outline;
    return Colors.orange;
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
