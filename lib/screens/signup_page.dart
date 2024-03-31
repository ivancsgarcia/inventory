import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/federated_provider_list.dart';
import 'package:flutter_application_1/components/intro.dart';
import 'package:flutter_application_1/components/textformfield.dart';
import 'package:flutter_application_1/services/firestore.dart';

class SignUpPage extends StatefulWidget {
  final Function() onTap;
  const SignUpPage({
    super.key,
    required this.onTap,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() async {
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );

    try {
      if (_passwordController.text == _confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        addUserDetails(
          _firstNameController.text,
          _lastNameController.text,
          _emailController.text,
        );
      } else {
        showErrorMessage('Passwords do not match');
      }

      // Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      // Navigator.of(context).pop();
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
                    text: 'Sign Up',
                    text2: 'Please sign up your account.',
                  ),
                ),
                const SizedBox(height: 20.0),
                Form(
                    child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Name Field
                    MyTextFormField(
                      controller: _firstNameController,
                      icondata: Icons.account_circle,
                      labelText: 'First Name',
                      obscureText: false,
                    ),
                    const SizedBox(height: 5.0),

                    // Last Name Field
                    MyTextFormField(
                      controller: _lastNameController,
                      icondata: Icons.account_circle,
                      labelText: 'Last Name',
                      obscureText: false,
                    ),
                    const SizedBox(height: 5.0),

                    // Email Field
                    MyTextFormField(
                      controller: _emailController,
                      icondata: Icons.email,
                      labelText: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(height: 5.0),

                    // Password Field
                    MyTextFormField(
                      controller: _passwordController,
                      icondata: Icons.lock,
                      labelText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 5.0),

                    // Confirm Password Field
                    MyTextFormField(
                      controller: _confirmPasswordController,
                      icondata: Icons.lock,
                      labelText: 'Confirm Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 20.0),

                    // Sign Up Button
                    Center(
                      child: MyButton(
                        onPressed: _signUp,
                        text: 'Sign Up',
                        bgcolor: const Color(0xFF363030),
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30.0),

                    // Federated Providers
                    const FederatedProvidersList(text: 'Sign up via'),
                    const SizedBox(
                      height: 60.0,
                    ),

                    // Sign In link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
