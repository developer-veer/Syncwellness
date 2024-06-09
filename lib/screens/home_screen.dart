import 'package:flutter/material.dart';

import '../widgets/activity_box.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ActivityBox(
                    title: 'Steps',
                    value: '299/4000 steps',
                    color: Colors.orange,
                    icon: Icons.directions_walk,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ActivityBox(
                    title: 'Calories',
                    value: '13/300 kcal',
                    color: Colors.green,
                    icon: Icons.local_fire_department,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ActivityBox(
                    title: 'Workout Duration',
                    value: '0/30 min',
                    color: Colors.blue,
                    icon: Icons.timer,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Navigate to detailed workout plan
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Health',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
      ),
    );
  }
}
