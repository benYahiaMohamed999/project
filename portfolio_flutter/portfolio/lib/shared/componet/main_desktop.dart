import 'package:flutter/material.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWith = screenSize.width;
    final scrennHeght = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: scrennHeght / 1.2,
      constraints: const BoxConstraints(maxHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                height: 15,
              ),
              SizedBox(
                width: 230,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "get in touch",
                  ),
                ),
              )
            ],
          ),
          Image.asset(
            "assets/images/man_test.png",
            height: screenWith / 2,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
