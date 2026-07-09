import 'package:flutter/material.dart';

class SupportedLocale {
  final String code;
  final String nativeName;
  const SupportedLocale(this.code, this.nativeName);
}

/// Ordered by popularity, per PROMPT.md §7. Only languages that actually
/// have a translated .arb file belong here — an entry with no
/// AppLocalizations_<code> class would silently render English text
/// while claiming to be a different language, which is worse than not
/// listing it. Add the next language by dropping in `app_<code>.arb`
/// and appending one line here.
const List<SupportedLocale> kSupportedLocales = [
  SupportedLocale('en', 'English'),
  SupportedLocale('vi', 'Tiếng Việt'),
  SupportedLocale('zh', '简体中文'),
  SupportedLocale('hi', 'हिन्दी'),
  SupportedLocale('de', 'Deutsch'),
  SupportedLocale('fr', 'Français'),
  SupportedLocale('es', 'Español'),
];

/// Detects the system locale at first launch and picks the closest
/// supported translation, falling back to English if the system
/// language hasn't been translated yet. Only used once, at install time —
/// afterwards the app reads the locale saved in Settings.
Locale resolveInitialLocale(Locale? systemLocale) {
  if (systemLocale == null) return const Locale('en');
  final match = kSupportedLocales
      .where((l) => l.code == systemLocale.languageCode)
      .toList();
  return match.isNotEmpty ? Locale(match.first.code) : const Locale('en');
}
