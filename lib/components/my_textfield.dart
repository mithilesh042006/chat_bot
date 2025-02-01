import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
        hintText: "Ask anything to MOHAMMED BOT",
      ),
    );
  }
}
