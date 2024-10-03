import 'package:flutter/material.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWith = screenSize.width;
    final scrennHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      height: scrennHeight,
      constraints: const BoxConstraints(maxHeight: 560.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.amber,
                  ],
                ).createShader(bounds);
              },
              //blendMode: BlendMode.srcATop,
              child: Image.asset(
                "assets/images/man_test.png",
                width: screenWith,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Hi,\nI'm Mohamed Ben Yahia\nA Flutter Developer",
              style: TextStyle(
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 190,
              //height: 10,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "get in touch",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
