import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusColor: Colors.black,
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: "Ask anything to MOHAMMED BOT",
      ),
    );
  }
}
