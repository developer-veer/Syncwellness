import 'package:flutter/material.dart';

class CaloriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calories'),
      ),
      body: Center(
        child: Text('Calories Screen', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
