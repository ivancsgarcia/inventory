import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/function_button.dart';
import 'package:flutter_application_1/screens/add_item_page.dart';
import 'package:flutter_application_1/screens/checkoutitem_nonperishables_page.dart';
import 'package:flutter_application_1/screens/checkoutitem_perishables_page.dart';
import 'package:flutter_application_1/screens/inventory_report_page.dart';
import 'package:flutter_application_1/screens/notification_page.dart';
import 'package:flutter_application_1/screens/product_wastage_page.dart';
import 'package:flutter_application_1/screens/profile_page.dart';
import 'package:flutter_application_1/screens/settings_page.dart';
import 'package:flutter_application_1/screens/item_list_page.dart';
import 'package:flutter_application_1/screens/user_list_page.dart';
import 'package:flutter_application_1/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  late String businessName = '';

  void _updateBusinessName(String newName) {
    setState(() {
      businessName = newName;
    });
  }

  void _showNameDialog() {
    final _businessNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Enter Business Name"),
          content: TextField(
            controller: _businessNameController,
            decoration: const InputDecoration(hintText: "Business Name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                _updateBusinessName(_businessNameController.text);

                final nameOfBusiness = <String, dynamic>{
                  "businessName": _businessNameController.text,
                };

                FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .update(nameOfBusiness)
                    .then((documentSnapshot) {
                  print('Business Info added to the database.');
                });

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> getBusinessName() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot data = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (data.exists) {
        return data[
            'businessName']; // Assumes the document has a field named 'business_name'
      } else {
        throw Exception("Document does not exist!");
      }
    } else {
      throw Exception("User is not logged in!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            icon: const Icon(
              Icons.account_circle,
              size: 30.0,
            )),
        title: Text(user.email!),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.settings,
                size: 30.0,
              )),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.notifications,
                size: 30.0,
              )),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/show-bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    children: [
                      // Business Name Container
                      GestureDetector(
                        onTap: () {
                          _showNameDialog();
                        },
                        child: Container(
                          width: 360.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: const Color(0x70A16B19),
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.place,
                                size: 40.0,
                              ),
                              FutureBuilder(
                                future: getBusinessName(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else if (snapshot.hasData) {
                                    return Text('${snapshot.data}');
                                  } else {
                                    return const Text(
                                        'Enter Your Business Name');
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),

                      // User Management Container
                      Container(
                        width: 360.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
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
                            color: Colors.white.withOpacity(0.8),
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
                                                const AddItemPage(),
                                          ),
                                        );
                                      },
                                      text: 'Add Item',
                                      icondata: Icons.edit_document,
                                    ),
                                    const SizedBox(width: 10.0),
                                    FunctionButton(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CheckOutItemPerishablesPage(),
                                          ),
                                        );
                                      },
                                      text: 'Check-out Items',
                                      icondata: Icons.shopping_cart,
                                    ),
                                    const SizedBox(width: 10.0),
                                    FunctionButton(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const InventoryReportPage(),
                                          ),
                                        );
                                      },
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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ShowItemsPage(),
                            ),
                          );
                        },
                        child: Container(
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
                                Icons.list_alt,
                                size: 40.0,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(4, 2),
                                    blurRadius: 3.0,
                                  )
                                ],
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF9D7A46),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.home,
              size: 40.0,
              color: Colors.white,
            ),
            const Icon(
              Icons.qr_code,
              size: 40.0,
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProductWastagePage(),
                  ),
                );
              },
              icon: const Icon(Icons.delete),
              iconSize: 40.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
