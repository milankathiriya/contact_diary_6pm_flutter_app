import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      displayMedium: TextStyle(fontSize: 20, color: Colors.blue),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: Colors.white,
      secondary: Colors.lightBlueAccent,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.orange,
      foregroundColor: Colors.black,
    ),
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Colors.orange,
      secondary: Colors.amber,
    ),
  );
}
