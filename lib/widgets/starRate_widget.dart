import 'package:flutter/material.dart';

class starRate extends StatelessWidget {
  final double vote_average;
  const starRate({super.key, required this.vote_average});

  @override
  Widget build(BuildContext context) {
    int stars = vote_average ~/ 2;
    return Row(
      children: [
        for (int i = 0; i < stars; i++)
          const Icon(
            Icons.star_rate_rounded,
            size: 30,
            color: Colors.yellow,
          ),
        for (int i = 0; i < 5 - stars; i++)
          const Icon(
            Icons.star_rate_rounded,
            size: 30,
            color: Colors.grey,
          ),
      ],
    );
  }
}
