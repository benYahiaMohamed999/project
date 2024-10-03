// ignore_for_file: file_names

import 'package:e_commerce_app/shared/componets/Notification.dart';
import 'package:flutter/material.dart';

class SetReminder extends StatelessWidget {
  const SetReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          forceMaterialTransparency: true,
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Read all",
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => NotificationWidget(
              id: index + 1,
              dateTime: DateTime.now(),
              orderStatus: "Accepted",
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: 6,
          ),
        ));
  }
}
