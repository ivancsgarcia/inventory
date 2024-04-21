import 'package:firebase_auth/firebase_auth.dart';
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
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB69F84),
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/forgotpass-bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: Intro(
                text: 'Forgot Password',
                text2: 'Please enter your email.',
              ),
            ),
            const SizedBox(height: 20.0),

            // Email Field
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextFormField(
                  controller: _emailController,
                  labelText: 'Email',
                  obscureText: false,
                  icondata: Icons.account_circle,
                ),
              ],
            ),
            const SizedBox(height: 30.0),

            // Send Button
            Center(
              child: MyButton(
                  onPressed: passwordReset,
                  text: 'Send',
                  bgcolor: const Color(0xFF363030),
                  textColor: Colors.white),
            )
          ],
        ),
      )),
    );
  }
}
