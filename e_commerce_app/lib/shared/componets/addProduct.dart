// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget addingMultipleProduct() => Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(),
      ),
      child: Stack(
        children: [
          buttomCard(
            onPressed: () {},
            icon: Icons.add,
          ),
          const SizedBox(
            width: 30,
          ),
          buttomCard(
            onPressed: () {},
            icon: Icons.add,
          ),
        ],
      ),
    );

Widget buttomCard({VoidCallback? onPressed, icon}) => Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.green,
        border: Border.symmetric(
          horizontal: BorderSide.none,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
        ),
      ),
    );
