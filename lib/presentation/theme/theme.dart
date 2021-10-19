import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Color(0xff084348)),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff084348)),
    ),
    focusedBorder: OutlineInputBorder(
      // borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Color(0xff084348), width: 2),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff084348), width: 2),
    ),
  ),
);
