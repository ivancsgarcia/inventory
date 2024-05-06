import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
final user = auth.currentUser;

Future addUserDetails(String firstName, String lastName, String email) async {
  final user = <String, dynamic>{
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "type": "Admin",
  };

// Add a new document with a generated ID
  db
      .collection("users")
      .doc(auth.currentUser?.uid)
      .set(user)
      .then((documentSnapshot) {
    print('User\'s Info added to the database.');
  });
}

Future addEmployeeDetails(
    String firstName, String lastName, String email, String phoneNumber) async {
  final user = <String, dynamic>{
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    'parent': auth.currentUser?.uid,
    'type': 'Employee',
  };

// Add a new document with a generated ID
  db
      .collection("users")
      .doc(auth.currentUser?.uid)
      .collection("employees")
      .doc()
      .set(user)
      .then((documentSnapshot) {
    // print('DocumentSnapshot added with ID: ${documentSnapshot.id}');
    print('User\'s Info added to the database.');
  });
}

Future getUserName() async {
  await db.collection("users").doc(user?.uid).get().then((documentSnapshot) {
    Text(documentSnapshot.get("firstName") +
        ' ' +
        documentSnapshot.get('lastName'));
  });
}

// Fetch user details
Stream<QuerySnapshot> getEmployeeDetails() {
  return db
      .collection("users")
      .doc(user?.uid)
      .collection("employees")
      .snapshots();
}

class CrudMethods {
  // Get
  final CollectionReference dbItems =
      db.collection("users").doc(auth.currentUser?.uid).collection("items");

  // Create
  Future<void> addItem(
    String category,
    String productName,
    String cost,
    String sellingPrice,
    String quantity,
    String sku,
  ) {
    return dbItems.add({
      'sku': sku,
      'category': category,
      'productName': productName,
      'quantity': quantity,
      'cost': cost,
      'sellingPrice': sellingPrice,

    });
  }

  // Read
  Stream<QuerySnapshot> getItems() {
    return dbItems.snapshots();
  }

  // Update
  Future<void> updateItem(
    String docID,
    String newCategory,
    String newProductName,
    String newCost,
    String newSellingPrice,
    String newQuantity,
    String newSKU,
    
  ) {
    return dbItems.doc(docID).update({
      'sku': newSKU,
      'category': newCategory,
      'productName': newProductName,
      'quantity': newQuantity,
      'cost': newCost,
      'sellingPrice': newSellingPrice,
    });
  }
}
