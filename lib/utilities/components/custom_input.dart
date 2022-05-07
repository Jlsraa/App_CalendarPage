import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;

  final TextEditingController? controller;

  CustomInput({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: TextField(
        controller: this.controller,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          label: Text(this.label),
        ),
      ),
    );
  }
}
