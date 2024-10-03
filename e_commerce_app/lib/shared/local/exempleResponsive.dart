// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

//Exemple Rsponsive
Widget exemple() => ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              sizingInformation.deviceScreenType == DeviceScreenType.desktop
                  ? Icons.desktop_mac
                  : Icons.phone_android,
              size: 100,
              color:
                  sizingInformation.deviceScreenType == DeviceScreenType.desktop
                      ? Colors.blue
                      : Colors.green,
            ),
            const SizedBox(height: 20),
            Text(
              sizingInformation.deviceScreenType == DeviceScreenType.desktop
                  ? 'Desktop Layout'
                  : 'Mobile Layout',
              style:const  TextStyle(fontSize: 24),
            ),
          ],
        );
      },
    );
