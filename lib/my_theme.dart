import 'package:flutter/material.dart';

class MyTheme {
  static const Color primary = Colors.green;

  static ThemeData lightTheme = ThemeData(
      primaryColor: primary,
      textTheme:
          TextTheme(titleSmall: TextStyle(color: primary, fontSize: 18)));
}
