import 'package:flutter/material.dart';
import 'package:syncwellness/screens/workouts/walking_screen.dart';
import '../../widgets/workouts/activity_selector.dart';
import 'running_screen.dart';
import 'cycling_screen.dart';
import 'rope_skipping_screen.dart';

class WorkoutScreenAll extends StatefulWidget {
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreenAll> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  List<Widget> _screens = [
    RunningActivityScreen(),
    CyclingScreen(),
    WalkingScreen(),
    RopeSkippingScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onActivitySelected(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
      ),
      body: Column(
        children: [
          ActivitySelector(
            activities: const ['Running', 'Cycling', 'Walking', 'Rope Skipping'],
            selectedIndex: _selectedIndex,
            onSelected: _onActivitySelected,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _screens,
            ),
          ),
        ],
      ),
    );
  }
}
