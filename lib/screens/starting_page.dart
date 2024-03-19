import 'package:flutter/material.dart';

class MyStarting extends StatefulWidget {
  const MyStarting({super.key});

  @override
  State<MyStarting> createState() => _MyStartingState();
}

class _MyStartingState extends State<MyStarting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // Image.asset(''),
        Container(
          child: const Column(),
        )
      ],
    ));
  }
}
