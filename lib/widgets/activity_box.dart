import 'package:flutter/material.dart';

class ActivityBox extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const ActivityBox({
    Key? key,
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color),
          SizedBox(height: 10),
          Text(title, style: TextStyle(color: Colors.white)),
          SizedBox(height: 5),
          Text(value, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
