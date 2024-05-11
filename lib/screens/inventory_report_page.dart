import "package:flutter/material.dart";

class InventoryReportPage extends StatelessWidget {
  const InventoryReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x70A16B19),
        centerTitle: true,
        title: const Text('INVENTORY REPORT'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
            'Inventory Report Page',
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
