import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final IconData icondata;

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
    required this.icondata,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 70,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          fontSize: 16.0,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icondata),
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
