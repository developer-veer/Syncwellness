import 'package:flutter/material.dart';
import 'package:syncwellness/screens/home_screen.dart';
import 'package:syncwellness/theme/app_theme.dart';

void main() {
  runApp(SyncWellnessApp());
}

class SyncWellnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SyncWellness',
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}
