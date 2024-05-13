import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firestore.dart';

class ProductWastagePage extends StatefulWidget {
  const ProductWastagePage({super.key});

  @override
  State<ProductWastagePage> createState() => _ProductWastagePageState();
}

class _ProductWastagePageState extends State<ProductWastagePage> {
  final CrudMethods crudMethods = CrudMethods();
  var searchProductName = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0x70A16B19),
          centerTitle: true,
          title: const Text('PRODUCT WASTAGE'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF7A5B2D),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchBar(
                  onChanged: (value) {
                    setState(() {
                      searchProductName = value;
                    });
                  },
                  backgroundColor:
                      const MaterialStatePropertyAll(Color(0xFFE6CCA5)),
                  side: const MaterialStatePropertyAll(
                      BorderSide(color: Color(0x9F7C5C2D))),
                  leading: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                  ),
                  hintText: "Search For Product Name",
                  hintStyle: const MaterialStatePropertyAll(TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  )),
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  // stream: crudMethods.getItems(),
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(user?.uid)
                      .collection("items")
                      .orderBy('productName')
                      .startAt([searchProductName]).endAt(
                          ["$searchProductName\uf8ff"]).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      List itemList = snapshot.data!.docs;

                      return ListView.builder(
                          itemCount: itemList.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot document = itemList[index];
                            String docID = document.id;

                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            String productName = data['productName'];
                            String quantity = data['sellingPrice'];

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: const Color(0x75A16B19),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 120.0,
                                        width: 120.0,
                                        child: Image.asset(
                                          'lib/assets/images/itrack_logo.png',
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                productName,
                                                style: const TextStyle(
                                                    fontSize: 22.0,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                "Quantity: $quantity",
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.black),
                                              ),
                                              const Text(
                                                "Wastage Reason: ",
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.black),
                                              ),
                                              const Text(
                                                "Date: ",
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Text("No data...");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
