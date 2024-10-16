import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const _lightPrimaryColor = Color(0xFFFF0099);
const _darkPrimaryColor = Color(0xFFBDFF00);

final lightTheme = ThemeData(
  primaryColor: _lightPrimaryColor,
  dividerColor: Colors.grey.withOpacity(0.1),
  dividerTheme: DividerThemeData(
    color: Colors.grey.withOpacity(0.1),
  ),
  cardColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    foregroundColor: Color(0xFF202020),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: _lightPrimaryColor,
    unselectedItemColor: Color(0xFF848484),
  ),
  canvasColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: _lightPrimaryColor,
    secondaryContainer: const Color(0xFFF3F3F3),
    brightness: Brightness.light,
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  scaffoldBackgroundColor: const Color(0xFFF3F3F3),
  useMaterial3: true,
  textTheme: _textTheme,
);

final darkTheme = ThemeData(
  primaryColor: _darkPrimaryColor,
  dividerColor: Colors.grey.withOpacity(0.1),
  dividerTheme: DividerThemeData(
    color: Colors.grey.withOpacity(0.1),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: _darkPrimaryColor,
    unselectedItemColor: Color(0xFF848484),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: _darkPrimaryColor,
    secondaryContainer: const Color(0xFF41433E),
    brightness: Brightness.dark,
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  scaffoldBackgroundColor: const Color(0xFF202020),
  useMaterial3: true,
  textTheme: _textTheme,
);

const _textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
  headlineLarge: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
);

extension ThemePlatformExtension on ThemeData {
  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  Color get cupertionoActionColor => const Color(0xFF3478F7);
}
