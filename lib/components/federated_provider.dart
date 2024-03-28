import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth_service.dart';

class FederatedProviders extends StatelessWidget {
  final String text;
  const FederatedProviders({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              const Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              const Expanded(child: Divider())
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/facebook-logo.png',
              width: 40.0,
              height: 40.0,
            ),
            const SizedBox(width: 10.0),
            GestureDetector(
              onTap: () {
                signInWithGoogle();
              },
              child: Image.asset(
                'lib/assets/images/google-logo.png',
                width: 40.0,
                height: 40.0,
              ),
            ),
            const SizedBox(width: 10.0),
            Image.asset(
              'lib/assets/images/yahoo-logo.png',
              width: 40.0,
              height: 40.0,
            ),
          ],
        ),
      ],
    );
  }
}
