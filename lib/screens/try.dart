import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/textformfield.dart';
import 'package:flutter_application_1/screens/try2.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

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

      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        userNotFound();
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        wrongPassword();
      }
    }
  }

  void userNotFound() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('User Not Found'),
          content: Text('No user found for that email.'),
        );
      },
    );
  }

  void wrongPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Wrong Password'),
          content: Text('Wrong password provided for that user.'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email Field
                MyTextFormField(
                  controller: _emailController,
                  labelText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 20.0),
                // Password Field
                MyTextFormField(
                  controller: _passwordController,
                  labelText: 'Password',
                  obscureText: true,
                ),
                // Forgot Password
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 20.0),
                // Sign In Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: _signIn,
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Sign Up Button
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )),
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
        ));
  }
}
