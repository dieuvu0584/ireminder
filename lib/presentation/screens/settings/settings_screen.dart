import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/localization/supported_locales.dart';
import '../../../data/services/backup_service.dart';
import '../../../domain/ai_providers/ai_provider_factory.dart';
import '../../providers/ai_providers.dart';
import '../../providers/backup_providers.dart';
import '../../providers/category_providers.dart';
import '../../providers/notification_providers.dart';
import '../../providers/settings_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final settingsAsync = ref.watch(settingsStreamProvider);
    final actions = ref.read(settingsActionsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: settingsAsync.when(
        data: (settings) => ListView(
          children: [
            ListTile(
              title: Text(l10n.settingsLanguage),
              subtitle: Text(
                kSupportedLocales
                    .firstWhere(
                      (l) => l.code == (settings.locale ?? 'en'),
                      orElse: () => kSupportedLocales.first,
                    )
                    .nativeName,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                final selected = await showDialog<String>(
                  context: context,
                  builder: (ctx) => SimpleDialog(
                    title: Text(l10n.settingsLanguage),
                    children: kSupportedLocales
                        .map(
                          (l) => SimpleDialogOption(
                            onPressed: () => Navigator.of(ctx).pop(l.code),
                            child: Text(l.nativeName),
                          ),
                        )
                        .toList(),
                  ),
                );
                if (selected != null) {
                  await actions.setLocale(selected);
                }
              },
            ),
            ListTile(
              title: Text(l10n.settingsDefaultReminderTime),
              subtitle: Text(settings.defaultReminderTime),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                final parts = settings.defaultReminderTime.split(':');
                final picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(
                    hour: int.parse(parts[0]),
                    minute: int.parse(parts[1]),
                  ),
                );
                if (picked != null) {
                  final hhmm =
                      '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
                  await actions.setDefaultReminderTime(hhmm);
                }
              },
            ),
            ListTile(
              title: Text(l10n.settingsTheme),
              subtitle: Text(_themeLabel(l10n, settings.themeMode)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                final selected = await showDialog<String>(
                  context: context,
                  builder: (ctx) => SimpleDialog(
                    title: Text(l10n.settingsTheme),
                    children: [
                      SimpleDialogOption(
                        onPressed: () => Navigator.of(ctx).pop('system'),
                        child: Text(l10n.settingsThemeSystem),
                      ),
                      SimpleDialogOption(
                        onPressed: () => Navigator.of(ctx).pop('light'),
                        child: Text(l10n.settingsThemeLight),
                      ),
                      SimpleDialogOption(
                        onPressed: () => Navigator.of(ctx).pop('dark'),
                        child: Text(l10n.settingsThemeDark),
                      ),
                    ],
                  ),
                );
                if (selected != null) {
                  await actions.setThemeMode(selected);
                }
              },
            ),
            const Divider(),
            const _AiAssistantSection(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Text(
                l10n.settingsBackupRestore,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.upload_outlined),
              title: Text(l10n.settingsExport),
              subtitle: Text(l10n.settingsExportLocationHint),
              onTap: () async {
                final messenger = ScaffoldMessenger.of(context);
                await ref.read(backupServiceProvider).exportBackup();
                messenger.showSnackBar(
                  SnackBar(content: Text(l10n.settingsExportSuccess)),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.download_outlined),
              title: Text(l10n.settingsImport),
              onTap: () async {
                final backups =
                    await ref.read(backupServiceProvider).listBackups();
                if (!context.mounted) return;
                if (backups.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.settingsImportNoneFound)),
                  );
                  return;
                }
                final chosen = await showDialog<File>(
                  context: context,
                  builder: (ctx) => SimpleDialog(
                    title: Text(l10n.settingsImportPickFile),
                    children: backups
                        .map(
                          (f) => SimpleDialogOption(
                            onPressed: () => Navigator.of(ctx).pop(f),
                            child: Text(f.path.split('/').last),
                          ),
                        )
                        .toList(),
                  ),
                );
                if (chosen == null || !context.mounted) return;

                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(l10n.settingsImportConfirmTitle),
                    content: Text(l10n.settingsImportConfirmBody),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(false),
                        child: Text(l10n.actionCancel),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(true),
                        child: Text(l10n.actionConfirm),
                      ),
                    ],
                  ),
                );
                if (confirmed != true || !context.mounted) return;
                final messenger = ScaffoldMessenger.of(context);
                final result = await ref
                    .read(backupServiceProvider)
                    .importBackup(chosen);
                if (result == BackupImportResult.success) {
                  await ref
                      .read(alarmSchedulerServiceProvider)
                      .rescheduleAllFromDatabase();
                  messenger.showSnackBar(
                    SnackBar(content: Text(l10n.settingsImportSuccess)),
                  );
                } else if (result == BackupImportResult.failed) {
                  messenger.showSnackBar(
                    SnackBar(content: Text(l10n.errorGeneric)),
                  );
                }
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.settingsBatteryOptimizationTitle,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 6),
                      Text(l10n.settingsBatteryOptimizationBody),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text(l10n.errorLoadFailed)),
      ),
    );
  }

  String _themeLabel(AppLocalizations l10n, String mode) {
    switch (mode) {
      case 'light':
        return l10n.settingsThemeLight;
      case 'dark':
        return l10n.settingsThemeDark;
      default:
        return l10n.settingsThemeSystem;
    }
  }
}

