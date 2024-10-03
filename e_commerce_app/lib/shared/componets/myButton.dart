// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MayButtonLogin extends StatelessWidget {
  const MayButtonLogin({
    super.key,
    required this.color,
    required this.title,
    required this.onPressed,
    required this.height,
    required this.width,
  });
  final Color color;
  final String title;
  final VoidCallback onPressed;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: width,
          height: height,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
