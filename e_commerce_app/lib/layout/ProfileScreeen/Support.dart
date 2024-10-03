// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatelessWidget {
  final String supportEmail = 'support@example.com';
  final String supportPhoneNumber = '+1234567890';
  final String faqUrl = 'https://www.example.com/faq';

  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support & Help'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SupportOption(
            icon: Icons.email,
            title: 'Email Us',
            subtitle: supportEmail,
            onTap: () => _launchEmail(context, supportEmail),
          ),
          SupportOption(
            icon: Icons.phone,
            title: 'Call Us',
            subtitle: supportPhoneNumber,
            onTap: () => _launchPhone(context, supportPhoneNumber),
          ),
          SupportOption(
            icon: Icons.question_answer,
            title: 'FAQs',
            onTap: () => _launchURL(context, faqUrl),
          ),
          // Add more support options here
        ],
      ),
    );
  }

  Future<void> _launchEmail(BuildContext context, String email) async {
    final Uri params = Uri(scheme: 'mailto', path: email);
    if (!await launch(params.toString())) {
      // ignore: use_build_context_synchronously
      _showSnackBar(context, 'Could not launch email client');
    }
  }

  Future<void> _launchPhone(BuildContext context, String phone) async {
    if (!await launch('tel:$phone')) {
       // ignore: use_build_context_synchronously
      _showSnackBar(context, 'Could not launch phone dialer');
    }
  }

  void _launchURL(BuildContext context, String url) async {
    if (!await launch(url)) {
       // ignore: use_build_context_synchronously
      _showSnackBar(context, 'Could not open the link');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class SupportOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const SupportOption({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap,
    );
  }
}
