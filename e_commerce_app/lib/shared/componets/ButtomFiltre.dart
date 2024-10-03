// ignore_for_file: file_names


import 'package:e_commerce_app/modules/home/HomeCubit.dart';
import 'package:e_commerce_app/modules/home/HomeState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buttonFiltre({text, onPressed}) => TextButton(
      onPressed: onPressed,
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber,
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )),
      ),
    );

class CardItem extends StatelessWidget {
  final int id;

  const CardItem({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is FavoritState && current.index == id,
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        bool isFavorite = cubit.containerKey[id]!;
        //bool isFavorite_2 = cubit.containerKey_2[id_2]!;

        //log("Id : $id" + isFavorite.toString());
        //log("Id : $id_2" + isFavorite_2.toString());
        return Stack(
          children: [
            Container(
              width: 175,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: const Image(
                image: AssetImage(
                  'assets/images/b.jpeg',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 120,
              ),
              child: TextButton(
                onPressed: () {
                  cubit.toggelFavorite(id);
                  //cubit.toggelFavorite_2(id_2);
                },
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(isFavorite
                      ? "assets/images/heart-2.png"
                      : "assets/images/heart.png"),
                  height: 20,
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 160,
                    height: 100,
                    margin: const EdgeInsets.only(top: 140),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 150, left: 15),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('hellox'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'hellox',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('£72.00'),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.abc_outlined,
                            ),
                            const Text('(4.9)'),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
