import 'package:flutter/material.dart';

class DistanceDisplay extends StatelessWidget {
  final double distance;

  DistanceDisplay({required this.distance});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$distance km',
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
