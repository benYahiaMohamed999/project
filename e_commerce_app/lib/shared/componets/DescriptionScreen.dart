// ignore_for_file: file_names

import 'dart:developer';

import 'package:e_commerce_app/modules/home/HomeCubit.dart';
import 'package:e_commerce_app/modules/home/HomeState.dart';
import 'package:e_commerce_app/shared/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({
    super.key,
    required this.id,
  });
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..containerDescriptionKey.addEntries(
            Iterable.generate(10, (index) => MapEntry(index, false))),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: const [Icon(Icons.abc)],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: const Image(
                        image: AssetImage(
                          MyimagesAssets.onBoargig1,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "data",
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            cubit.isDescription = !cubit.isDescription;

                            cubit.toggelFavoriteDescription(id);
                          },
                          icon: cubit.isDescription
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: Colors.grey[500],
                                ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 310),
                      child: const Text(
                        "1 kg,Price",
                        style: TextStyle(),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              cubit.addQuantiter();
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                            )),
                        Text(
                          cubit.quantite.toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                        IconButton(
                            onPressed: () {
                              cubit.minusQuantiter();
                            },
                            icon: const Icon(
                              Icons.remove,
                              size: 30,
                            )),
                        const Spacer(),
                        const Text(
                          "£12.9",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Product Details",
                          style: TextStyle(fontSize: 20),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_circle_right)),
                      ],
                    ),
                    const Text("MY description"),
                    Row(
                      children: [
                        const Text("Nutiration"),
                        const Spacer(),
                        const Text("10gr"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios_outlined))
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Review"),
                        const Spacer(),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            log(rating.toString());
                          },
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Add to basket",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
