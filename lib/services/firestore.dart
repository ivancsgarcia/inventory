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

Future addBusinessDetails(
    String businessType, String shelfLife, String segregatedBy) async {
  final businessDetails = <String, dynamic>{
    "businessType": businessType,
    "shelfLife": shelfLife,
    "segregatedBy": segregatedBy,
  };

  db
      .collection("users")
      .doc(auth.currentUser?.uid)
      .update(businessDetails)
      .then((documentSnapshot) {
    print('Business Info added to the database.');
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

// Fetch user details
Stream<QuerySnapshot> getEmployeeDetails() {
  return db
      .collection("users")
      .doc(auth.currentUser!.uid)
      .collection("employees")
      .snapshots();
}

class CrudMethods {
  // Get
  final CollectionReference dbItems =
      db.collection("users").doc(auth.currentUser?.uid).collection("items");

  // Fetch all items
  Stream<QuerySnapshot> getAllItems() {
    return db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('items')
        .snapshots();
  }

  // Get a specific document reference
  DocumentReference getDocument(String docID) {
    return db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('items')
        .doc(docID);
  }

  // Update a specific document
  Future<void> updateDocument(String docID, Map<String, dynamic> data) {
    return db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('items')
        .doc(docID)
        .update(data);
  }

  // Create
  Future<void> addItem(
      String category,
      String productName,
      String cost,
      String sellingPrice,
      int quantity,
      String sku,
      String markOutDate,
      String imageURL) {
    return dbItems.add({
      'sku': sku,
      'category': category,
      'productName': productName,
      'quantity': quantity,
      'cost': cost,
      'sellingPrice': sellingPrice,
      'markOutDate': markOutDate,
      'ImageURL': imageURL,
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
