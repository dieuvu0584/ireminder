import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/localization/supported_locales.dart';
import '../../../data/services/backup_service.dart';
import '../../providers/backup_providers.dart';
import '../../providers/notification_providers.dart';
import '../../providers/settings_providers.dart';
import '../../widgets/permission_checklist.dart';
import '../categories/category_manager_screen.dart';

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
            ListTile(
              leading: const Icon(Icons.category_outlined),
              title: Text(l10n.navCategories),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CategoryManagerScreen(),
                ),
              ),
            ),
            const Divider(),
            const _PermissionsSection(),
            const Divider(),
            const _NotificationPrefsSection(),
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
                final backups = await ref
                    .read(backupServiceProvider)
                    .listBackups();
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
/// and lets them grant/open system settings at any time.
class _PermissionsSection extends StatelessWidget {
  const _PermissionsSection();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
        const PermissionsChecklist(),
      ],
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
              decoration: InputDecoration(
                labelText: l10n.settingsSnoozeDuration,
              ),
              items: _snoozeOptions
                  .map(
                    (m) => DropdownMenuItem(
                      value: m,
                      child: Text(_snoozeLabel(l10n, m)),
                    ),
                  )
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
