import 'package:flutter/material.dart';

class AppTheme {
  //kleuren
  static const Color richBlack = Color(0xFF0D0D0F);
  static const Color charcoal = Color(0xFF1F1F2E);
  static const Color darkSlate = Color(0xFF2E2E3E);
  static const Color mutedPurple = Color.fromARGB(255, 143, 143, 186);
  static const Color stoneGray = Color(0xFF7A7A8C);
  static const Color boneWhite = Color.fromARGB(255, 206, 206, 208);

  //dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true, //modernere look v google design elementjes

    scaffoldBackgroundColor: richBlack,
    colorScheme: const ColorScheme.dark(
      primary: mutedPurple,
      secondary: stoneGray,
      surface: charcoal,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: charcoal,
      foregroundColor: boneWhite,
      centerTitle: true,
      elevation: 0,
    ),

    cardColor: darkSlate,

    //tekst
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: boneWhite),
      bodyMedium: TextStyle(color: boneWhite),
      titleLarge: TextStyle(color: boneWhite, fontWeight: FontWeight.bold),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: mutedPurple,
        foregroundColor: boneWhite,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
  );
}
