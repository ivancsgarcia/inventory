import 'package:flutter/material.dart';

class MySplash extends StatelessWidget {
  const MySplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/itrack_logo.png')),
    );
  }
}
