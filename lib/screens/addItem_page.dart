import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Items',
          style: TextStyle(),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.settings,
        //         size: 30.0,
        //       )),
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.search,
        //         size: 30.0,
        //       )),
        // ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: const Column(
              children: [
                Text('Add Items'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
