import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/function_button.dart';
import 'package:flutter_application_1/screens/checkoutitem_nonperishables_page.dart';
import 'package:flutter_application_1/screens/checkoutitem_perishables_page.dart';
import 'package:flutter_application_1/screens/product_wastage_page.dart';
import 'package:flutter_application_1/screens/showItems.dart';
import 'package:flutter_application_1/screens/userList_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

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
        title: Text(
          user.email!,
          style: const TextStyle(),
        ),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
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
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FunctionButton(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const UserListPage(),
                                      ),
                                    );
                                  },
                                  text: 'User List',
                                  icondata: Icons.list_alt,
                                ),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
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
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  FunctionButton(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ShowItems(),
                                        ),
                                      );
                                    },
                                    text: 'Item List',
                                    icondata: Icons.edit_document,
                                  ),
                                  const SizedBox(width: 10.0),
                                  FunctionButton(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ProductWastagePage(),
                                        ),
                                      );
                                    },
                                    text: 'Check-out Items',
                                    icondata: Icons.shopping_cart,
                                  ),
                                  const SizedBox(width: 10.0),
                                  const FunctionButton(
                                    text: 'Inventory Report',
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
              // Icons.delete_outline,
              Icons.search_rounded,
              size: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
