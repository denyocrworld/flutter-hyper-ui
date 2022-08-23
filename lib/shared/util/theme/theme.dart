import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/shared/util/theme/theme_constants.dart';
import 'package:google_fonts/google_fonts.dart';

var defaultTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  cardTheme: CardTheme(
    elevation: 0.6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.grey[800],
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: primaryColor,
    titleTextStyle: const TextStyle(
      color: Colors.white,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: GoogleFonts.robotoMonoTextTheme().copyWith(
    headline1: TextStyle(
      color: Colors.grey[800],
    ),
    headline2: TextStyle(
      color: Colors.grey[800],
    ),
    bodyText1: TextStyle(
      color: Colors.grey[800],
    ),
    bodyText2: TextStyle(
      color: Colors.grey[800],
    ),
  ),
);
