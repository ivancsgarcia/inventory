import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/federated_provider.dart';
import 'package:flutter_application_1/services/firebase_auth.dart';

class FederatedProvidersList extends StatelessWidget {
  final String text;
  const FederatedProvidersList({super.key, required this.text});

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
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FederatedProvider(
              image: 'lib/assets/images/facebook-logo.png',
              onTap: signInWithFacebook,
            ),
            SizedBox(width: 10.0),
            FederatedProvider(
              image: 'lib/assets/images/google-logo.png',
              onTap: signInWithGoogle,
            ),
          ],
        ),
      ],
    );
  }
}
