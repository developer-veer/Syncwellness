import 'package:flutter/material.dart';
import '../../widgets/workouts/distance_display.dart';
import '../../widgets/workouts/running_avatar.dart';

class RunningScreen extends StatelessWidget {
  const RunningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('Assets/images/run.jpg'),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 420.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RunningActivityScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: Colors.orange,
                    padding: const EdgeInsets.all(20), // Button color
                  ),
                  child: RunningAvatar(),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class RunningActivityScreen extends StatefulWidget {
  const RunningActivityScreen({super.key});

  @override
  _RunningActivityScreenState createState() => _RunningActivityScreenState();
}

class _RunningActivityScreenState extends State<RunningActivityScreen> {
  double distance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Running Activity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Real-time Running Distance:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              '$distance km',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  distance += 1.0; // Simulating distance change
                });
              },
              child: const Text('Increase Distance'),
            ),
          ],
        ),
      ),
    );
  }
}
