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
        backgroundColor: const Color(0xFFB69F84),
      ),
      body: SafeArea(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/forgotpass-bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Container(
            height: 350,
            width: 360,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1.0,
                color: Colors.black,
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Intro(
                    text: 'Forgot Password',
                    text2: 'Please enter your email.',
                  ),
                  const SizedBox(height: 20.0),

                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  // Send Button
                  ElevatedButton(
                    onPressed: passwordReset,
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.red),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        minimumSize:
                            const MaterialStatePropertyAll(Size(250, 60)),
                        shape: MaterialStatePropertyAll(
                            ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)))),
                    child: const Text('Submit'),
                  )
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
