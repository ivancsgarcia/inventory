import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/textformfield.dart';
import 'package:flutter_application_1/services/firestore.dart';
import 'package:image_picker/image_picker.dart';

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
  final _quantityController = TextEditingController();
  final _skuController = TextEditingController();

  final CrudMethods crudMethods = CrudMethods();
  final ImagePicker picker = ImagePicker();
  File? _selectedImage;

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

  Future _pickImageFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;
    setState(() {
      _selectedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ADD ITEM'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              // height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('SKU:'),
                        MyTextFormField(
                          controller: _skuController,
                          icondata: Icons.code,
                          labelText: 'SKU',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Column(
                      children: [
                        const Text('CATEGORY:'),
                        MyTextFormField(
                          controller: _categoryController,
                          icondata: Icons.abc_sharp,
                          labelText: 'Category',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Column(
                      children: [
                        const Text('PRODUCT NAME:'),
                        MyTextFormField(
                          controller: _productNameController,
                          icondata: Icons.abc_sharp,
                          labelText: 'Product Name',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Column(
                      children: [
                        const Text('QUANTITY:'),
                        MyTextFormField(
                          controller: _quantityController,
                          icondata: Icons.numbers,
                          labelText: 'Quantity',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Column(
                      children: [
                        const Text('COST:'),
                        MyTextFormField(
                          controller: _costController,
                          icondata: Icons.sell,
                          labelText: 'Cost',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Column(
                      children: [
                        const Text('SELLING PRICE:'),
                        MyTextFormField(
                          controller: _sellingPriceController,
                          icondata: Icons.sell,
                          labelText: 'Selling Price',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      minimumSize: MaterialStatePropertyAll(Size(200, 60)),
                    ),
                    onPressed: () {
                      _pickImageFromGallery();
                    },
                    child: const Text(
                      'Pick Image From Gallery',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  _selectedImage != null
                      ? Image.file(
                          _selectedImage!,
                          height: 200.0,
                          width: 200.0,
                        )
                      : const Text('Please Select an Image'),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
