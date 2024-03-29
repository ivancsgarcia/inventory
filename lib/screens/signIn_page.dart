import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/federated_provider.dart';
import 'package:flutter_application_1/components/intro.dart';
import 'package:flutter_application_1/components/textformfield.dart';

class SignInPage extends StatefulWidget {
  final Function() onTap;
  const SignInPage({
    super.key,
    required this.onTap,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(message),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        // ),
        body: SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.0),
                child: Intro(
                  text: 'Sign In',
                  text2: 'Please sign in your account.',
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Form(
                  child: Column(
                children: [
                  // Email Field
                  MyTextFormField(
                    controller: _emailController,
                    icondata: Icons.email,
                    labelText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 15.0),

                  // Password Field
                  MyTextFormField(
                    controller: _passwordController,
                    icondata: Icons.lock,
                    labelText: 'Password',
                    obscureText: true,
                  ),

                  // Forgot Password
                  const SizedBox(height: 2.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Sign In Button
                  Center(
                      child: MyButton(
                    onPressed: _signIn,
                    text: 'Sign In',
                    bgcolor: const Color(0xFF363030),
                    textColor: Colors.white,
                  )),
                ],
              )),
              const SizedBox(height: 30.0),

              // Federated Providers
              const FederatedProviders(text: 'Sign in via'),
              const SizedBox(
                height: 60.0,
              ),

              // Sign Up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account? '),
                  GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
