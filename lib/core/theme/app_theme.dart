

// lib/core/theme/app_theme.dart
// TIMPA / BUAT FILE INI - main.dart butuh AppTheme.light
import 'package:flutter/material.dart';
class AppTheme {
  static const primary = Color(0xFF1A7CFF);
  static const primaryDark = Color(0xFF0B5ED7);
  static const bg = Color(0xFFF6F8FB);
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primary, brightness: Brightness.light),
        scaffoldBackgroundColor: bg,
        appBarTheme: const AppBarTheme(backgroundColor: primary, foregroundColor: Colors.white, elevation: 0),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: primary,
          unselectedItemColor: Color(0xFF9AA6B8),
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
        ),
        cardTheme: CardThemeData(color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)), elevation: 0),
      );
}
