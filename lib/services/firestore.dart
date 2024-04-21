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

Future addEmployeeDetails(String firstName, String lastName, String email,
    String phoneNumber, String newUserID) async {
  final user = <String, dynamic>{
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
  };

// Add a new document with a generated ID
  db
      .collection("users")
      .doc(auth.currentUser?.uid)
      .collection("employees")
      .doc(newUserID)
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
  ) {
    return dbItems.add({
      'category': category,
      'productName': productName,
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
  ) {
    return dbItems.doc(docID).update({
      'category': newCategory,
      'productName': newProductName,
      'cost': newCost,
      'sellingPrice': newSellingPrice,
    });
  }
}
