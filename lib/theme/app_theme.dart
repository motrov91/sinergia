import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff8130EA);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,

      //Inputs
      inputDecorationTheme: InputDecorationTheme());
}
