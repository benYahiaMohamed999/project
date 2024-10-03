// ignore_for_file: file_names

import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/layout/home/HomePage.dart';
import 'package:e_commerce_app/modules/home/HomeCubit.dart';
import 'package:e_commerce_app/modules/home/HomeState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          //var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).language),
            ),
            body: Column(
              children: [
                ListTile(
                  title: const Text('english'),
                  onTap: () {
                    Locale locale = const Locale('en');
                    S.load(locale);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('العربية'),
                  onTap: () {
                    Locale locale = const Locale('ar');
                    S.load(locale);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('francais'),
                  onTap: () {
                    Locale locale = const Locale('fr');
                    S.load(locale);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
