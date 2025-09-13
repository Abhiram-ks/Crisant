
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppPalette.blueColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppPalette.whiteColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
     backgroundColor: AppPalette.whiteColor,
      selectedItemColor: AppPalette.blackColor,
      unselectedItemColor: AppPalette.greyColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPalette.blueColor,
     iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppPalette.blackColor),
      bodyMedium: TextStyle(color: AppPalette.blackColor),
      bodySmall: TextStyle(color: AppPalette.blackColor),
    )
  );
}