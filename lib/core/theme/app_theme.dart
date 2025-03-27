import 'package:flutter/material.dart';
import '../constants/color_manager.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Gidole',
      scaffoldBackgroundColor: ColorManager.white,
      primaryColor: ColorManager.primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.white,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(color: Colors.white, fontSize: 16),
        titleSmall: TextStyle(color: Colors.white, fontSize: 14),
        displayLarge: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white70),
        ),
      ),
    );
  }
}
