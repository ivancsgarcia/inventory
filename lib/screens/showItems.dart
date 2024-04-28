import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/addItemPopUp.dart';
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

  final CrudMethods crudMethods = CrudMethods();

  @override
  void dispose() {
    _categoryController.dispose();
    _productNameController.dispose();
    _costController.dispose();
    _sellingPriceController.dispose();
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
                      const SizedBox(height: 10),
                      MyTextFormField(
                        controller: _costController,
                        icondata: Icons.abc_sharp,
                        labelText: 'Cost',
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        controller: _sellingPriceController,
                        icondata: Icons.abc_sharp,
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
                            );

                            _categoryController.clear();
                            _productNameController.clear();
                            _costController.clear();
                            _sellingPriceController.clear();
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
        centerTitle: true,
        title: const Text('ITEM LIST'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF7A5B2D),
        onPressed: addItemPopUp,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/images/show-bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
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

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
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
                                        Expanded(
                                          child: Container(
                                            // height: 100,
                                            // width: 100,
                                            child: Image.asset(
                                              'lib/assets/images/itrack_logo.png',
                                              // width: 100,
                                              // height: 100,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            // height: 100,
                                            // width: 100,
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
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Icon(Icons.menu,
                                                    color: Colors.white),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.arrow_circle_left,
                                                        size: 30.0,
                                                        color: Colors.white),
                                                    const SizedBox(width: 2.0),
                                                    Text(
                                                      cost,
                                                      style: const TextStyle(
                                                          fontSize: 20.0,
                                                          color: Colors.white),
                                                    ),
                                                    const SizedBox(width: 2.0),
                                                    const Icon(
                                                        Icons
                                                            .arrow_circle_right,
                                                        size: 30.0,
                                                        color: Colors.white),
                                                  ],
                                                )
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
