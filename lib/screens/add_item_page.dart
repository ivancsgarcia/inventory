import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/services/firestore.dart';
import 'package:image_picker/image_picker.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _skuController = TextEditingController();
  final _categoryController = TextEditingController();
  final _productNameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _costController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _markOutDateController = TextEditingController();
  // final imageController = TextEditingController();

  final CrudMethods crudMethods = CrudMethods();
  final ImagePicker picker = ImagePicker();
  File? _selectedImage;
  late String _imageURL;

  @override
  void dispose() {
    _categoryController.dispose();
    _productNameController.dispose();
    _costController.dispose();
    _sellingPriceController.dispose();
    _quantityController.dispose();
    _skuController.dispose();
    _markOutDateController.dispose();
    super.dispose();
  }

  Future<void> uploadImageToFirebaseStorage(File imageFile) async {
    try {
      FirebaseStorage fbstore = FirebaseStorage.instance;

      Reference ref = fbstore
          .ref()
          .child('product_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      await ref.putFile(imageFile);
      String downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> _pickImageFromGallery() async {
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
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
              // width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SKU:',
                            style: TextStyle(
                              fontSize: 18.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: _skuController,
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'CATEGORY:',
                            style: TextStyle(
                              fontSize: 18.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: _categoryController,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'PRODUCT NAME:',
                            style: TextStyle(
                              fontSize: 18.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: _productNameController,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'QUANTITY:',
                            style: TextStyle(
                              fontSize: 18.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: _quantityController,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'COST:',
                            style: TextStyle(
                              fontSize: 18.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: _costController,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SELLING PRICE:',
                            style: TextStyle(
                              fontSize: 18.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: _sellingPriceController,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'MARK OUT DATE:',
                            style: TextStyle(
                              fontSize: 18.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: _markOutDateController,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Insert Image:',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.blue),
                                    minimumSize:
                                        MaterialStatePropertyAll(Size(200, 60)),
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
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                              ),
                              child: _selectedImage != null
                                  ? Image.file(
                                      _selectedImage!,
                                      height: 200.0,
                                      width: 200.0,
                                    )
                                  : const Text('Please Select an Image'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    MyButton(
                        onPressed: () {
                          crudMethods.addItem(
                            _categoryController.text,
                            _productNameController.text,
                            _costController.text,
                            _sellingPriceController.text,
                            int.parse(_skuController.text),
                            _quantityController.text,
                            _markOutDateController.text,
                            _imageURL,
                          );

                          _categoryController.clear();
                          _productNameController.clear();
                          _costController.clear();
                          _sellingPriceController.clear();
                          _skuController.clear();
                          _quantityController.clear();
                          _markOutDateController.clear();
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
      ),
    );
  }
}
