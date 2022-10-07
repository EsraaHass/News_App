import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightprimary = Colors.green;
  static const Color darkprimary = Color(0xFF060E1E);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightprimary,
    appBarTheme: AppBarTheme(
      backgroundColor: lightprimary,
    ),
    textTheme: const TextTheme(
        titleSmall: TextStyle(color: lightprimary, fontSize: 18),
        titleMedium: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 22,
        )),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: darkprimary,
    appBarTheme: AppBarTheme(
      backgroundColor: darkprimary,
    ),
    textTheme: const TextTheme(
        titleSmall: TextStyle(color: darkprimary, fontSize: 18),
        titleMedium: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 22,
        )),
  );
}
