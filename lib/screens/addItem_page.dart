import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/textformfield.dart';
import 'package:flutter_application_1/services/firestore.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Items',
          style: TextStyle(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
                    SizedBox(height: 10),
                    MyTextFormField(
                      controller: _productNameController,
                      icondata: Icons.abc_sharp,
                      labelText: 'Product Name',
                    ),
                    SizedBox(height: 10),
                    MyTextFormField(
                      controller: _costController,
                      icondata: Icons.abc_sharp,
                      labelText: 'Cost',
                    ),
                    SizedBox(height: 10),
                    MyTextFormField(
                      controller: _sellingPriceController,
                      icondata: Icons.abc_sharp,
                      labelText: 'Selling Price',
                    ),
                    SizedBox(height: 10),
                    MyButton(
                        onPressed: () {
                          crudMethods.addItems(
                            _categoryController.text,
                            _productNameController.text,
                            _costController.text,
                            _sellingPriceController.text,
                          );
                        },
                        text: "Add Item",
                        bgcolor: const Color(0xFF363030),
                        textColor: Colors.white)
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
