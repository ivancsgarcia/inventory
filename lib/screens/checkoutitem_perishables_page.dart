import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/services/firestore.dart";

class CheckOutItemPerishablesPage extends StatefulWidget {
  const CheckOutItemPerishablesPage({super.key});

  @override
  State<CheckOutItemPerishablesPage> createState() =>
      _CheckOutItemPerishablesPageState();
}

class _CheckOutItemPerishablesPageState
    extends State<CheckOutItemPerishablesPage> {
  DateTime now = DateTime.now();
  late DateTime date = DateTime(now.year, now.month, now.day);
  final CrudMethods crudMethods = CrudMethods();
  Map<String, Map<String, int>> productCounters = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xF17C5C2D),
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

                          if (!productCounters.containsKey(docID)) {
                            productCounters[docID] = {
                              'itemDamage': 0,
                              'itemSold': 0,
                              'itemExpired': 0,
                            };
                          }

                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          String productName = data['productName'];
                          String sku = data['sellingPrice'];
                          int quantityCounter = data['quantity']!;
                          String imageURL = data['imageURL'];
                          int itemDamage = 0;
                          int itemSold = 0;
                          int itemExpired = 0;

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
                                            const SizedBox(height: 5.0),

                                            // SKU
                                            Text(
                                              "SKU: $sku",
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(height: 5.0),
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
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (productCounters[
                                                                  docID]![
                                                              'itemSold']! >
                                                          0) {
                                                        productCounters[docID]![
                                                                'itemSold'] =
                                                            productCounters[
                                                                        docID]![
                                                                    'itemSold']! -
                                                                1;
                                                      }
                                                    });

                                                    print(productCounters[
                                                        docID]!['itemSold']);
                                                  },
                                                  icon:
                                                      const Icon(Icons.remove),
                                                ),
                                                const SizedBox(width: 5.0),
                                                Text(productCounters[docID]![
                                                        'itemSold']
                                                    .toString()),
                                                const SizedBox(width: 5.0),
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      productCounters[docID]![
                                                              'itemSold'] =
                                                          productCounters[
                                                                      docID]![
                                                                  'itemSold']! +
                                                              1;
                                                    });

                                                    print(productCounters[
                                                        docID]!['itemSold']);
                                                  },
                                                  icon: const Icon(Icons.add),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5.0),

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
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (productCounters[
                                                                  docID]![
                                                              'itemDamage']! >
                                                          0) {
                                                        productCounters[docID]![
                                                                'itemDamage'] =
                                                            productCounters[
                                                                        docID]![
                                                                    'itemDamage']! -
                                                                1;
                                                      }
                                                    });

                                                    print(productCounters[
                                                        docID]!['itemDamage']);
                                                  },
                                                  icon:
                                                      const Icon(Icons.remove),
                                                ),
                                                const SizedBox(width: 5.0),
                                                Text(productCounters[docID]![
                                                        'itemDamage']
                                                    .toString()),
                                                const SizedBox(width: 5.0),
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      productCounters[docID]![
                                                              'itemDamage'] =
                                                          productCounters[
                                                                      docID]![
                                                                  'itemDamage']! +
                                                              1;
                                                    });

                                                    print(productCounters[
                                                        docID]!['itemDamage']);
                                                  },
                                                  icon: const Icon(Icons.add),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5.0),

                                            // Expired
                                            Row(
                                              children: [
                                                const Text(
                                                  "Expired:",
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(width: 5.0),
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (productCounters[
                                                                  docID]![
                                                              'itemExpired']! >
                                                          0) {
                                                        productCounters[docID]![
                                                                'itemExpired'] =
                                                            productCounters[
                                                                        docID]![
                                                                    'itemExpired']! -
                                                                1;
                                                      }
                                                    });

                                                    print(productCounters[
                                                        docID]!['itemExpired']);
                                                  },
                                                  icon:
                                                      const Icon(Icons.remove),
                                                ),
                                                const SizedBox(width: 5.0),
                                                Text(productCounters[docID]![
                                                        'itemExpired']
                                                    .toString()),
                                                const SizedBox(width: 5.0),
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      productCounters[docID]![
                                                              'itemExpired'] =
                                                          productCounters[
                                                                      docID]![
                                                                  'itemExpired']! +
                                                              1;
                                                    });

                                                    print(productCounters[
                                                        docID]!['itemExpired']);
                                                  },
                                                  icon: const Icon(Icons.add),
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
                onPressed: () {
                  productCounters.forEach((docID, counters) async {
                    DocumentSnapshot document =
                        await crudMethods.getDocument(docID).get();
                    int currentQuantity = document['quantity'];

                    int newQuantity = currentQuantity -
                        (counters['itemSold']! +
                            counters['itemDamage']! +
                            counters['itemExpired']!);

                    await crudMethods.updateDocument(docID, {
                      'quantity': newQuantity,
                    });

                    setState(() {
                      productCounters.clear();
                    });
                  });
                },
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
