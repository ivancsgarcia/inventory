import 'package:flutter/material.dart';

class FunctionButton extends StatelessWidget {
  final String text;
  final IconData icondata;
  // final Function()? onTap;
  final void Function()? onTap;
  const FunctionButton({
    super.key,
    required this.text,
    required this.icondata,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130.0,
        height: 130.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xFFE6CCA5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icondata,
              size: 40.0,
            ),
            const SizedBox(height: 10.0),
            Text(
              text,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
