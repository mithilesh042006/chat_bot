import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String text;
  final String role;
  const Message({super.key, required this.text, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: role == "user" ? Alignment.topRight : Alignment.topLeft,
      margin: EdgeInsets.only(
          top: 10,
          left: role == "user" ? 50 : 10,
          right: !(role == "user") ? 50 : 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: role == "user"
            ? const Color.fromARGB(255, 36, 36, 36)
            : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            text.trim(),
            style: TextStyle(
              fontSize: 17,
              color: role == "user" ? Colors.white : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
