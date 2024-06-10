import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import '../../widgets/workouts/distance_display.dart';
import '../../widgets/workouts/running_avatar.dart';
import 'running_screen.dart';

class WorkoutScreenAll extends StatelessWidget {
  const WorkoutScreenAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return RunningPage();
                } else {
                  return Placeholder(); // Placeholder for other activities
                }
              },
              itemCount: 4, // Running, Cycling, Walking, Rope Skipping
              pagination: SwiperPagination(),
              control: SwiperControl(),
            ),
          ),
        ],
      ),
    );
  }
}

class RunningPage extends StatelessWidget {
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
          children: <Widget>[
            DistanceDisplay(distance: 10.43),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RunningScreen()),
                );
              },
              child: RunningAvatar(),
            ),
          ],
        ),
      ],
    );
  }
}
