import 'package:flutter/material.dart';
import '../../widgets/workouts/distance_display.dart';
import '../../widgets/workouts/walking_avatar.dart';


class WalkingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/workouts.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DistanceDisplay(distance: 5.32),
            Text('Total Walking Distance'),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WalkingActivityScreen()),
                  );
                },
                child: WalkingAvatar(),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), backgroundColor: Colors.orange,
                  padding: EdgeInsets.all(20), // Button color
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

class WalkingActivityScreen extends StatefulWidget {
  @override
  _WalkingActivityScreenState createState() => _WalkingActivityScreenState();
}

class _WalkingActivityScreenState extends State<WalkingActivityScreen> {
  double distance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Walking Activity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Real-time Walking Distance:',
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
