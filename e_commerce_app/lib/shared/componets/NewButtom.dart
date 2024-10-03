// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NewButtom extends StatelessWidget {
  const NewButtom({super.key, required this.color, required this.label, required this.onPressed});
  final Color color;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        child:  Text(
          label,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );

  }
}
