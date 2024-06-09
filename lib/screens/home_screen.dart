import 'package:flutter/material.dart';

import 'package:syncwellness/screens/workouts_screen.dart';

import '../widgets/activity_box.dart';
import 'calories_screen.dart';
import 'devices_screen.dart';
import 'health_screen.dart';
import 'me_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HealthScreen(),
    WorkoutsScreen(),
    DevicesScreen(),
    MeScreen(),
  ];

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SyncWellness'),
      ),
      body:_screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        backgroundColor:  Colors.green,

        onTap: _navigateTo,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
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

        selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        //backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      ),
    );
  }
}
