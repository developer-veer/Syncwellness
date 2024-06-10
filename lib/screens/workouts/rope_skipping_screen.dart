import 'package:flutter/material.dart';
import '../../widgets/workouts/distance_display.dart';
import '../../widgets/workouts/rope_skipping_avatar.dart';


class RopeSkippingScreen extends StatelessWidget {
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
            DistanceDisplay(distance: 3.21),
            Text('Total Rope Skipping Distance'),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RopeSkippingActivityScreen()),
                  );
                },
                child: RopeSkippingAvatar(),
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

class RopeSkippingActivityScreen extends StatefulWidget {
  @override
  _RopeSkippingActivityScreenState createState() =>
      _RopeSkippingActivityScreenState();
}

class _RopeSkippingActivityScreenState
    extends State<RopeSkippingActivityScreen> {
  double distance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rope Skipping Activity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Real-time Rope Skipping Distance:',
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
