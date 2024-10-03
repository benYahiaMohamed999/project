// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ListTitleCheckout extends StatelessWidget {
  const ListTitleCheckout({
    super.key,
    required this.titelTextLeft,
    required this.titelTextRight,
    required this.icon,
    required this.onPressed,
    required this.isText,
    required this.iconFlag,
  });

  final String titelTextLeft;
  final String titelTextRight;
  final Icon icon;
  final Icon iconFlag;
  final VoidCallback onPressed;
  final bool isText;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titelTextLeft),
      trailing: SizedBox(
        height: 20,
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (isText)
              Text(
                titelTextRight,
              )
            else
              iconFlag,
            const SizedBox(
              width: 20,
            ),
            Icon(icon.icon),
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}
