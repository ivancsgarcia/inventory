import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
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
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xF17C5C2D),
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
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.person),
                                    SizedBox(width: 10.0),
                                    Text('Profile'),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.card_giftcard),
                                    SizedBox(width: 10.0),
                                    Text('Subscription'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Security',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Icon(Icons.lock),
                                  SizedBox(width: 10.0),
                                  Text('Password'),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Icon(Icons.fingerprint),
                                  SizedBox(width: 10.0),
                                  Text('Use Biometrics'),
                                  // Icon(Icons.abc),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                child: Column(
                  children: [
                    const Text(''),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Icon(Icons.language),
                                  SizedBox(width: 10.0),
                                  Text('Languages'),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Icon(Icons.notifications),
                                  SizedBox(width: 10.0),
                                  Text('Enable Notifications'),
                                  // Icon(Icons.abc),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Icon(Icons.support),
                                  SizedBox(width: 10.0),
                                  Text('Support'),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Icon(Icons.help),
                                  SizedBox(width: 10.0),
                                  Text('FAQ'),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _logOut();
                                    },
                                    child: const Text(
                                      'Sign Out',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
