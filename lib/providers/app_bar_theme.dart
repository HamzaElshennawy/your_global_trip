import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appBarThemeDataLight = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.orange,
    ),
  );

  static ThemeData appBarThemeDataDark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.orange,
    ),
  );
}
