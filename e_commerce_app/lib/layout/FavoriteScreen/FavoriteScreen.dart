// ignore_for_file: file_names

import 'package:e_commerce_app/modules/home/HomeCubit.dart';
import 'package:e_commerce_app/modules/home/HomeState.dart';
import 'package:e_commerce_app/shared/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Expanded(
              flex: 7,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => MyArticleDesgn(id: index),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: 10,
              ),
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {},
                child: ClipRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "Go to Checkout",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class MyArticleDesgn extends StatelessWidget {
  const MyArticleDesgn({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..containerKey.addEntries(
            Iterable.generate(10, (index) => MapEntry(index, false))),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);

          return Row(
            children: [
              Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20)),
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    MyimagesAssets.onBoargig1,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 80),
                    child: const Text(
                      'name Of Prodwit',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text('39900 €'),
                      const SizedBox(
                        width: 100,
                      ),
                      IconButton(
                        onPressed: () {
                          cubit.isTrue = !cubit.isTrue;
                          //log(cubit.containerKey.toString());
                          cubit.toggelFavorite(id);
                        },
                        icon: cubit.isTrue
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite,
                                color: Colors.grey[500],
                              ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
