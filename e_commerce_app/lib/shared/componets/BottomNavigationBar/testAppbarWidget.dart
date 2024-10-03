// ignore_for_file: file_names

import 'package:e_commerce_app/shared/componets/BottomNavigationBar/crystileItme.dart';
import 'package:e_commerce_app/shared/componets/BottomNavigationBar/navBar.dart';
import 'package:flutter/material.dart';

class TestNewNavBar extends StatelessWidget {
  const TestNewNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: CrystalNavigationBar(
        borderRadius: BorderSide.strokeAlignCenter,
        onTap: (index) {
          //print(index);
        },
        currentIndex: 2,

        items: [
          CrystalNavigationBarItem(
            icon: Icons.abc,
          ),
          CrystalNavigationBarItem(icon: Icons.abc),
          CrystalNavigationBarItem(icon: Icons.abc),
          CrystalNavigationBarItem(icon: Icons.abc),
        ],
      ),
    );
  }
}
