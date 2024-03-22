import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

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
        title: const Text(
          'Kim Julianne Sena',
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
                Icons.notifications,
                size: 30.0,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                          Container(
                            width: 130.0,
                            height: 130.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xFFE6CCA5),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.list_alt,
                                  size: 40.0,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'User List',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 130.0,
                            height: 130.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xFFE6CCA5),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_box,
                                  size: 40.0,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Add User',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
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
                            Container(
                              width: 130.0,
                              height: 130.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: const Color(0xFFE6CCA5),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    size: 40.0,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Add Items',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              width: 130.0,
                              height: 130.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: const Color(0xFFE6CCA5),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart,
                                    size: 40.0,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Check-out Items',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              width: 130.0,
                              height: 130.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: const Color(0xFFE6CCA5),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit_document,
                                    size: 40.0,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'View/Edit/Delete',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              width: 130.0,
                              height: 130.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: const Color(0xFFE6CCA5),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.note,
                                    size: 40.0,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Daily Reports',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              width: 130.0,
                              height: 130.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: const Color(0xFFE6CCA5),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.book,
                                    size: 40.0,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Other Reports',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
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
