// ignore_for_file: file_names

import 'package:e_commerce_app/modules/home/HomeCubit.dart';
import 'package:e_commerce_app/modules/home/HomeState.dart';
import 'package:e_commerce_app/shared/componets/DescriptionScreen.dart';
import 'package:e_commerce_app/shared/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      shrinkWrap: true,
      physics: const PageScrollPhysics(),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 335),
      itemBuilder: (context, index) => GestureDetector(
        child: MyImageModel(id: index),
        onTap: () {
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DescriptionScreen(id:index)),
            );
          debugPrint('this my index $index');
        },
      ),
    ));
  }
}

class MyImageModel extends StatelessWidget {
  final int id;
  const MyImageModel({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..containerKey.addEntries(
            Iterable.generate(10, (index) => MapEntry(index, false))),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is FavoritState,
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          //bool isFavorite = cubit.containerKey[id]!;
          //debugPrint("Id : $id" + isFavorite.toString());
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const DiscountContainer(),
                    const ImageProduct(),
                    const SizedBox(
                      height: 20,
                    ),
                    const ProductDetaille(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '24.000 €',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            cubit.isTrue = !cubit.isTrue;

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
                        ),
                      ],
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 60, top: 10),
      decoration: BoxDecoration(
          color: Colors.red[900],
          border: Border.all(),
          borderRadius: BorderRadius.circular(9)),
      child: const Text(
        ' DISCOUNT',
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class ProductDetaille extends StatelessWidget {
  const ProductDetaille({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      ' iphone 3G Sds fqs dfdsfsdfsq',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ImageProduct extends StatelessWidget {
  const ImageProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(
        MyimagesAssets.onBoargig3,
      ),
    );
  }
}
