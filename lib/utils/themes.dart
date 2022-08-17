import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColorDark = const Color(0xFF2D3548);

ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xFF39A7FC),
  primaryColorDark: primaryColorDark,
  scaffoldBackgroundColor: const Color(0xFFEDF3FB),
  cardColor: const Color(0xFFF4F7FC),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.poppins(
        fontSize: 12, fontWeight: FontWeight.w400, color: primaryColorDark),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w400, color: primaryColorDark),
    bodyLarge: GoogleFonts.poppins(color: primaryColorDark),
    titleSmall: GoogleFonts.poppins(
        fontSize: 15, fontWeight: FontWeight.w600, color: primaryColorDark),
    titleMedium: GoogleFonts.poppins(
        fontSize: 18, fontWeight: FontWeight.w700, color: primaryColorDark),
    titleLarge: GoogleFonts.poppins(
        fontSize: 25, fontWeight: FontWeight.w700, color: primaryColorDark),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(40)),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
            fontWeight: FontWeight.w900, decoration: TextDecoration.underline),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(style: BorderStyle.solid, color: primaryColorDark),
    ),
  ),
);

InputBorder? inputBorder({bool dark = false}) =>
    lightTheme.inputDecorationTheme.border?.copyWith(
      borderSide: BorderSide(
          style: BorderStyle.solid,
          color: dark
              ? lightTheme.primaryColorDark
              : lightTheme.scaffoldBackgroundColor),
    );
