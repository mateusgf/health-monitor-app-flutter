import 'package:flutter/material.dart';

class HealthButton extends StatelessWidget {
  final Function()? onTap;

  final Text child;

  const HealthButton({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color(0xFFCCAFA5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
