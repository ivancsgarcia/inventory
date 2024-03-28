import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/signIn_page.dart';
import 'package:flutter_application_1/screens/signUp_page.dart';

class SignInOrSignUpPage extends StatefulWidget {
  const SignInOrSignUpPage({super.key});

  @override
  State<SignInOrSignUpPage> createState() => _SignInOrSignUpPageState();
}

class _SignInOrSignUpPageState extends State<SignInOrSignUpPage> {
  bool showSignInPage = true;

  void togglePage() {
    setState(() {
      showSignInPage = !showSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return SignInPage(onTap: togglePage);
    } else {
      return SignUpPage(onTap: togglePage);
    }
  }
}
