// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppThemes { darkTheme, lightTheme }

final Map<AppThemes, ThemeData> appThemeData = {
  AppThemes.darkTheme: ThemeData(
      brightness: Brightness.dark,
      cardColor: Color.fromARGB(255, 52, 58, 74),
      primaryColor: const Color(0xFF242934),
      backgroundColor: const Color(0xFF242934).withOpacity(.7),
      indicatorColor: const Color(0xFF242934).withOpacity(.8),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.openSans(
                          color: Color(0xFFFFFFFF), fontSize: 24),
            
          headline1: GoogleFonts.openSans(
                          color: Color(0xFFFFFFFF), fontSize: 20),
          headline2:GoogleFonts.openSans(
                          color: Color(0xFFFFFFFF), fontSize: 18),
          headline3: GoogleFonts.openSans(
                          color: Color(0xFFFFFFFF), fontSize: 16),
          headline4: GoogleFonts.openSans(
                          color: Color(0xFFFFFFFF), fontSize: 14),
          bodyText1: GoogleFonts.openSans(
                          color: Color(0xFFFFFFFF), fontSize: 12))),
  AppThemes.lightTheme: ThemeData(
    brightness: Brightness.light
  )
};
