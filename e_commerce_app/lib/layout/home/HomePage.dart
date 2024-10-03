// ignore_for_file: file_names

import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/home/HomeCubit.dart';
import 'package:e_commerce_app/modules/home/HomeState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
              body: cubit.screen[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                fixedColor: Colors.pinkAccent[400],
                type: BottomNavigationBarType.fixed,
                enableFeedback: true,
                mouseCursor: MouseCursor.defer,
                useLegacyColorScheme: true,
                onTap: (value) {
                  cubit.currentIndex = value;
                  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                  cubit.emit(CurrentState(index: cubit.currentIndex));
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home),
                    label: S.of(context).Home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.card_travel_outlined),
                    label: S.of(context).Categorie,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.card_travel),
                    label: S.of(context).cart,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.favorite),
                    label: S.of(context).Favorite,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: S.of(context).Settings,
                  ),
                ],
              ));
        },
      ),
    );
  }
}
