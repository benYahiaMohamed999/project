import 'package:flutter/material.dart' show Color;

class Paid {
  final int id;
  final String description, iconSrc;
  final Color color;
  final double price;
  final String dateTime;
  Paid({
    required this.id,
    required this.dateTime,
    required this.price,
    required this.description,
    this.iconSrc = "assets/icons/ios.svg",
    this.color = const Color(0xFF7553F6),
  });
}

final List<Paid> recentCourses = [
  Paid(
    id:1,
    dateTime: DateTime.now().toString(),
    price: 21.0,
    description: "DCQCSD",
    color: const Color(0xFF9CC5FF),
    iconSrc: "assets/icons/code.svg",
  ),
  Paid(
    id:1,
    dateTime: DateTime.now().toString(),
    price: 21.0,
    description: "DCQCSD",
  ),
  Paid(id:1,
    dateTime: DateTime.now().toString(),
    price: 21.0,
    description: "DCQCSD",
    color: const Color(0xFF9CC5FF),
    iconSrc: "assets/icons/code.svg",
  ),
  Paid(id:1,
    dateTime: DateTime.now().toString(),
    price: 21.0,
    description: "DCQCSD",
    color: const Color(0xFF7553F6),
    iconSrc: "assets/icons/ios.svg",
  ),
];
