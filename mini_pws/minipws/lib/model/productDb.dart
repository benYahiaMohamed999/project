// ignore_for_file: file_names

import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1, adapterName: 'ProductAdapter') // Ensure typeId is unique
class Product extends HiveObject {
  @HiveField(0) // Unique index for the field
  final String name;

  @HiveField(1)
  final double price;

  @HiveField(2)
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.image,
  });
}