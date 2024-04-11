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

Future addEmployeeDetails(
    String firstName, String lastName, String email, String newUserID) async {
  final user = <String, dynamic>{
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
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

  // Create
  Future addItems(
    String category,
    String productName,
    String cost,
    String sellingPrice,
  ) async {
    try {
      final item = <String, dynamic>{
        "category": category,
        "productName": productName,
        "cost": cost,
        "sellingPrice": sellingPrice,
      };

      db
          .collection("users")
          .doc(auth.currentUser?.uid)
          .collection("items")
          .add(item)
          .then((DocumentReference doc) =>
              print('DocumentSnapshot added with ID: ${doc.id}'));
    } catch (e) {
      return 'Error adding item';
    }
  }
}
