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
  late DateTime datel;
  final CrudMethods crudMethods = CrudMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CHECK OUT ITEM'),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              DropdownButton<DateTime>(
                  hint: const Text('Choose A Date'),
                  items: ['Choose A Date']
                      .map((e) => DropdownMenuItem<DateTime>(child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2026))
                        .then((date) => setState(() {
                              datel = date!;
                            }));
                  }),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        height: 120.0,
                                        width: 140.0,
                                        child: Image.asset(
                                          'lib/assets/images/itrack_logo.png',
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
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "SKU: $sku",
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.white),
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Sold:",
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.white),
                                                ),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  child: Text(
                                                    '-',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Container(
                                                  child: TextField(),
                                                ),
                                                Container(
                                                  child: Text('+'),
                                                ),
                                              ],
                                            ),
                                            const Text(
                                              "Damage:",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontStyle: FontStyle.italic,
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
                        },
                      );
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
