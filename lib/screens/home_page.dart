import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/addUserPopUp.dart';
import 'package:flutter_application_1/components/function_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // final user = FirebaseAuth.instance.currentUser!;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  void _logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
              size: 30.0,
            )),
        title: StreamBuilder(
            stream:
                db.collection('users').doc(auth.currentUser?.uid).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading...');
              }
              return Text(
                  "${snapshot.data!['firstName']} ${snapshot.data!['lastName']}");
            }),
        // Text(
        //   user.email!,
        //   style: const TextStyle(),
        // ),
        actions: [
          IconButton(
              onPressed: _logOut,
              icon: const Icon(
                Icons.settings,
                size: 30.0,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 30.0,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              // height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  children: [
                    // Address Container
                    Container(
                      width: 360.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0x70A16B19),
                      ),
                      child: const Icon(
                        Icons.place,
                        size: 40.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // User Management Container
                    Container(
                      width: 360.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'USER MANAGEMENT',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FunctionButton(
                                  text: 'User List',
                                  icondata: Icons.list_alt,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                AddUserPopUp(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // Inventory Function Container
                    Container(
                      width: 360.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'INVENTORY FUNCTION',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  FunctionButton(
                                    text: 'Add Items',
                                    icondata: Icons.add_circle,
                                  ),
                                  SizedBox(width: 10.0),
                                  FunctionButton(
                                    text: 'Check-out Items',
                                    icondata: Icons.shopping_cart,
                                  ),
                                  SizedBox(width: 10.0),
                                  FunctionButton(
                                    text: 'View/Edit/Delete',
                                    icondata: Icons.edit_document,
                                  ),
                                  SizedBox(width: 10.0),
                                  FunctionButton(
                                    text: 'Daily Reports',
                                    icondata: Icons.note,
                                  ),
                                  SizedBox(width: 10.0),
                                  FunctionButton(
                                    text: 'Other Reports',
                                    icondata: Icons.book,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    // Invetory Container
                    Container(
                      width: 360.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xFF5E3A04),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.question_mark,
                            size: 40.0,
                          ),
                          Text(
                            'INVENTORY',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 4,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(4, 2),
                                    blurRadius: 3.0,
                                  )
                                ]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xFF9D7A46),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home,
              size: 40.0,
            ),
            Icon(
              Icons.qr_code,
              size: 40.0,
            ),
            Icon(
              Icons.search,
              size: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
