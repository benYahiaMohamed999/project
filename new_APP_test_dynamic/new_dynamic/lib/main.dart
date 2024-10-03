// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_dynamic/module/cubit/test_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Move Container Example'),
        ),
        body: const MoveContainerExemple(),
      ),
    );
  }
}

class MoveContainerExemple extends StatelessWidget {
  const MoveContainerExemple({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestCubit(),
      child: BlocBuilder<TestCubit, TestState>(
        builder: (context, state) {
          return Stack(
            children: [
              Center(
                child: GestureDetector(
                  onPanUpdate: (details) {
                    context.read<TestCubit>().changePosition(details);
                    log(details.delta.toString());
                  },
                  child: Transform.translate(
                    offset: context.read<TestCubit>().position,
                    transformHitTests: true,
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.lightBlue,
                      child: const Center(
                        child: Text(
                          'Move Me!',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

