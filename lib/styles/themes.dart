import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultTheme = ThemeData(
    primarySwatch: _bluePaikeeMaterial,
    textTheme: TextTheme(
        bodyMedium: GoogleFonts.poppins(fontSize: 12),
        titleLarge:
            GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w700)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 90, vertical: 15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontWeight: FontWeight.bold)))));

Map<int, Color> _bluePaikee = {
  50: const Color.fromRGBO(57, 167, 252, .1),
  100: const Color.fromRGBO(57, 167, 252, .2),
  200: const Color.fromRGBO(57, 167, 252, .3),
  300: const Color.fromRGBO(57, 167, 252, .4),
  400: const Color.fromRGBO(57, 167, 252, .5),
  500: const Color.fromRGBO(57, 167, 252, .6),
  600: const Color.fromRGBO(57, 167, 252, .7),
  700: const Color.fromRGBO(57, 167, 252, .8),
  800: const Color.fromRGBO(57, 167, 252, .9),
  900: const Color.fromRGBO(57, 167, 252, 1),
};

MaterialColor _bluePaikeeMaterial = MaterialColor(0xFF39A7FC, _bluePaikee);
