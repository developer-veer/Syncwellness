import 'package:flutter/material.dart';
import 'package:syncwellness/screens/workouts/walking_activity_screen.dart';
import '../../widgets/workouts/distance_display.dart';
import '../../widgets/workouts/walking_avatar.dart';

class WalkingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Assets/images/running_pic.jpg'),
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
                    MaterialPageRoute(
                        builder: (context) => WalkingActivityScreen()),
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
