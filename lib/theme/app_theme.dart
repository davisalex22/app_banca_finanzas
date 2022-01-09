import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0XffA73030);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color(0XffF6F6F6),
      primaryColor: primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        elevation: 0,
      ),
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: primary)));
}
