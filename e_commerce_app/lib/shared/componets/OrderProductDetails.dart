// ignore_for_file: file_names

import 'package:e_commerce_app/shared/constant/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderProductDetails extends StatelessWidget {
  const OrderProductDetails(
      {super.key,
      required this.quantite,
      required this.priceOne,
      required this.description,
      required this.nameProduct});

  final int quantite;
  final double priceOne;
  final String description;
  final String nameProduct;

  @override
  Widget build(BuildContext context) {
    double total = quantite * priceOne;

    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Image(
              height: 60,
              image: AssetImage(
                MyimagesAssets.instagram,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nameProduct),
              Text(
                "$description+ not work Overflow",
                textAlign: TextAlign.justify,
              ),
              Text("QTY:$quantite * £$priceOne"),
            ],
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Text(
              total.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
