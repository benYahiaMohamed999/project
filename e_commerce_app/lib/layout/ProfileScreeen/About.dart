// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class About extends StatelessWidget {
  About({super.key});

  String appName = 'Shop_Kaskroutet';
  String packageName = 'com.flutter.Hama';
  String version = '0.1.2';
  String buildNumber = '1221-1221';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About $appName'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('App Name: $appName', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text('Package Name: $packageName',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text('Version: $version', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text('Build Number: $buildNumber',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            // You can add more information here
            const Text(
              'Your App Description Here. You can include details about the app purpose, features, acknowledgments, or any other information you deem necessary.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
