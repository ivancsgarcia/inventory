import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firestore.dart';
import '../components/button.dart';
import '../components/textformfield.dart';

class ShowItems extends StatefulWidget {
  const ShowItems({super.key});

  @override
  State<ShowItems> createState() => _ShowItemsState();
}

class _ShowItemsState extends State<ShowItems> {
  final _categoryController = TextEditingController();
  final _productNameController = TextEditingController();
  final _costController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _skuController = TextEditingController();

  final CrudMethods crudMethods = CrudMethods();

  @override
  void dispose() {
    _categoryController.dispose();
    _productNameController.dispose();
    _costController.dispose();
    _sellingPriceController.dispose();
    _quantityController.dispose();
    _skuController.dispose();
    super.dispose();
  }

  void addItemPopUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Add Item",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  Form(
                      child: Column(
                    children: [
                      MyTextFormField(
                        controller: _skuController,
                        icondata: Icons.code,
                        labelText: 'SKU',
                      ),
                      MyTextFormField(
                        controller: _categoryController,
                        icondata: Icons.abc_sharp,
                        labelText: 'Category',
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        controller: _productNameController,
                        icondata: Icons.abc_sharp,
                        labelText: 'Product Name',
                      ),
                      MyTextFormField(
                        controller: _quantityController,
                        icondata: Icons.numbers,
                        labelText: 'Quantity',
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        controller: _costController,
                        icondata: Icons.sell,
                        labelText: 'Cost',
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        controller: _sellingPriceController,
                        icondata: Icons.sell,
                        labelText: 'Selling Price',
                      ),
                      const SizedBox(height: 30.0),
                      MyButton(
                          onPressed: () {
                            crudMethods.addItem(
                                _categoryController.text,
                                _productNameController.text,
                                _costController.text,
                                _sellingPriceController.text,
                                _skuController.text,
                                _quantityController.text);

                            _categoryController.clear();
                            _productNameController.clear();
                            _costController.clear();
                            _sellingPriceController.clear();
                            _skuController.clear();
                            _quantityController.clear();
                          },
                          text: "Add Item",
                          bgcolor: const Color(0xFF363030),
                          textColor: Colors.white),
                      const SizedBox(height: 15.0),
                      MyButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'Cancel',
                        bgcolor: Colors.red,
                        textColor: Colors.white,
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x70A16B19),
        centerTitle: true,
        title: const Text('ITEM LIST'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF7A5B2D),
        // backgroundColor: Colors.white,
        onPressed: addItemPopUp,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SearchBar(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFE6CCA5)),
                  side: MaterialStatePropertyAll(
                      BorderSide(color: Color(0x9F7C5C2D))),
                  leading: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                  ),
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
                            String category = data['category'];
                            String productName = data['productName'];
                            String cost = data['cost'];
                            String sellingPrice = data['sellingPrice'];
                            String quantity = data['sellingPrice'];
                            String SKU = data['sellingPrice'];

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
                                      Expanded(
                                        child: Container(
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
                                                category,
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                "Quantity: $quantity",
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                "SKU: $SKU",
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Expanded(
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(Icons.more_vert,
                                                  color: Colors.white),
                                            ],
                                          ),
                                        ),
                                      )
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
