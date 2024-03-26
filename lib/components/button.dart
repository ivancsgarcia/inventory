import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color bgcolor;
  final Color textColor;

  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.bgcolor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(250, 60),
        backgroundColor: bgcolor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 18.0),
      ),
    );
  }
}
