import 'package:flutter/material.dart';

class MeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Me'),
      ),
      body: Center(
        child: Text('Me Screen', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
