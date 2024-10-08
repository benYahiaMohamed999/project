// ignore_for_file: file_names


import 'package:e_commerce_app/layout/LoginScreen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.body, required this.image, required this.title});
}

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      body: 'on board 1 Body',
      image: 'assets/images/b.jpeg',
      title: 'on board 1 Title',
    ),
    BoardingModel(
      body: 'on board 2 Body',
      image: 'assets/images/b2.jpeg',
      title: 'on board 2 Title',
    ),
    BoardingModel(
      body: 'on board 3 Body',
      image: 'assets/images/b3.jpeg',
      title: 'on board 3 Title',
    ),
  ];

  var boardingController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            child: const Text(
              'SKIP',
              style: TextStyle(
                color: Colors.cyan,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardingController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  if (index == boarding.length-1) {
                    
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }

                  
                },
                itemBuilder: (context, index) =>
                    buildBoardingItems(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                smoothIndicator(),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                    } else {
                      boardingController.nextPage(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.linearToEaseOut,
                      );
                    }
                    
                    
                  
                  },
                  backgroundColor: Colors.cyan,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget smoothIndicator() {
    return SmoothPageIndicator(
      controller: boardingController,
      effect: const ExpandingDotsEffect(
        dotColor: Colors.grey,
        activeDotColor: Colors.cyan,
        dotHeight: 10,
        expansionFactor: 4,
        dotWidth: 10,
        spacing: 5,
      ),
      count: boarding.length,
    );
  }

  Widget buildBoardingItems(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image(
                image: AssetImage(model.image),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              model.title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Center(
            child: Text(
              model.body,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
}
