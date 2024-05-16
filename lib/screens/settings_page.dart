import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/screens/auth_page.dart";
import "package:flutter_application_1/screens/signIn_page.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void _logOut() async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const AuthPage()),
      (Route<dynamic> route) => false,
    );

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const SignInPage()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x70A16B19),
        centerTitle: true,
        title: const Text('SETTINGS'),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/show-bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Settings Page',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                    minimumSize: MaterialStatePropertyAll(Size(200, 60)),
                  ),
                  onPressed: _logOut,
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
