import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_application_1/screens/one_time_page.dart';
import 'package:flutter_application_1/services/firestore.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void navigateToOneTimePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingPage()),
    );
  }

  void navigateToHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkFirestoreAndNavigate();
  }

  Future<void> _checkFirestoreAndNavigate() async {
    DocumentReference docRef =
        firestore.collection('users').doc(auth.currentUser!.uid);

    try {
      DocumentSnapshot documentSnapshot = await docRef.get();
      if (documentSnapshot.exists) {
        Map<String, dynamic>? data =
            documentSnapshot.data() as Map<String, dynamic>?;
        if (data?['businessType'] == null || data?['businessType'] == '') {
          navigateToOneTimePage();
        } else {
          navigateToHomePage();
        }
      } else {
        navigateToOneTimePage();
      }
    } catch (error) {
      // Handle errors (e.g., show an error message)
      print("Error getting document: $error");
      // You might want to add a default navigation here in case of an error
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
