import 'package:flutter/material.dart';
import 'package:portfolio/modules/index/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mohamed Ben Yahia',
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.dark(),
      home: Index(),
    );
  }
}
