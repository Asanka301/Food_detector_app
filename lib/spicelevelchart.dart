import 'package:flutter/material.dart';

class SpiceLevelChart extends StatelessWidget {
  final String spiceLevel;
  final Map<String, Color> spiceLevelColors;

  SpiceLevelChart({
    required this.spiceLevel,
    required this.spiceLevelColors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: spiceLevelColors[spiceLevel] ?? Colors.grey,
          ),
        ),
        SizedBox(height: 8),
        Text(
          spiceLevel,
          style: TextStyle(
            fontSize: 16,
            color: spiceLevelColors[spiceLevel] ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
