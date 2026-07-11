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
        final settings = await ref.read(settingsRepositoryProvider).get();
        await ref
            .read(reminderActionsProvider)
            .snooze(
              id,
              DateTime.now().add(
                Duration(minutes: settings.snoozeDurationMinutes),
              ),
            );
      } else {
        await ref.read(reminderActionsProvider).complete(id);
      }
    } else if (parts[0] == 'installment' &&
        actionId == NotificationActionIds.installmentPaid) {
      final installment = await ref
          .read(loanRepositoryProvider)
          .getInstallmentById(id);
      if (installment != null) {
        await ref
            .read(loanActionsProvider)
            .markPaid(
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
  Locale activeLocale;
  if (settings.locale == null) {
    final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
    activeLocale = resolveInitialLocale(systemLocale);
    await settingsRepo.setLocale(activeLocale.languageCode);
  } else {
    activeLocale = Locale(settings.locale!);
  }

  try {
    // Default categories were seeded once in whatever locale was active
    // at first launch; retranslate any that still hold a default name (in
    // any language) so an app update or a later language switch actually
    // takes effect on them too, without touching categories the user
    // renamed themselves.
    await ref
        .read(categoryRepositoryProvider)
        .syncDefaultCategoryNames(lookupAppLocalizations(activeLocale));
  } catch (e) {
    debugPrint('appBootstrap: syncDefaultCategoryNames failed: $e');
  }

  try {
    // A default category added in a later app update (e.g. Birthdays)
    // never reaches an existing install's DB otherwise — seeding only
    // ever runs once, against an empty table.
    await ref
        .read(categoryRepositoryProvider)
        .addMissingDefaultCategories(lookupAppLocalizations(activeLocale));
  } catch (e) {
    debugPrint('appBootstrap: addMissingDefaultCategories failed: $e');
  }

  try {
    // One-time self-heal for yearly/lunar-yearly reminders whose
    // next_due_date was wrongly set to their start date by a now-fixed
    // bug — corrects any row still showing the symptom, no-ops otherwise.
    await ref.read(reminderRepositoryProvider).healStaleYearlyDueDates();
  } catch (e) {
    debugPrint('appBootstrap: healStaleYearlyDueDates failed: $e');
  }

  try {
    await ref.read(alarmSchedulerServiceProvider).rescheduleAllFromDatabase();
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
          supportedLocales: kSupportedLocales
              .map((l) => Locale(l.code))
              .toList(),
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
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
