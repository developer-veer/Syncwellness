import 'dart:ui';

import 'package:flutter/material.dart';

class GlassicBackgroundWidget extends StatelessWidget {
  final String backgroundImage;
  final String text;

  const GlassicBackgroundWidget(
      {super.key, required this.backgroundImage, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 189,
      width: 390,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0), // Rounded corners
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover, // Cover the container
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0), // Apply blur effect
          child: Container(
            color: Colors.black
                .withOpacity(0.3), // Adjust opacity for glassic effect
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
