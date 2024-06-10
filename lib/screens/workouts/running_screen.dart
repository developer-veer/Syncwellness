import 'package:flutter/material.dart';

class RunningScreen extends StatefulWidget {
  @override
  _RunningScreenState createState() => _RunningScreenState();
}

class _RunningScreenState extends State<RunningScreen> {
  double distance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Running Activity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Real-time Running Distance:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              '$distance km',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  distance += 1.0; // Simulating distance change
                });
              },
              child: Text('Increase Distance'),
            ),
          ],
        ),
      ),
    );
  }
}
