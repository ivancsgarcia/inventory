import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/intro.dart';
import 'package:flutter_application_1/components/textformfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Intro(
            text: 'Forgot Password',
            text2: 'Please enter your email.',
          ),
          const SizedBox(height: 10.0),
          MyTextFormField(
              controller: _emailController,
              labelText: 'Email',
              obscureText: false,
              icondata: Icons.account_circle),
          MyButton(
              onPressed: () {},
              text: 'Send',
              bgcolor: Colors.black,
              textColor: Colors.white)
        ],
      )),
    );
  }
}
