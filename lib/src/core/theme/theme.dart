import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_pallete.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) =>
      UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.0),
      );

  static final appTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    dialogBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: const AppBarTheme(color: AppPallete.backgroundColor),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        enabledBorder: _border(),
        focusedBorder: _border(AppPallete.whiteColor)),
    textTheme: GoogleFonts.urbanistTextTheme(
      ThemeData.dark().textTheme, // Apply to dark theme
    ),
  );
}
