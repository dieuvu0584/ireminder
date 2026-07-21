import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/localization/gen/app_localizations.dart';
import 'core/localization/supported_locales.dart';
import 'core/theme/app_theme.dart';
import 'data/services/notification_service.dart';
import 'presentation/providers/loan_providers.dart';
import 'presentation/providers/notification_providers.dart';
import 'presentation/providers/repository_providers.dart';
import 'presentation/providers/settings_providers.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/onboarding/onboarding_screen.dart';
import 'presentation/screens/onboarding/permission_check_screen.dart';
import 'presentation/screens/reminders/reminder_detail_screen.dart';

/// Lets the notification-tap handler below push a route without a
/// BuildContext of its own — it runs from a plugin callback, outside the
/// widget tree.
final navigatorKey = GlobalKey<NavigatorState>();

final appBootstrapProvider = FutureProvider<void>((ref) async {
  final notificationService = ref.read(notificationServiceProvider);
  notificationService.onAction = (actionId, payload) async {
    if (payload == null) return;
    final parts = payload.split(':');
    if (parts.length != 2) return;
    final id = int.tryParse(parts[1]);
    if (id == null) return;

    if (actionId == NotificationActionIds.installmentPaid) {
      // Tapping an action button does not auto-dismiss the notification
      // (unlike tapping the body, which respects autoCancel) — dismiss it
      // explicitly, and do so before any DB work below so the visible
      // "did my tap register" feedback never waits on it.
      await notificationService.cancelInstallment(id);
    }

    try {
      if (parts[0] == 'reminder') {
        // Reminders have no action buttons anymore (Done/Snooze turned
        // out unreliable on at least one real device) — every tap here is
        // a plain tap on the notification body, so just open the
        // reminder's detail screen, where Done/Snooze already exist as
        // regular in-app buttons.
        final reminder = await ref.read(reminderRepositoryProvider).getById(id);
        if (reminder != null) {
          navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (_) => ReminderDetailScreen(reminder: reminder),
            ),
          );
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
    } catch (e) {
      debugPrint('appBootstrap: notification tap handler failed: $e');
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
    // Once a reminder's due day has fully passed without being completed,
    // stop re-nagging about it every time the app reopens — move it
    // forward (or deactivate one-off reminders) instead. Must run before
    // rescheduleAllFromDatabase below so the OS alarm gets scheduled
    // against the corrected date, not the stale one.
    await ref.read(reminderRepositoryProvider).autoSkipOverdue();
  } catch (e) {
    debugPrint('appBootstrap: autoSkipOverdue failed: $e');
  }

  try {
    // Same idea as autoSkipOverdue, for loan installments — once a due
    // date passes without being paid, it locks in as overdue instead of
    // staying tappable forever.
    await ref.read(loanRepositoryProvider).autoMarkOverdueInstallments();
  } catch (e) {
    debugPrint('appBootstrap: autoMarkOverdueInstallments failed: $e');
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
          navigatorKey: navigatorKey,
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
              data: (settings) {
                if (!settings.onboardingCompleted) {
                  return const OnboardingScreen();
                }
                // Onboarding only ever asks once and moves on regardless of
                // outcome (or the user may have revoked a permission later
                // from system Settings), so re-check on every cold start
                // and surface the same checklist again rather than letting
                // a reminder silently never fire with no explanation.
                // Waits for the check (via .when, not valueOrNull) rather
                // than defaulting to HomeScreen while loading — the
                // Navigator only resolves its initial route once, so
                // picking HomeScreen first and "switching" once the async
                // check resolves would never actually take effect.
                final permAsync = ref.watch(permissionStatusProvider);
                return permAsync.when(
                  data: (status) {
                    if (!status.notificationsEnabled ||
                        !status.exactAlarmsEnabled) {
                      return PermissionCheckScreen(
                        onContinue: (ctx) => Navigator.of(ctx).pushReplacement(
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        ),
                      );
                    }
                    return const HomeScreen();
                  },
                  loading: () => const _SplashScreen(),
                  error: (e, st) => const HomeScreen(),
                );
              },
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
