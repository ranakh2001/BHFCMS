import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTypography {
  static TextTheme getTextTheme(Color primaryTextColor, Color secondaryTextColor) {
    return GoogleFonts.almaraiTextTheme(
      TextTheme(
        displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold, color: primaryTextColor),
        displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: primaryTextColor),
        displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: primaryTextColor),
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: primaryTextColor),
        headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: primaryTextColor),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: primaryTextColor),
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: primaryTextColor),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryTextColor),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: primaryTextColor),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: primaryTextColor),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: secondaryTextColor),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: secondaryTextColor),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: primaryTextColor),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: primaryTextColor),
        labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: secondaryTextColor),
      ),
    );
  }
}
