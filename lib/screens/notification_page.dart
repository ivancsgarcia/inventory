import "package:flutter/material.dart";

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x70A16B19),
        centerTitle: true,
        title: const Text('NOTIFICATION'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
            'Notification Page',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}