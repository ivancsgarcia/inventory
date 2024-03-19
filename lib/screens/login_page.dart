import 'package:flutter/material.dart';
import './home_page.dart';
import './signup_page.dart';

class MyLogInForm extends StatefulWidget {
  const MyLogInForm({super.key});

  @override
  State<MyLogInForm> createState() => _MyLogInFormState();
}

class _MyLogInFormState extends State<MyLogInForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Username:',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            const SizedBox(height: 50.0),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                icon: Icon(Icons.lock_outline_rounded),
                labelText: 'Password:',
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_usernameController.text == 'user' &&
                        _passwordController.text == 'password') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHome()));
                    } else {}
                  }
                },
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(300, 60)),
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MySignUpForm()));
                },
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
                child: const Text('Sign Up'),
              ),
            ),
            const SizedBox(height: 20.0),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Column(
            //       children: [Text('Log In via')],
            //     ),
            //     Column()
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     const Icon(Icons.facebook),
            //     const SizedBox(
            //       width: 10.0,
            //     ),
            //     Image.network(
            //       'https://w7.pngwing.com/pngs/506/509/png-transparent-google-company-text-logo.png',
            //       width: 24.0,
            //       height: 24.0,
            //     ),
            //     const SizedBox(
            //       width: 10.0,
            //     ),
            //     Image.network(
            //       'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/1200px-Instagram_icon.png',
            //       width: 24.0,
            //       height: 24.0,
            //     ),
            //   ],
            // )
            Container(
              
              width: 150.0,
              color: Colors.lightGreen,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Log In via')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.facebook),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Image.network(
                        'https://w7.pngwing.com/pngs/506/509/png-transparent-google-company-text-logo.png',
                        width: 24.0,
                        height: 24.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/1200px-Instagram_icon.png',
                        width: 24.0,
                        height: 24.0,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
