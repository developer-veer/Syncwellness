import 'package:flutter/material.dart';

class DevicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Devices'),
      ),
      body: Center(
        child: Text('Devices Screen', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
