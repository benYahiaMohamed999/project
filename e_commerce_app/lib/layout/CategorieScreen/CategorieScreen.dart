// ignore_for_file: file_names

import 'package:e_commerce_app/layout/ShowCategorie/ShowCategorie.dart';
import 'package:e_commerce_app/modules/home/HomeCubit.dart';
import 'package:e_commerce_app/modules/home/HomeState.dart';
import 'package:e_commerce_app/shared/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            //print('this is my id $index');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ShowCategorieScreen(id: index),
              ),
            );
          },
          child: MyArticleDesgn(id: index),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: 6,
      )),
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
          //final cubit = HomeCubit.get(context);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'name Of Prodwit',
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Icon(Icons.arrow_forward_ios_sharp)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
