import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  const MyButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(buttonText),
    );
  }
}
