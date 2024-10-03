// ignore_for_file: file_names

import 'package:e_commerce_app/shared/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarrousellWidgetTop extends StatelessWidget {
  const MyCarrousellWidgetTop({super.key, required this.sizingInformation});

  final SizingInformation sizingInformation;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          debugPrint('hell');
        },
        child: CarouselSlider(
          options: CarouselOptions(
            animateToClosest: false,
            autoPlay: true,
            autoPlayAnimationDuration: Durations.extralong1,
          ),
          disableGesture: true,
          carouselController: CarouselController(),
          items: List.generate(
            6,
            (index) => const SizedBox(
              width: 260,
              child: MyDesgin(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyDesgin extends StatelessWidget {
  const MyDesgin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(),
      ),
      child: const Center(
        child: Image(
          image: AssetImage(MyimagesAssets.onBoargig1),
        ),
      ),
    );
  }
}
