import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/function_button.dart';
import 'package:flutter_application_1/components/textformfield.dart';
import 'package:flutter_application_1/services/firestore.dart';

class AddItemPopUp extends StatefulWidget {
  const AddItemPopUp({
    super.key,
  });

  @override
  State<AddItemPopUp> createState() => _AddItemPopUpState();
}

class _AddItemPopUpState extends State<AddItemPopUp> {
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
                          // onPressed: () {
                          //   crudMethods.addItem(
                          //     _categoryController.text,
                          //     _productNameController.text,
                          //     _costController.text,
                          //     _sellingPriceController.text,
                          //   );

                          //   _categoryController.clear();
                          //   _productNameController.clear();
                          //   _costController.clear();
                          //   _sellingPriceController.clear();
                          // },
                          onPressed: () {},
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
    return FunctionButton(
      onTap: addItemPopUp,
      text: 'Add Item',
      icondata: Icons.add_circle,
    );
  }
}
