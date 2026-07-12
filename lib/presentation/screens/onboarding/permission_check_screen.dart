import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../providers/notification_providers.dart';
import '../../widgets/permission_checklist.dart';

/// Shown right after onboarding, and again on any later app launch while
/// notification or exact-alarm permission is still missing — the app is
/// useless without them, so a status buried in Settings that the user has
/// to think to go check isn't enough. [onContinue] is called (with this
/// screen's own BuildContext, since it's the one guaranteed to sit inside
/// the app's Navigator) once the user chooses to proceed — either
/// everything's granted, or they explicitly confirmed they want to
/// continue anyway.
class PermissionCheckScreen extends ConsumerWidget {
  final void Function(BuildContext context) onContinue;

  const PermissionCheckScreen({super.key, required this.onContinue});

  Future<void> _handleContinue(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final status = ref.read(permissionStatusProvider).valueOrNull;
    final criticalGranted =
        status != null &&
        status.notificationsEnabled &&
        status.exactAlarmsEnabled;
    if (!criticalGranted) {
      final proceed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l10n.permissionCheckIncompleteTitle),
          content: Text(l10n.permissionCheckIncompleteBody),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(l10n.permissionCheckIncompleteStay),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(l10n.permissionCheckIncompleteContinue),
            ),
          ],
        ),
      );
      if (proceed != true) return;
    }
    if (context.mounted) onContinue(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.permissionCheckTitle),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                l10n.permissionCheckIntro,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(child: PermissionsChecklist()),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => _handleContinue(context, ref),
                  child: Text(l10n.permissionCheckContinueAction),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
