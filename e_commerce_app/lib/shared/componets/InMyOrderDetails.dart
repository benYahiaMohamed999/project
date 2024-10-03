// ignore_for_file: file_names

import 'package:e_commerce_app/shared/componets/OrderProductDetails.dart';
import 'package:flutter/material.dart';

class InMyOrderDetails extends StatelessWidget {
  const InMyOrderDetails({
    super.key,
    required this.index,
    required this.status,
    required this.orderId,
    required this.dateTime,
    required this.itemName,
    required this.delevredType,
    required this.paymentType,
    required this.paymentStatus,
    required this.discription,
    required this.amount,
    required this.deliveryCost,
    required this.discountCost,
  });
  final int index;
  final String status;
  final String orderId;
  final DateTime dateTime;
  final String itemName;
  final String delevredType;
  final String paymentType;
  final String paymentStatus;
  final String discription;
  final double amount;
  final double deliveryCost;
  final double discountCost;
  @override
  Widget build(BuildContext context) {
    double total = amount + deliveryCost + discountCost;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text("My order detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order id:# $index"),
                            Text(dateTime.toString()),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(paymentStatus),
                            Text(delevredType),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin:const  EdgeInsets.only(left: 20),
                    child: Text(
                      discription,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Delivred Type : "),
                            Text("Payment type :"),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(delevredType),
                            Text(paymentType),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => OrderProductDetails(
                        description: "discription",
                        nameProduct: itemName,
                        priceOne: 2.47,
                        quantite: 2,
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: 6),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Amount"),
                        Text("Delivery Cost"),
                        Text("Discount Cost"),
                        Text("Total"),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(amount.toString()),
                        Text(deliveryCost.toString()),
                        Text(discountCost.toString()),
                        Text(total.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
