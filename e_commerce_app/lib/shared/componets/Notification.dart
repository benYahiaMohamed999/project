// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget(
      {super.key,
      required this.id,
      required this.orderStatus,
      required this.dateTime});

  final int id;
  final String orderStatus;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Order $orderStatus"),
              Text("Your order #$id $orderStatus"),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              "$dateTime",
            ),
          )
        ],
      ),
    );
  }
}
