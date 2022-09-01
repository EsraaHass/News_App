import 'package:flutter/material.dart';

class MyTheme {
  static const Color primary = Colors.green;

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: primary, fontSize: 18),
      titleMedium: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}
