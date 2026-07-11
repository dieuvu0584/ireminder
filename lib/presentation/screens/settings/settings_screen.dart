import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:url_launcher/url_launcher.dart';

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
            const _PermissionsSection(),
            const Divider(),
            const _NotificationPrefsSection(),
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
                try {
                  await ref.read(backupServiceProvider).exportBackup();
                  messenger.showSnackBar(
                    SnackBar(content: Text(l10n.settingsExportSuccess)),
                  );
                } catch (_) {
                  messenger.showSnackBar(
                    SnackBar(content: Text(l10n.errorGeneric)),
                  );
                }
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

/// Onboarding only ever asks for these permissions once and moves on
/// regardless of the outcome, so a denial there previously left the user
/// with no way to ever grant them again. This section shows live status
/// and lets them grant/open system settings at any time. Re-checks status
/// on every app resume since there's no OS-level permission-change
/// listener — the user may have toggled it from system Settings directly.
class _PermissionsSection extends ConsumerStatefulWidget {
  const _PermissionsSection();

  @override
  ConsumerState<_PermissionsSection> createState() =>
      _PermissionsSectionState();
}

class _PermissionsSectionState extends ConsumerState<_PermissionsSection>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.invalidate(permissionStatusProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final statusAsync = ref.watch(permissionStatusProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Text(
            l10n.settingsPermissionsSectionTitle,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        statusAsync.when(
          data: (status) => Column(
            children: [
              _PermissionRow(
                label: l10n.settingsPermissionsNotificationLabel,
                granted: status.notificationsEnabled,
                l10n: l10n,
                onGrant: () async {
                  await ref
                      .read(notificationServiceProvider)
                      .requestNotificationsOnly();
                  ref.invalidate(permissionStatusProvider);
                },
              ),
              _PermissionRow(
                label: l10n.settingsPermissionsExactAlarmLabel,
                granted: status.exactAlarmsEnabled,
                l10n: l10n,
                onGrant: () async {
                  await ref
                      .read(notificationServiceProvider)
                      .requestExactAlarmsOnly();
                  ref.invalidate(permissionStatusProvider);
                },
              ),
            ],
          ),
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: LinearProgressIndicator(),
          ),
          error: (e, st) => const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class _PermissionRow extends StatelessWidget {
  final String label;
  final bool granted;
  final AppLocalizations l10n;
  final Future<void> Function() onGrant;

  const _PermissionRow({
    required this.label,
    required this.granted,
    required this.l10n,
    required this.onGrant,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(
        granted ? Icons.check_circle : Icons.error_outline,
        color: granted ? Colors.green : scheme.error,
      ),
      title: Text(label),
      subtitle: Text(
        granted
            ? l10n.settingsPermissionsGranted
            : l10n.settingsPermissionsDenied,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: granted
          ? null
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: onGrant,
                  child: Text(l10n.settingsPermissionsGrantAction),
                ),
                IconButton(
                  tooltip: l10n.settingsPermissionsOpenSettingsAction,
                  icon: const Icon(Icons.settings_outlined),
                  onPressed: () => ph.openAppSettings(),
                ),
              ],
            ),
    );
  }
}

class _NotificationPrefsSection extends ConsumerWidget {
  const _NotificationPrefsSection();

  static const List<int> _snoozeOptions = [5, 10, 15, 30, 60, 120];

  String _snoozeLabel(AppLocalizations l10n, int minutes) {
    switch (minutes) {
      case 5:
        return l10n.snoozeDuration5Min;
      case 10:
        return l10n.snoozeDuration10Min;
      case 15:
        return l10n.snoozeDuration15Min;
      case 30:
        return l10n.snoozeDuration30Min;
      case 60:
        return l10n.snoozeDuration60Min;
      default:
        return l10n.snoozeDuration120Min;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final settingsAsync = ref.watch(settingsStreamProvider);
    final actions = ref.read(settingsActionsProvider);

    return settingsAsync.when(
      data: (settings) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              l10n.settingsNotificationPrefsTitle,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          SwitchListTile(
            title: Text(l10n.settingsNotificationSound),
            value: settings.notificationSoundEnabled,
            onChanged: (v) async {
              await actions.setNotificationSoundEnabled(v);
              // Sound/vibration is baked into the Android notification
              // channel at schedule time, not read at fire time — every
              // already-scheduled alarm has to be rescheduled onto the
              // channel variant matching the new preference, or it'll
              // keep firing with the old setting until it's next touched.
              await ref
                  .read(alarmSchedulerServiceProvider)
                  .rescheduleAllFromDatabase();
            },
          ),
          SwitchListTile(
            title: Text(l10n.settingsNotificationVibration),
            value: settings.notificationVibrationEnabled,
            onChanged: (v) async {
              await actions.setNotificationVibrationEnabled(v);
              await ref
                  .read(alarmSchedulerServiceProvider)
                  .rescheduleAllFromDatabase();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonFormField<int>(
              key: ValueKey(settings.snoozeDurationMinutes),
              initialValue: settings.snoozeDurationMinutes,
              decoration:
                  InputDecoration(labelText: l10n.settingsSnoozeDuration),
              items: _snoozeOptions
                  .map((m) => DropdownMenuItem(
                        value: m,
                        child: Text(_snoozeLabel(l10n, m)),
                      ))
                  .toList(),
              onChanged: (v) {
                if (v != null) actions.setSnoozeDurationMinutes(v);
              },
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
      loading: () => const SizedBox.shrink(),
      error: (e, st) => const SizedBox.shrink(),
    );
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
  void initState() {
    super.initState();
    // DropdownMenu's onSelected only fires when picking a quick-pick entry
    // — this also persists a manually-typed model name, since the field
    // stays freely editable rather than constrained to the pick list.
    _modelCtrl.addListener(() {
      ref.read(aiSettingsActionsProvider).setModel(_modelCtrl.text);
    });
  }

  @override
  void dispose() {
    _apiKeyCtrl.dispose();
    _modelCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadKeyFor(String providerId) async {
    if (_loadedForProviderId == providerId) return;
    _loadedForProviderId = providerId;
    try {
      final key =
          await ref.read(aiSettingsActionsProvider).getApiKey(providerId);
      if (mounted && _loadedForProviderId == providerId) {
        _apiKeyCtrl.text = key ?? '';
      }
    } catch (_) {
      // Secure storage can fail (e.g. Android Keystore key invalidated by a
      // lock-screen/biometric change) — leave the field blank rather than
      // crash; the user can re-enter and re-save the key.
      if (mounted && _loadedForProviderId == providerId) {
        _apiKeyCtrl.text = '';
      }
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
                  // Keyed on provider id so this widget is rebuilt fresh
                  // (picking up the new `initialValue`) if providerId
                  // changes from outside this screen's own onChanged —
                  // e.g. a backup restore. DropdownButtonFormField only
                  // applies `initialValue` once per widget instance, so
                  // without this key it would keep showing the old
                  // provider while the API key field below it (which
                  // reacts to `provider.id` directly) already swapped to
                  // the new provider's key — a mismatched pairing.
                  key: ValueKey(provider?.id),
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
                  // DropdownMenu rather than a plain DropdownButton: it's
                  // still a free-text field under the hood (via its own
                  // controller), so picking a model from the quick-pick
                  // list is convenient but never blocks typing a model
                  // name the provider ships after commonModels goes stale.
                  child: DropdownMenu<String>(
                    controller: _modelCtrl,
                    expandedInsets: EdgeInsets.zero,
                    label: Text(l10n.settingsAiModel),
                    enableFilter: true,
                    requestFocusOnTap: true,
                    onSelected: (v) {
                      if (v != null) actions.setModel(v);
                    },
                    dropdownMenuEntries: provider.commonModels
                        .map((m) => DropdownMenuEntry(value: m, label: m))
                        .toList(),
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
                              try {
                                await actions.setApiKey(
                                  provider.id,
                                  _apiKeyCtrl.text.trim(),
                                );
                                messenger.showSnackBar(
                                  SnackBar(
                                    content:
                                        Text(l10n.settingsAiApiKeySaved),
                                  ),
                                );
                              } catch (_) {
                                messenger.showSnackBar(
                                  SnackBar(content: Text(l10n.errorGeneric)),
                                );
                              }
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
                    onTap: () => launchUrl(
                      Uri.parse(provider.apiKeyHelpUrl),
                      mode: LaunchMode.externalApplication,
                    ),
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
