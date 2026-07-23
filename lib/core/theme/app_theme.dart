import 'package:flutter/material.dart';

/// Fallback seed color used on devices without Android 12+ dynamic color
/// (wallpaper-based) support.
const Color kFallbackSeedColor = Color(0xFF3B82F6);

/// The same diagonal navy-to-cyan gradient as the app's own launcher icon
/// background — used on the Calendar header so it reads as "the app"
/// rather than a flat, unrelated accent color.
const Gradient kAppIconGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF0B1F49), Color(0xFF21A8E6)],
);

class AppTheme {
  static ThemeData light(ColorScheme? dynamicScheme) {
    final scheme =
        dynamicScheme ??
        ColorScheme.fromSeed(
          seedColor: kFallbackSeedColor,
          brightness: Brightness.light,
        );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
      ),
      cardTheme: const CardThemeData(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        clipBehavior: Clip.antiAlias,
      ),
    );
  }

  static ThemeData dark(ColorScheme? dynamicScheme) {
    final scheme =
        dynamicScheme ??
        ColorScheme.fromSeed(
          seedColor: kFallbackSeedColor,
          brightness: Brightness.dark,
        );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
      ),
      cardTheme: const CardThemeData(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        clipBehavior: Clip.antiAlias,
      ),
    );
  }

  static ThemeMode themeModeFromString(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
