import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define your primary, secondary, and text colors
  static const Color primaryColor = Color(0XFF181A20);
  static const Color secondaryColor = Color(0xff17CE92);
  static const Color tertiaryColor = Color(0xff35383F);
  static const Color textColor = Colors.white; // Example text color

  static ThemeData get theme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: const ColorScheme(
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: tertiaryColor,
        surface: primaryColor,
        onPrimary: Colors.white, // Color for text/icons on primary color
        onSecondary: Colors.white, // Color for text/icons on secondary color
        onTertiary: Colors.white,
        onSurface: textColor, // Text color on background
        brightness: Brightness
            .light, // Keep brightness to 'light' to maintain a consistent look
        error: Colors.red,
        onError: Colors.white,
      ),
      // Set the global font using Urbanist
      // Apply the Urbanist font globally to all text types
      textTheme: GoogleFonts.urbanistTextTheme(
        ThemeData.light().textTheme,
      ).apply(
        bodyColor: textColor, // Apply the same text color to all text types
        displayColor: textColor,
      ),
    );
  }
}
