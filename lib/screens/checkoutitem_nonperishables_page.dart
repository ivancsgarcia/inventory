import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/services/firestore.dart";

class CheckOutItemNonPerishablesPage extends StatefulWidget {
  const CheckOutItemNonPerishablesPage({super.key});

  @override
  State<CheckOutItemNonPerishablesPage> createState() =>
      _CheckOutItemNonPerishablesPageState();
}

class _CheckOutItemNonPerishablesPageState
    extends State<CheckOutItemNonPerishablesPage> {
  DateTime now = DateTime.now();
  late DateTime date = DateTime(now.year, now.month, now.day);
  final CrudMethods crudMethods = CrudMethods();
  int itemSold = 0;
  int itemDamage = 0;

  void _incrementCounter(
    String docID,
    int currentCount,
  ) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('items')
        .doc(docID);

    // Update the document with the incremented count
    await docRef.update({'quantity': currentCount + 1});
  }

  void _decrementCounter(
    String docID,
    int currentCount,
  ) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('items')
        .doc(docID);

    // Update the document with the incremented count
    await docRef.update({'quantity': currentCount - 1});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x70A16B19),
        centerTitle: true,
        title: const Text('CHECK OUT ITEM'),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/show-bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Container(
                child: Text(
                  '$date',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Flexible(
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
                          String sku = data['sellingPrice'];
                          int quantityCounter = data['quantity']!;
                          String imageURL = data['imageURL'];

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                // color: const Color(0xF17C5C2D),
                                color: const Color(0x75A16B19),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Image.network(
                                          imageURL,
                                        ),
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

                                            // SKU
                                            Text(
                                              "SKU: $sku",
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black),
                                            ),

                                            // Sold
                                            Row(
                                              children: [
                                                const Text(
                                                  "Sold:",
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(width: 5.0),
                                                GestureDetector(
                                                  onTap: () =>
                                                      _decrementCounter(
                                                    document.id,
                                                    quantityCounter,
                                                  ),
                                                  child: Container(
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(180)),
                                                    child: const Text(
                                                      "-",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        // fontStyle:
                                                        //     FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 5.0),
                                                Container(
                                                    height: 30,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            width: 1.0)),
                                                    child: Text(
                                                        itemSold.toString())),
                                                const SizedBox(width: 5.0),
                                                GestureDetector(
                                                  onTap: () =>
                                                      _incrementCounter(
                                                    document.id,
                                                    quantityCounter,
                                                  ),
                                                  child: Container(
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(180)),
                                                    child: const Text(
                                                      "+",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        // fontStyle:
                                                        //     FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            // Damage
                                            Row(
                                              children: [
                                                const Text(
                                                  "Damage:",
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(width: 5.0),
                                                GestureDetector(
                                                  onTap: () =>
                                                      _decrementCounter(
                                                    document.id,
                                                    quantityCounter,
                                                  ),
                                                  child: Container(
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(180)),
                                                    child: const Text(
                                                      "-",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        // fontStyle:
                                                        //     FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 5.0),
                                                Container(
                                                    height: 30,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            width: 1.0)),
                                                    child: Text(
                                                        itemDamage.toString())),
                                                const SizedBox(width: 5.0),
                                                GestureDetector(
                                                  onTap: () =>
                                                      _incrementCounter(
                                                    document.id,
                                                    quantityCounter,
                                                  ),
                                                  child: Container(
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(180)),
                                                    child: const Text(
                                                      "+",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        // fontStyle:
                                                        //     FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                        },
                      );
                    } else {
                      return const Text("No data...");
                    }
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                  minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                ),
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
