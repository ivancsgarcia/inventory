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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/show-bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text(
              'Notification Page',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
