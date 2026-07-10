import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/localization/gen/app_localizations.dart';
import 'core/localization/supported_locales.dart';
import 'core/theme/app_theme.dart';
import 'data/services/notification_service.dart';
import 'presentation/providers/loan_providers.dart';
import 'presentation/providers/notification_providers.dart';
import 'presentation/providers/reminder_providers.dart';
import 'presentation/providers/repository_providers.dart';
import 'presentation/providers/settings_providers.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/onboarding/onboarding_screen.dart';

final appBootstrapProvider = FutureProvider<void>((ref) async {
  final notificationService = ref.read(notificationServiceProvider);
  notificationService.onAction = (actionId, payload) async {
    if (payload == null) return;
    final parts = payload.split(':');
    if (parts.length != 2) return;
    final id = int.tryParse(parts[1]);
    if (id == null) return;

    if (parts[0] == 'reminder') {
      if (actionId == NotificationActionIds.reminderSnooze) {
        await ref.read(reminderActionsProvider).snooze(
              id,
              DateTime.now().add(const Duration(hours: 1)),
            );
      } else {
        await ref.read(reminderActionsProvider).complete(id);
      }
    } else if (parts[0] == 'installment' &&
        actionId == NotificationActionIds.installmentPaid) {
      final installment =
          await ref.read(loanRepositoryProvider).getInstallmentById(id);
      if (installment != null) {
        await ref.read(loanActionsProvider).markPaid(
              loanId: installment.loanId,
              installmentIds: [installment.id],
              paidDate: DateTime.now(),
            );
      }
    }
  };
  // Notification setup and alarm scheduling touch the OS (permissions,
  // OEM restrictions, plugin channels) in ways this app can't fully
  // control. Neither may ever prevent the app itself from opening — a
  // reminder that fails to schedule is recoverable, an app stuck on a
  // splash screen forever is not.
  try {
    await notificationService.init();
  } catch (e) {
    debugPrint('appBootstrap: notification init failed: $e');
  }

  final settingsRepo = ref.read(settingsRepositoryProvider);
  final settings = await settingsRepo.get();
  if (settings.locale == null) {
    final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
    final resolved = resolveInitialLocale(systemLocale);
    await settingsRepo.setLocale(resolved.languageCode);
  }

  try {
    await ref
        .read(alarmSchedulerServiceProvider)
        .rescheduleAllFromDatabase();
  } catch (e) {
    debugPrint('appBootstrap: rescheduleAllFromDatabase failed: $e');
  }
});

class IReminderApp extends ConsumerWidget {
  const IReminderApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bootstrap = ref.watch(appBootstrapProvider);
    final settingsAsync = ref.watch(settingsStreamProvider);

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp(
          title: 'iReminder',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(lightDynamic),
          darkTheme: AppTheme.dark(darkDynamic),
          themeMode: AppTheme.themeModeFromString(
            settingsAsync.valueOrNull?.themeMode ?? 'system',
          ),
          locale: settingsAsync.valueOrNull?.locale != null
              ? Locale(settingsAsync.valueOrNull!.locale!)
              : null,
          supportedLocales:
              kSupportedLocales.map((l) => Locale(l.code)).toList(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          localeResolutionCallback: (locale, supported) {
            if (locale == null) return supported.first;
            for (final s in supported) {
              if (s.languageCode == locale.languageCode) return s;
            }
            return supported.first;
          },
          home: bootstrap.when(
            data: (_) => settingsAsync.when(
              data: (settings) => settings.onboardingCompleted
                  ? const HomeScreen()
                  : const OnboardingScreen(),
              loading: () => const _SplashScreen(),
              error: (e, st) => const _SplashScreen(),
            ),
            loading: () => const _SplashScreen(),
            error: (e, st) => const _SplashScreen(),
          ),
        );
      },
    );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
