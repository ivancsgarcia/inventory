import 'package:flutter/material.dart';

class Try extends StatelessWidget {
  const Try({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'USERNAME',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'PASSWORD',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 10.0),
              TextField(
                obscureText: true, // Set to true for password field
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('LOG IN'),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              TextButton(
                onPressed: () {},
                child: const Text('SIGN UP'),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Log in via'),
                  const SizedBox(width: 5.0),
                  Image.asset('assets/fgo_logo.png',
                      width:
                          25.0), // Assuming you have an FGO logo image in the assets folder
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
