import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

import '../../core/localization/gen/app_localizations.dart';
import '../providers/notification_providers.dart';

/// Live status + grant/open-settings actions for the 3 OS permissions
/// reminders depend on. Shared between Settings (revisit any time) and
/// the onboarding/launch permission-check screen (surfaced proactively) —
/// same widget, same behavior, so status shown never drifts between the
/// two places a user might check it.
///
/// Re-checks status on every app resume since there's no OS-level
/// permission-change listener — the user may have toggled it from system
/// Settings directly.
class PermissionsChecklist extends ConsumerStatefulWidget {
  final bool showTestNotificationButton;

  const PermissionsChecklist({
    super.key,
    this.showTestNotificationButton = true,
  });

  @override
  ConsumerState<PermissionsChecklist> createState() =>
      _PermissionsChecklistState();
}

class _PermissionsChecklistState extends ConsumerState<PermissionsChecklist>
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

    return statusAsync.when(
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
          _PermissionRow(
            label: l10n.settingsPermissionsBatteryLabel,
            granted: status.batteryOptimizationIgnored,
            l10n: l10n,
            onGrant: () async {
              await ph.Permission.ignoreBatteryOptimizations.request();
              ref.invalidate(permissionStatusProvider);
            },
          ),
          if (widget.showTestNotificationButton)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: OutlinedButton.icon(
                icon: const Icon(Icons.notifications_active_outlined),
                label: Text(l10n.settingsTestNotificationAction),
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  try {
                    await ref
                        .read(notificationServiceProvider)
                        .scheduleTestNotification();
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text(l10n.settingsTestNotificationScheduled),
                        duration: const Duration(seconds: 8),
                      ),
                    );
                  } catch (e) {
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text('${l10n.errorGeneric}\n$e'),
                        duration: const Duration(seconds: 10),
                      ),
                    );
                  }
                },
              ),
            ),
        ],
      ),
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: LinearProgressIndicator(),
      ),
      error: (e, st) => const SizedBox.shrink(),
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
