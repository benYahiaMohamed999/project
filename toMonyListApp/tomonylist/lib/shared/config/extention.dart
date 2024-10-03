
import 'package:flutter/material.dart';
import 'package:tomonylist/layout/BorrowedScreen/BorrowedScreen.dart';
import 'package:tomonylist/layout/IncamScreen/IncamScreen.dart';
import 'package:tomonylist/layout/PaidScreen.dart/PaidScreen.dart';
import 'package:tomonylist/layout/SpentScreen/SpentScreen.dart';


extension IntExtension on int {
  Widget getPages() {
    if (this == 0) {
      return const PaidScreen();
    } else if (this == 1) {
      return const BorrowedScreen();
    } else if (this == 2) {
      return const SpentScreen();
    } else {
      return const IncamScreen();
    }
  }

  String getPagesName() {
    if (this == 0) {
      return 'HomeScreen';
    } else if (this == 1) {
      return 'ClubsScreen';
    } else if (this == 2) {
      return 'Setting Screen';
    } else {
      return 'Profile Screen';
    }
  }
}

