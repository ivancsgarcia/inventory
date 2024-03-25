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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: 300.0,
                  height: 100.0,
                  margin: const EdgeInsets.only(right: 80.0),
                  // constraints: BoxConstraints.tight(const Size(300, 100.0)),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2.0),
                      ),
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: 'USERNAME',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                ),
                // const SizedBox(height: 20.0),
                Container(
                  width: 300.0,
                  height: 100.0,
                  margin: const EdgeInsets.only(right: 80.0),
                  // constraints: BoxConstraints.tight(const Size(300.0, 100.0)),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2.0),
                      ),
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      labelText: 'PASSWORD',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 260.0),
                  child: InkWell(
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_usernameController.text == 'user' &&
                          _passwordController.text == 'password') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyHome()));
                      } else {}
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    // shadowColor: Color(0xFF000000).withOpacity(.25),
                    shadowColor: Colors.black,
                    elevation: 10.0,
                    minimumSize: const Size(300, 60),
                    backgroundColor: const Color(0xFF363030),
                  ),
                  child: const Text('LOG IN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Color(0xFF808080),
                            )
                          ])),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MySignUpForm()));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      backgroundColor: const Color(0xFFE7E7E7)),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(color: Color(0xFF363030), fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Log In via',
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
    );
  }
}
