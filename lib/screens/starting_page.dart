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
        appBar: AppBar(),
        body: Column(
          children: [
            // Image.asset(''),
            Container(
              color: Colors.green,
              child: const Column(),
            )
          ],
        ));
  }
}
