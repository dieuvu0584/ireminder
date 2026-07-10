import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../data/database/app_database.dart';
import '../../providers/category_providers.dart';
import '../../widgets/color_picker.dart';
import '../../widgets/icon_catalog.dart';
import '../reminders/reminder_list_screen.dart';
import 'category_form_screen.dart';

class CategoryManagerScreen extends ConsumerWidget {
  const CategoryManagerScreen({super.key});

  Future<void> _handleDelete(
    BuildContext context,
    WidgetRef ref,
    Category category,
  ) async {
    final l10n = AppLocalizations.of(context);
    final actions = ref.read(categoryActionsProvider);
    final reminderCount = await actions.countReminders(category.id);
    if (!context.mounted) return;

    if (reminderCount == 0) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l10n.categoryDeleteSimpleTitle),
          content: Text(l10n.categoryDeleteSimpleBody),
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
        await actions.delete(category.id);
      }
      return;
    }

    if (!context.mounted) return;
    final categories = await ref.read(categoriesStreamProvider.future);
    final others = categories.where((c) => c.id != category.id).toList();

    if (!context.mounted) return;
    await showDialog<void>(
      context: context,
      builder: (ctx) => _CategoryDeleteDecisionDialog(
        category: category,
        reminderCount: reminderCount,
        otherCategories: others,
        onReassign: (targetId) async {
          await actions.reassignAndDelete(
            fromCategoryId: category.id,
            toCategoryId: targetId,
          );
        },
        onDeleteAll: () async {
          await actions.deleteWithReminders(category.id);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final categoriesAsync = ref.watch(categoriesStreamProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.categoryManagerTitle)),
      body: categoriesAsync.when(
        data: (categories) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                l10n.categoryReorderHint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Expanded(
              child: ReorderableListView.builder(
                itemCount: categories.length,
                onReorderItem: (oldIndex, newIndex) {
                  final ids = categories.map((c) => c.id).toList();
                  if (newIndex > oldIndex) newIndex -= 1;
                  final moved = ids.removeAt(oldIndex);
                  ids.insert(newIndex, moved);
                  ref.read(categoryActionsProvider).reorder(ids);
                },
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return ListTile(
                    key: ValueKey(category.id),
                    leading: Icon(
                      resolveCategoryIcon(category.icon),
                      color: parseHexColor(category.color),
                    ),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            category.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (category.isSystemDefault) ...[
                          const SizedBox(width: 8),
                          _DefaultBadge(label: l10n.categoryDefaultBadge),
                        ],
                      ],
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ReminderListScreen(category: category),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  CategoryFormScreen(existing: category),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () =>
                              _handleDelete(context, ref, category),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text(l10n.errorLoadFailed)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const CategoryFormScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// A compact inline badge, sized to sit level with body text — unlike
/// [Chip], which defaults to a much taller minimum height and visibly
/// throws off the row it sits in next to a plain [Text].
class _DefaultBadge extends StatelessWidget {
  final String label;

  const _DefaultBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: scheme.secondaryContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          height: 1.2,
          fontWeight: FontWeight.w600,
          color: scheme.onSecondaryContainer,
        ),
      ),
    );
  }
}

class _CategoryDeleteDecisionDialog extends StatefulWidget {
  final Category category;
  final int reminderCount;
  final List<Category> otherCategories;
  final Future<void> Function(int targetCategoryId) onReassign;
  final Future<void> Function() onDeleteAll;

  const _CategoryDeleteDecisionDialog({
    required this.category,
    required this.reminderCount,
    required this.otherCategories,
    required this.onReassign,
    required this.onDeleteAll,
  });

  @override
  State<_CategoryDeleteDecisionDialog> createState() =>
      _CategoryDeleteDecisionDialogState();
}

class _CategoryDeleteDecisionDialogState
    extends State<_CategoryDeleteDecisionDialog> {
  int? _target;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _target =
        widget.otherCategories.isNotEmpty ? widget.otherCategories.first.id : null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      title: Text(l10n.categoryDeleteHasRemindersTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.categoryDeleteHasRemindersBody(widget.reminderCount)),
          const SizedBox(height: 16),
          if (widget.otherCategories.isNotEmpty) ...[
            Text(l10n.categoryDeleteReassign,
                style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            DropdownButtonFormField<int>(
              initialValue: _target,
              decoration:
                  InputDecoration(labelText: l10n.categoryDeleteReassignTarget),
              items: widget.otherCategories
                  .map((c) =>
                      DropdownMenuItem(value: c.id, child: Text(c.name)))
                  .toList(),
              onChanged: (v) => setState(() => _target = v),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _busy || _target == null
                    ? null
                    : () async {
                        setState(() => _busy = true);
                        await widget.onReassign(_target!);
                        if (context.mounted) Navigator.of(context).pop();
                      },
                child: Text(l10n.categoryDeleteReassign),
              ),
            ),
          ],
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
              onPressed: _busy
                  ? null
                  : () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          content: Text(
                            l10n.categoryDeleteRemoveAllConfirm(
                              widget.reminderCount,
                            ),
                          ),
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
                        setState(() => _busy = true);
                        await widget.onDeleteAll();
                        if (context.mounted) Navigator.of(context).pop();
                      }
                    },
              child: Text(l10n.categoryDeleteRemoveAll(widget.reminderCount)),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: _busy ? null : () => Navigator.of(context).pop(),
          child: Text(l10n.actionCancel),
        ),
      ],
    );
  }
}
