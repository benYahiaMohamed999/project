// ignore_for_file: file_names

import 'package:e_commerce_app/modules/home/HomeCubit.dart';
import 'package:e_commerce_app/modules/home/HomeState.dart';
import 'package:e_commerce_app/shared/componets/MyCarrouselWidgettop.dart';
import 'package:e_commerce_app/shared/componets/MyCarrousell.dart';
import 'package:e_commerce_app/shared/componets/mYGridView.dart';
import 'package:e_commerce_app/shared/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:e_commerce_app/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          //var cubit = HomeCubit.get(context);
          return SafeArea(
            child: Scaffold(
              appBar: myAppbar(context),
              body: ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        MyCarrousellWidgetTop(
                            sizingInformation: sizingInformation),
                        MySizedBoxHeigth(sizingInformation: sizingInformation),
                        Text(
                          S.of(context).NamedApplicat, //another Text categories
                        ),

                        const MyCarrousel(),
                        //MySizedBoxHeigth(sizingInformation: sizingInformation),
                        Text(
                          S.of(context).Favorite,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ), //another Text newProdact
                        ),
                        //MySizedBoxHeigth(sizingInformation: sizingInformation),

                        const MyGridView(),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class MySizedBoxHeigth extends StatelessWidget {
  const MySizedBoxHeigth({super.key, required this.sizingInformation});
  final SizingInformation sizingInformation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizingInformation.deviceScreenType == DeviceScreenType.mobile
          ? 10
          : 20,
    );
  }
}
