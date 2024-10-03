// ignore_for_file: file_names

import 'package:e_commerce_app/shared/componets/InMyOrderDetails.dart';
import 'package:e_commerce_app/shared/componets/MyorderDetails.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My order"),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    //Show MY order Detail

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InMyOrderDetails(
                          amount: 20.0,
                          deliveryCost: 2.0,
                          discountCost: -0.25,
                          discription:
                              "this is my one test product sdfgqdsfdgsdg sdgsdqfqgsdgqsdgdsqqgsdfgfgfdfd",
                          orderId: "2",
                          dateTime: DateTime.now(),
                          delevredType: "Delivred",
                          index: index,
                          itemName: "banana",
                          paymentStatus: "Processing",
                          paymentType: "Cash on delivery",
                          status: "processing",
                        ),
                      ),
                    );
                  },
                  child: MyOrderDetails(
                    orderId: index.toString(),
                    dateTime: DateTime.now(),
                    delevredType: "Delivery",
                    index: index,
                    itemName: "banana",
                    paymentType: "Cash on delivery",
                    paymentStatus: "Success",
                    status: "Placed",
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
