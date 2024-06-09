import 'package:flutter/material.dart';

class WorkoutsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts'),
      ),
      body: Center(
        child: Text('Workouts Screen', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
