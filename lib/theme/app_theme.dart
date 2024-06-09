import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.green,
      hintColor: Colors.orange,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
        displayLarge: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
      ),
    );
  }
}
