import 'package:flutter/material.dart';
import '../../widgets/workouts/cycling_avatar.dart';
import '../../widgets/workouts/distance_display.dart';

class CyclingScreen extends StatelessWidget {
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
            DistanceDisplay(distance: 15.67),
            Text('Total Cycling Distance'),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CyclingActivityScreen()),
                  );
                },
                child: CyclingAvatar(),
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

class CyclingActivityScreen extends StatefulWidget {
  @override
  _CyclingActivityScreenState createState() => _CyclingActivityScreenState();
}

class _CyclingActivityScreenState extends State<CyclingActivityScreen> {
  double distance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cycling Activity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Real-time Cycling Distance:',
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
