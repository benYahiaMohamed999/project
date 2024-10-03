// ignore_for_file: file_names

import 'package:e_commerce_app/layout/onBoarding/onboardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: use_key_in_widget_constructors
class MyResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Determine the layout based on screen size
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          //desktop layout
          return buildDesktopLayout();
        } else if (sizingInformation.deviceScreenType==DeviceScreenType.watch) {   
          // web layout
          return buildWatchLayout();
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
            //tablet layout
          return buildTabletLayout();
        } else {
          //mobile layoute
          return buildMobileLayout();
        }
      },
    );
  }

  Widget buildDesktopLayout() {
    return const OnBordingScreen();
  }

  Widget buildTabletLayout() {
    return const OnBordingScreen();
  }

  Widget buildMobileLayout() {
    return const OnBordingScreen();
  }
  Widget buildWatchLayout() {
  return const OnBordingScreen();
}
}


