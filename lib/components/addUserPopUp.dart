import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/function_button.dart';

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
