import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      appBar: AppBar(
        title: const Text(
          'User List',
          style: TextStyle(),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                size: 30.0,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30.0,
              )),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(Icons.search),
                    // TextFormField(),
                  ],
                ),
                Table(
                  border: TableBorder.all(),
                  children: const [
                    TableRow(children: [
                      Text('Name'),
                      Text('Email'),
                      Text('Role'),
                      Text('Actions'),
                    ]),
                    TableRow(children: [
                      Text('User1'),
                      Text('Email1'),
                      Text('Role1'),
                      Text('Actions1'),
                    ]),
                    TableRow(children: [
                      Text('User2'),
                      Text('Email2'),
                      Text('Role2'),
                      Text('Actions2'),
                    ]),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
