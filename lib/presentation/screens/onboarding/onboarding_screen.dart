import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/gen/app_localizations.dart';
import '../../providers/notification_providers.dart';
import '../../providers/settings_providers.dart';
import '../home/home_screen.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  Future<void> _finish() async {
    final l10n = AppLocalizations.of(context);
    final proceed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.notificationPermissionTitle),
        content: Text(l10n.notificationPermissionBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.notificationPermissionLater),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.notificationPermissionAllow),
          ),
        ],
      ),
    );
    if (proceed == true) {
      await ref.read(notificationServiceProvider).requestNotificationsOnly();
      if (mounted) {
        // Exact-alarm permission redirects straight to a system Settings
        // page with no dialog of its own — explain why before the app
        // suddenly loses focus, rather than leaving it unexplained.
        await showDialog<void>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(l10n.onboardingExactAlarmRationaleTitle),
            content: Text(l10n.onboardingExactAlarmRationaleBody),
            actions: [
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text(l10n.actionOk),
              ),
            ],
          ),
        );
      }
      if (mounted) {
        await ref.read(notificationServiceProvider).requestExactAlarmsOnly();
      }
    }
    if (!mounted) return;
    await ref.read(settingsActionsProvider).setOnboardingCompleted(true);
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final slides = [
      (title: l10n.onboardingTitle1, body: l10n.onboardingBody1, emoji: '🔔'),
      (title: l10n.onboardingTitle2, body: l10n.onboardingBody2, emoji: '🔁'),
      (title: l10n.onboardingTitle3, body: l10n.onboardingBody3, emoji: '🔒'),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _finish,
                child: Text(l10n.onboardingSkip),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: slides.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (context, index) {
                  final s = slides[index];
                  return LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      padding: const EdgeInsets.all(32),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(s.emoji, style: const TextStyle(fontSize: 72)),
                            const SizedBox(height: 24),
                            Text(
                              s.title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              s.body,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (i) => Container(
                  margin: const EdgeInsets.all(4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // surfaceContainerHighest for the inactive dots was
                    // barely distinguishable from the page background in
                    // the light theme, making it look like there was only
                    // one dot instead of one per slide.
                    color: i == _page
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (_page < slides.length - 1) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                      );
                    } else {
                      _finish();
                    }
                  },
                  child: Text(
                    _page < slides.length - 1
                        ? l10n.onboardingNext
                        : l10n.onboardingGetStarted,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
