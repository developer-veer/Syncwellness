import 'package:flutter/material.dart';

class StepsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Steps'),
      ),
      body: Center(
        child: Text('Steps Screen', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
