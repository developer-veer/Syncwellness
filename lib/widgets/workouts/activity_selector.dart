import 'package:flutter/material.dart';

class ActivitySelector extends StatelessWidget {
  final List<String> activities;
  final int selectedIndex;
  final Function(int) onSelected;

  ActivitySelector({
    required this.activities,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: activities.map((activity) {
        final index = activities.indexOf(activity);
        return GestureDetector(
          onTap: () => onSelected(index),
          child: Text(
            activity,
            style: TextStyle(
              color: selectedIndex == index ? Colors.orange : Colors.grey,
              fontSize: 18,
            ),
          ),
        );
      }).toList(),
    );
  }
}
