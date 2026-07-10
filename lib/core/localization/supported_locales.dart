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
  SupportedLocale('zh', '简体中文'),
  SupportedLocale('hi', 'हिन्दी'),
  SupportedLocale('es', 'Español'),
  SupportedLocale('fr', 'Français'),
  SupportedLocale('ar', 'العربية'),
  SupportedLocale('bn', 'বাংলা'),
  SupportedLocale('pt', 'Português'),
  SupportedLocale('ru', 'Русский'),
  SupportedLocale('ur', 'اردو'),
  SupportedLocale('id', 'Bahasa Indonesia'),
  SupportedLocale('de', 'Deutsch'),
  SupportedLocale('ja', '日本語'),
  SupportedLocale('sw', 'Kiswahili'),
  SupportedLocale('mr', 'मराठी'),
  SupportedLocale('te', 'తెలుగు'),
  SupportedLocale('tr', 'Türkçe'),
  SupportedLocale('ta', 'தமிழ்'),
  SupportedLocale('vi', 'Tiếng Việt'),
  SupportedLocale('ko', '한국어'),
  SupportedLocale('it', 'Italiano'),
  SupportedLocale('fa', 'فارسی'),
  SupportedLocale('pa', 'ਪੰਜਾਬੀ'),
  SupportedLocale('gu', 'ગુજરાતી'),
  SupportedLocale('pl', 'Polski'),
  SupportedLocale('uk', 'Українська'),
  SupportedLocale('ms', 'Bahasa Melayu'),
  SupportedLocale('ro', 'Română'),
  SupportedLocale('nl', 'Nederlands'),
  SupportedLocale('th', 'ไทย'),
  SupportedLocale('el', 'Ελληνικά'),
  SupportedLocale('cs', 'Čeština'),
  SupportedLocale('hu', 'Magyar'),
  SupportedLocale('sv', 'Svenska'),
  SupportedLocale('he', 'עברית'),
  SupportedLocale('da', 'Dansk'),
  SupportedLocale('fi', 'Suomi'),
  SupportedLocale('no', 'Norsk'),
  SupportedLocale('fil', 'Filipino'),
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
