// ignore_for_file: file_names

import 'package:flutter/material.dart';

void showOrderStatusDialog(BuildContext context, bool success) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(success ? 'Order Successful' : 'Order Failed'),
        content: Text(success
            ? 'Thank you for your order!'
            : 'Sorry, there was an error processing your order.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
