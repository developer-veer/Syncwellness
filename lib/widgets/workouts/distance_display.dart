import 'package:flutter/material.dart';

class DistanceDisplay extends StatelessWidget {
  final double distance;

  DistanceDisplay({required this.distance});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$distance km',
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
