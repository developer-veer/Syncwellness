import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(HeartRateApp());
}

class HeartRateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HeartRateScreen(),
    );
  }
}

class HeartRateScreen extends StatefulWidget {
  @override
  _HeartRateScreenState createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends State<HeartRateScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Timer _timer;
  int _heartRate = 0;
  bool _measuring = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween(begin: 1.0, end: 1.5).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  void _startMeasuring() {
    setState(() {
      _measuring = true;
      _heartRate = 0;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _heartRate = 60 + Random().nextInt(40); // Simulate heart rate between 60-100 BPM
      });
    });

    Future.delayed(Duration(seconds: 10), () {
      _timer.cancel();
      setState(() {
        _measuring = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heart Rate Monitor'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 100,
              ),
            ),
            SizedBox(height: 50),
            Text(
              _measuring ? 'Measuring...' : 'Heart Rate',
              style: TextStyle(fontSize: 24, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Text(
              _measuring ? '$_heartRate BPM' : '-- BPM',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: _measuring ? null : _startMeasuring,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20), backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                _measuring ? 'Measuring' : 'Start',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
