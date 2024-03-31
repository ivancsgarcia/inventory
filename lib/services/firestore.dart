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
  db.collection("users").add(user).then((documentSnapshot) {
    print('DocumentSnapshot added with ID: ${documentSnapshot.id}');
  });
}

Future getUserName() async {
  await db.collection("users").doc(user?.uid).get().then((documentSnapshot) {
    Text(documentSnapshot.get("firstName") +
        ' ' +
        documentSnapshot.get('lastName'));
  });
}
