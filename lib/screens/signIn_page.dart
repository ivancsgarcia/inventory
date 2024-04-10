import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/federated_provider_list.dart';
import 'package:flutter_application_1/components/intro.dart';
import 'package:flutter_application_1/components/textformfield.dart';
import 'package:flutter_application_1/screens/forgotPassword_page.dart';

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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signIn() async {
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Navigator.pop(context);
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
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('lib/assets/images/login-bg.png'),
            fit: BoxFit.cover,
          )),
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
              const SizedBox(height: 20.0),

              // Sign In Form
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
                  const SizedBox(height: 1.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Sign In Button
                  Center(
                      child: MyButton(
                    onPressed: signIn,
                    text: 'Sign In',
                    bgcolor: const Color(0xFF363030),
                    textColor: Colors.white,
                  )),
                ],
              )),
              const SizedBox(height: 30.0),

              // Federated Providers
              const FederatedProvidersList(text: 'Sign in via'),
              const SizedBox(height: 60.0),

              // Sign Up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
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
