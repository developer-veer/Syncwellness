import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.green,
      primaryColor: Colors.green,
      hintColor: Colors.orange,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        color: Colors.green,
        titleTextStyle: TextStyle(color: Colors.white , fontSize: 23,fontWeight: FontWeight.bold)
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(

        backgroundColor: Colors.green,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white70,

      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(color: Colors.green),
        bodyLarge: TextStyle(color: Colors.white),
      ),
    );
  }
}
