import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/try.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

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
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400,
                  height: 70,
                  color: Colors.black.withOpacity(.1),
                  child: TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: 'First Name'),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: 400,
                  height: 70,
                  color: Colors.black.withOpacity(.1),
                  child: TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: 'Last Name'),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: 400,
                  height: 70,
                  color: Colors.black.withOpacity(.1),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: 'Email'),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: 400,
                  height: 70,
                  color: Colors.black.withOpacity(.1),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: 'Password'),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: 400,
                  height: 70,
                  color: Colors.black.withOpacity(.1),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: 'Confirm Password'),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _signUp,
                    child: const Text("Sign Up"),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ));
                    },
                    child: const Text("Sign In"),
                  ),
                ),
                Container(
                  width: 120,
                  height: 50,
                  color: Colors.black.withOpacity(.1),
                  child: Column(
                    children: [
                      const Text('Log in via'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.facebook),
                          const SizedBox(width: 10.0),
                          Image.network(
                            'https://w7.pngwing.com/pngs/506/509/png-transparent-google-company-text-logo.png',
                            width: 30.0,
                            height: 30.0,
                          ),
                          const SizedBox(width: 10.0),
                          Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/1200px-Instagram_icon.png',
                            width: 30.0,
                            height: 30.0,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ))
          ],
        ));
  }
}
