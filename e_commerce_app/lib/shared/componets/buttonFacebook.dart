// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget buttonFacebook({
  required VoidCallback onPressed,
}) =>
    IconButton(
      onPressed: onPressed,
      icon: const Image(
        image: AssetImage('assets/images/pngwing.com.png'),
        height: 40,
        width: 40,
      ),
    );

Widget buttonGoogle({
  required VoidCallback onPressed,
}) =>
    IconButton(
      onPressed: onPressed,
      icon: const Image(
        image: AssetImage('assets/images/google.png'),
        height: 40,
        width: 40,
      ),
    );

Widget buttonMac({
  required VoidCallback onPressed,
}) =>
    IconButton(
      onPressed: onPressed,
      icon: const Image(
        image: AssetImage('assets/images/ios.png'),
        height: 60,
        width: 60,
      ),
    );
