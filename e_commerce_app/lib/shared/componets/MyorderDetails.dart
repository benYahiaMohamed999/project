// ignore_for_file: file_names

import 'package:e_commerce_app/shared/constant/images.dart';
import 'package:flutter/cupertino.dart';

class MyOrderDetails extends StatelessWidget {
  const MyOrderDetails(
      {super.key,
      required this.index,
      required this.status,
      required this.orderId,
      required this.dateTime,
      required this.itemName,
      required this.delevredType,
      required this.paymentType,
      required this.paymentStatus});
  final int index;
  final String status;
  final String orderId;
  final DateTime dateTime;
  final String itemName;
  final String delevredType;
  final String paymentType;
  final String paymentStatus;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(20)),
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order No:# $orderId",
                  ),
                  Text(dateTime.toString()),
                ],
              ),
              const SizedBox(
                width: 100,
              ),
              Text(status)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                height: 80,
                image: AssetImage(
                  MyimagesAssets.instagram,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Items :$itemName",
                  ),
                  Text(
                    "Delevred type :$delevredType",
                  ),
                  Text(
                    "Pament Type :$paymentType",
                  ),
                  Text(
                    "Pament Status :$paymentStatus",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