class _AiAssistantSection extends ConsumerStatefulWidget {
  const _AiAssistantSection();

  @override
  ConsumerState<_AiAssistantSection> createState() =>
      _AiAssistantSectionState();
}

class _AiAssistantSectionState extends ConsumerState<_AiAssistantSection> {
  final _apiKeyCtrl = TextEditingController();
  final _modelCtrl = TextEditingController();
  String? _loadedForProviderId;
  bool _obscureKey = true;

  @override
  void dispose() {
    _apiKeyCtrl.dispose();
    _modelCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadKeyFor(String providerId) async {
    if (_loadedForProviderId == providerId) return;
    _loadedForProviderId = providerId;
    final key = await ref.read(aiSettingsActionsProvider).getApiKey(providerId);
    if (mounted && _loadedForProviderId == providerId) {
      _apiKeyCtrl.text = key ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final settingsAsync = ref.watch(aiSettingsStreamProvider);
    final categoriesAsync = ref.watch(categoriesStreamProvider);
    final actions = ref.read(aiSettingsActionsProvider);

    return settingsAsync.when(
      data: (settings) {
        final provider = AiProviderFactory.byId(settings.providerId);
        if (provider != null) {
          _loadKeyFor(provider.id);
          if (_modelCtrl.text.isEmpty) {
            _modelCtrl.text = settings.modelName ?? provider.defaultModel;
          }
        }
        final allowedIds =
            ref.read(aiSettingsRepositoryProvider).allowedCategoryIds(settings);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text(l10n.settingsAiSectionTitle),
              subtitle: Text(l10n.settingsAiEnable),
              value: settings.isEnabled,
              onChanged: (v) => actions.setEnabled(v),
            ),
            if (settings.isEnabled) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButtonFormField<String>(
                  initialValue: provider?.id,
                  decoration:
                      InputDecoration(labelText: l10n.settingsAiProvider),
                  items: AiProviderFactory.all
                      .map((p) => DropdownMenuItem(
                            value: p.id,
                            child: Text(p.displayName),
                          ))
                      .toList(),
                  onChanged: (id) {
                    if (id == null) return;
                    final selected = AiProviderFactory.byId(id)!;
                    _modelCtrl.text = selected.defaultModel;
                    _loadedForProviderId = null;
                    actions.setProvider(id, selected.defaultModel);
                  },
                ),
              ),
              if (provider != null) ...[
                Padding(
                  padding:
                      const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: TextField(
                    controller: _modelCtrl,
                    decoration:
                        InputDecoration(labelText: l10n.settingsAiModel),
                    onChanged: (v) => actions.setModel(v),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: TextField(
                    controller: _apiKeyCtrl,
                    obscureText: _obscureKey,
                    decoration: InputDecoration(
                      labelText: l10n.settingsAiApiKey,
                      hintText: l10n.settingsAiApiKeyHint,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(_obscureKey
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                            onPressed: () =>
                                setState(() => _obscureKey = !_obscureKey),
                          ),
                          IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: () async {
                              final messenger = ScaffoldMessenger.of(context);
                              await actions.setApiKey(
                                provider.id,
                                _apiKeyCtrl.text.trim(),
                              );
                              messenger.showSnackBar(
                                SnackBar(
                                  content: Text(l10n.settingsAiApiKeySaved),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      l10n.settingsAiApiKeyHelp,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: Text(
                  l10n.settingsAiAllowedCategories,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  l10n.settingsAiAllowedCategoriesHint,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              categoriesAsync.when(
                data: (categories) => Column(
                  children: categories
                      .map(
                        (c) => CheckboxListTile(
                          dense: true,
                          title: Text(c.name),
                          value: allowedIds.contains(c.id),
                          onChanged: (checked) {
                            final next = Set<int>.from(allowedIds);
                            if (checked == true) {
                              next.add(c.id);
                            } else {
                              next.remove(c.id);
                            }
                            actions.setAllowedCategoryIds(next);
                          },
                        ),
                      )
                      .toList(),
                ),
                loading: () => const SizedBox.shrink(),
                error: (e, st) => const SizedBox.shrink(),
              ),
              ListTile(
                leading: const Icon(Icons.delete_sweep_outlined),
                title: Text(l10n.settingsAiClearHistory),
                onTap: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(l10n.settingsAiClearHistoryConfirmTitle),
                      content: Text(l10n.settingsAiClearHistoryConfirmBody),
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
                    await ref.read(aiChatActionsProvider).clearHistory();
                  }
                },
              ),
            ],
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (e, st) => const SizedBox.shrink(),
    );
  }
}
