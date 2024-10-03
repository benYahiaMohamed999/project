// ignore_for_file: file_names, unnecessary_null_comparison

import 'dart:io';

import 'package:e_commerce_app/modules/home/HomeCubit.dart';
import 'package:e_commerce_app/modules/home/HomeState.dart';
import 'package:e_commerce_app/shared/componets/CameraWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreeen extends StatelessWidget {
  const ProfileScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    File? selectedImage;
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //print('hello');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CameraWidget(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          maxRadius: 50,
                          child: selectedImage != null
                              ? Image.file(selectedImage)
                              : const Icon(
                                  Icons.image,
                                ), // Placeholder or some other fallback widget
                        ),
                      ),
                    ),

                    const Text(
                      'Mohamed Ben Yahia',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            MyListOfparametre(index: index),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount:
                            context.read<HomeCubit>().profileScreen.length,
                      ),
                    )
                    //ListOfScreenParms(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyListOfparametre extends StatelessWidget {
  const MyListOfparametre({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => cubit.profileScreen[index],
                  ),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(
                      image: AssetImage(
                        cubit.iconAssetsProfileList[index], //indexList
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    cubit.profileList[index],
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
