import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;

  CustomInput({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: TextField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          label: Text(this.label),
        ),
      ),
    );
  }
}
