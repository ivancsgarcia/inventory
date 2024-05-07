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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('PRODUCT WASTAGE'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  child: SearchBar(
                    leading: Icon(Icons.search),
                  ),
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: crudMethods.getItems(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
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
                                    color: const Color(0xF17C5C2D),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "Quantity: $quantity",
                                                  style: const TextStyle(
                                                      fontSize: 16.0,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.white),
                                                ),
                                                const Text(
                                                  "Wastage Reason: ",
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.white),
                                                ),
                                                const Text(
                                                  "Date: ",
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.white),
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
      ),
    );
  }
}
