import 'package:flutter/material.dart';

class FederatedProvider extends StatelessWidget {
  final String image;
  final Function()? onTap;
  const FederatedProvider({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        image,
        width: 40.0,
        height: 40.0,
      ),
    );
  }
}
