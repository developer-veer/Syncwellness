import 'package:flutter/material.dart';
import 'package:syncwellness/screens/steps_screen.dart';

import 'package:syncwellness/widgets/glassicBackgroundWidget.dart';

import '../widgets/activity_box.dart';
import 'calories_screen.dart';

class HealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: GlassicBackgroundWidget(
                backgroundImage: 'Assets/images/wellness.jpg',
                text: '',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StepsScreen()),
                      );
                    },
                    child: const ActivityBox(
                      title: 'Steps',
                      value: '299/4000 steps',
                      color: Colors.orange,
                      icon: Icons.directions_walk,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CaloriesScreen()),
                      );
                    },
                    child: const ActivityBox(
                      title: 'Calories',
                      value: '13/300 kcal',
                      color: Colors.green,
                      icon: Icons.local_fire_department,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: const ActivityBox(
                      title: 'Workout Duration',
                      value: '0/30 min',
                      color: Colors.blue,
                      icon: Icons.timer,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Navigate to detailed workout plan
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.fitness_center, color: Colors.white),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Your exclusive plan report has been generated.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.orange),
                  ],
                ),
              ),
            ),
            // Add other widgets like Workout List, Weight, etc. here similarly
          ],
        ),
      ),
    );
  }
}
