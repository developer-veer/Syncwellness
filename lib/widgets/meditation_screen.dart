import 'package:flutter/material.dart';

void main() {
  runApp(MeditationApp());
}

class MeditationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MeditationScreen(),
    );
  }
}

class MeditationScreen extends StatelessWidget {
  final List<MeditationActivity> activities = [
    MeditationActivity('Breathing Exercise', Icons.air, Colors.blue),
    MeditationActivity('Body Scan', Icons.self_improvement, Colors.green),
    MeditationActivity('Guided Meditation', Icons.record_voice_over, Colors.purple),
    MeditationActivity('Yoga', Icons.fitness_center, Colors.orange),
    MeditationActivity('Mindfulness', Icons.nature_people, Colors.teal),
    // Add more activities as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation Activities'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return ActivityCard(activity: activities[index]);
        },
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final MeditationActivity activity;

  ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Icon(activity.icon, color: activity.color, size: 40),
        title: Text(activity.title, style: TextStyle(fontSize: 20)),
        trailing: IconButton(
          icon: Icon(Icons.play_arrow, color: activity.color),
          onPressed: () {
            // Navigate to the activity screen or perform the activity action
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActivityDetailScreen(activity: activity),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ActivityDetailScreen extends StatelessWidget {
  final MeditationActivity activity;

  ActivityDetailScreen({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.title),
        backgroundColor: activity.color,
      ),
      body: Center(
        child: Text(
          'Details for ${activity.title}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class MeditationActivity {
  final String title;
  final IconData icon;
  final Color color;

  MeditationActivity(this.title, this.icon, this.color);
}
