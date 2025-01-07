import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appBarThemeDataLight = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.orange,
    ),
  );

  static ThemeData appBarThemeDataDark = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.orange,
    ),
  );
}
