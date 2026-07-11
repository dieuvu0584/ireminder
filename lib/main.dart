import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {
  // Notification delivery runs through a plugin callback outside the
  // normal widget build/gesture cycle (an alarm firing while the app is
  // foregrounded, for instance) — an uncaught error there could otherwise
  // take down the whole isolate instead of just failing that one
  // notification. Both handlers log-and-continue rather than crash.
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.presentError(details);
        debugPrint('FlutterError: ${details.exceptionAsString()}');
      };
      runApp(const ProviderScope(child: IReminderApp()));
    },
    (error, stack) {
      debugPrint('Uncaught zone error: $error\n$stack');
    },
  );
}
