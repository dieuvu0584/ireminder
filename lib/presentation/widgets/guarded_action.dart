import 'package:flutter/material.dart';

import '../../core/localization/gen/app_localizations.dart';

/// Runs a fire-and-forget UI action (complete/snooze/delete/...) and shows
/// a generic error snackbar instead of letting a failure surface as a
/// silent no-op — the button press otherwise looks like it did nothing.
///
/// [successMessage], when given, shows a confirmation snackbar after the
/// action succeeds — used for actions like "mark done" where the item
/// disappearing from its list immediately afterward could otherwise read
/// as the tap having done nothing (or something going wrong) rather than
/// working as intended.
Future<void> runGuarded(
  BuildContext context,
  Future<void> Function() action, {
  String? successMessage,
}) async {
  final messenger = ScaffoldMessenger.of(context);
  final errorText = AppLocalizations.of(context).errorGeneric;
  try {
    await action();
    if (successMessage != null) {
      messenger.showSnackBar(SnackBar(content: Text(successMessage)));
    }
  } catch (_) {
    messenger.showSnackBar(SnackBar(content: Text(errorText)));
  }
}
