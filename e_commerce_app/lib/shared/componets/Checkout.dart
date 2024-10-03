// ignore_for_file: file_names

import 'package:e_commerce_app/shared/componets/ListTitleChekout.dart';
import 'package:e_commerce_app/shared/componets/ShowDialogStaus.dart';
import 'package:flutter/material.dart';

checkout(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        bool isSucessOrder = true;
        Text terms = const Text(
          "Term",
          style: TextStyle(fontWeight: FontWeight.w700),
        );
        Text condition = const Text(
          "Condition",
          style: TextStyle(fontWeight: FontWeight.w700),
        );
        return Padding(
          padding: const EdgeInsets.all(8.0),
          // ignore: sized_box_for_whitespace
          child: Container(
            height: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTitleCheckout(
                  iconFlag: const Icon(Icons.abc),
                  isText: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.clear_outlined,
                  ),
                  titelTextLeft: "Checkout",
                  titelTextRight: "",
                ),
                ListTitleCheckout(
                  iconFlag: const Icon(Icons.abc),
                  isText: true,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                  ),
                  titelTextLeft: "Delivrey",
                  titelTextRight: "Payement Method",
                ),
                ListTitleCheckout(
                  iconFlag: const Icon(Icons.flag),
                  isText: false,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                  ),
                  titelTextLeft: "Pament",
                  titelTextRight: "Icon(Icons.abc)",
                ),
                ListTitleCheckout(
                  isText: true,
                  iconFlag: const Icon(Icons.abc),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                  ),
                  titelTextLeft: "Promo code",
                  titelTextRight: "Pick discount",
                ),
                ListTitleCheckout(
                  iconFlag: const Icon(Icons.abc),
                  isText: true,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                  ),
                  titelTextLeft: "Total cost",
                  titelTextRight: "£12.00",
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80),
                  child: Column(
                    children: [
                      const Text(
                        "By placing an order your agree to our",
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          terms,
                          const Text(
                            " and ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          condition
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: TextButton(
                    onPressed: () {
                      showOrderStatusDialog(context, !isSucessOrder);
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "Place Order",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
