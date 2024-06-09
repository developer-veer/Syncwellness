import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Duration'),
      ),
      body: Center(
        child: Text('Workout Duration Screen', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
