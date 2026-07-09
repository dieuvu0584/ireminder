import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../../core/localization/supported_locales.dart';
import '../../../data/services/backup_service.dart';
import '../../providers/backup_providers.dart';
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
                final result =
                    await ref.read(backupServiceProvider).importBackup();
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
