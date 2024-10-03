// ignore_for_file: file_names

import 'package:e_commerce_app/layout/ProfileScreeen/About.dart';
import 'package:e_commerce_app/layout/ProfileScreeen/PrivacyPolice.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Setting extends StatelessWidget {
  Setting({super.key});

  bool darkMode = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: darkMode,
            onChanged: (bool value) {
              darkMode = value;
            },
          ),
          SwitchListTile(
            title: const Text('Notifications'),
            value: notificationsEnabled,
            onChanged: (bool value) {
              notificationsEnabled = value;
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              // Navigate to privacy policy screen/document
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
          ),
        ],
      ),
    );
  }
}
