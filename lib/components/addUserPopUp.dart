import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/function_button.dart';
import 'package:flutter_application_1/components/textformfield.dart';
import 'package:flutter_application_1/services/firestore.dart';

class AddUserPopUp extends StatefulWidget {
  const AddUserPopUp({super.key});

  @override
  State<AddUserPopUp> createState() => _AddUserPopUpState();
}

class _AddUserPopUpState extends State<AddUserPopUp> {
  @override
  Widget build(BuildContext context) {
    return FunctionButton(
      onTap: () {},
      text: 'Add User',
      icondata: Icons.add_box,
    );
  }
}
