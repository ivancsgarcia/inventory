import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  final String text;
  final String text2;
  const Intro({super.key, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text2,
            style: const TextStyle(
              fontSize: 16.0,
            )),
      ],
    );
  }
}
