import 'package:flutter/material.dart';

import '../../core/localization/gen/app_localizations.dart';

/// Runs a fire-and-forget UI action (complete/snooze/delete/...) and shows
/// a generic error snackbar instead of letting a failure surface as a
/// silent no-op — the button press otherwise looks like it did nothing.
Future<void> runGuarded(
  BuildContext context,
  Future<void> Function() action,
) async {
  final messenger = ScaffoldMessenger.of(context);
  final errorText = AppLocalizations.of(context).errorGeneric;
  try {
    await action();
  } catch (_) {
    messenger.showSnackBar(SnackBar(content: Text(errorText)));
  }
}
