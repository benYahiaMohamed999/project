// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomonylist/layout/BorrowedScreen/BorrowedScreen.dart';
import 'package:tomonylist/layout/IncamScreen/IncamScreen.dart';
import 'package:tomonylist/layout/PaidScreen.dart/PaidScreen.dart';
import 'package:tomonylist/layout/SpentScreen/SpentScreen.dart';
import 'package:tomonylist/layout/entry/entry_point.dart';
import 'package:tomonylist/layout/on_boardibg/on_boarding_screen.dart';
import 'package:tomonylist/modules/cubit/main_cubit.dart';
import 'package:tomonylist/shared/bloc_Observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/onboarding',
        routes: {
          '/onboarding': (context) => const OnbodingScreen(),
          '/PaidScreen': (context) => const PaidScreen(),
          '/BorrowedScreen': (context) => const BorrowedScreen(),
          '/SpentScreen': (context) => const SpentScreen(),
          '/IncamScreen': (context) => const IncamScreen(),
          '/EntryPoint': (context) => const EntryPoint()
        },

        // home: const OnbodingScreen(),
      ),
    );
  }
}
