import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_page.dart';

class MySignUpForm extends StatefulWidget {
  const MySignUpForm({super.key});

  @override
  State<MySignUpForm> createState() => _MySignUpFormState();
}

class _MySignUpFormState extends State<MySignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Create Your Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: _firstNameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.black)),
                      prefixIcon: const Icon(Icons.account_circle),
                      hintText: 'First Name',
                      hintStyle: const TextStyle(fontSize: 18.0)),
                  style: const TextStyle(fontSize: 18.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: _lastNameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.black)),
                      prefixIcon: const Icon(Icons.account_circle),
                      hintText: 'Last Name',
                      hintStyle: const TextStyle(fontSize: 18.0)),
                  style: const TextStyle(fontSize: 18.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: _emailController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.black)),
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'Email',
                      hintStyle: const TextStyle(fontSize: 18.0)),
                  style: const TextStyle(fontSize: 18.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: _usernameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.black)),
                      prefixIcon: const Icon(Icons.account_circle),
                      hintText: 'Username',
                      hintStyle: const TextStyle(fontSize: 18.0)),
                  style: const TextStyle(fontSize: 18.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.black)),
                      prefixIcon: const Icon(Icons.account_circle),
                      hintText: 'Password',
                      hintStyle: const TextStyle(fontSize: 18.0)),
                  style: const TextStyle(fontSize: 18.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.black)),
                      prefixIcon: const Icon(Icons.account_circle),
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(fontSize: 18.0)),
                  style: const TextStyle(fontSize: 18.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              const SizedBox(
                height: 10.0,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF363030),
                    minimumSize: const Size(200, 50)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyLogInForm()));
                },
                child: const Text(
                  'SIGN UP',
                  style:
                      TextStyle(fontSize: 20.0, color: Colors.white, shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Color(0xFF808080),
                    )
                  ]),
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign Up via',
                              style: TextStyle(fontSize: 18.0),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.facebook,
                              size: 30.0,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Image.network(
                              'https://w7.pngwing.com/pngs/506/509/png-transparent-google-company-text-logo.png',
                              width: 30.0,
                              height: 30.0,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/1200px-Instagram_icon.png',
                              width: 30.0,
                              height: 30.0,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
