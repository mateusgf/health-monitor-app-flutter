import 'package:flutter/material.dart';

class HealthTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final String initialValue;

  const HealthTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.initialValue = '',
  });

  @override
  Widget build(BuildContext context) {
    controller.text = this.initialValue;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: const Color(0xFFE7E0D3),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
