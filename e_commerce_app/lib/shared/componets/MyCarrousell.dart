// ignore_for_file: file_names

import 'package:e_commerce_app/shared/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class MyCarrousel extends StatelessWidget {
  const MyCarrousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            debugPrint(
              'hello',
            );
          },
          child: InfiniteCarousel.builder(
            itemCount: 30,
            itemExtent: 120,

            center: false,
            //anchor: 0.0,
            physics: const PageScrollPhysics(),
            scrollBehavior: const ScrollBehavior(),
            //velocityFactor: 0.2,

            onIndexChanged: (index) {
              //debugPrint(index.toString()); affiche avec 3 item
            },
            axisDirection: Axis.horizontal,
            loop: false,
            
            itemBuilder: (context, itemIndex, realIndex) {
              return const MyDisigneImageMode(); //list of Categorie,)
            },
          ),
        ),
      ),
    );
  }
}

class MyDisigneImageMode extends StatelessWidget {
  const MyDisigneImageMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 20,
      ),
      child: Center(
          child: Stack(
        clipBehavior: Clip.antiAlias,
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  MyimagesAssets.onBoargig1,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 130),
            child: const Text(
              'data',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
