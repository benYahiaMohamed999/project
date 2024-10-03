// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomonylist/model/Tronsaction/TransactionModel.dart';
import 'package:tomonylist/model/database/nameTable.dart';
import 'package:tomonylist/modules/cubit/main_cubit.dart';

class ShowFullScreenBottomSheetUpdatePaid extends StatelessWidget {
  // Controllers to manage the form fields
  final TextEditingController moneyController;
  final TextEditingController descriptionController;
  final int id;
  final String dateController;
  final String nameTable;

  ShowFullScreenBottomSheetUpdatePaid({
    super.key,
    required this.nameTable,
    required double initialAmount,
    required String initialDescription,
    required this.id,
    required this.dateController,
  })  : moneyController = TextEditingController(text: initialAmount.toString()),
        descriptionController =
            TextEditingController(text: initialDescription.toString());

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if (state is UpdateDataErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        bool isLoading = state is UpdateDataLoadedState; // Loading state
        bool isSuccess = state is UpdateDataSuccessState; // Success state
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: moneyController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        labelText: 'Money',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (nameTable == "TablePaid") {
                              context
                                  .read<MainCubit>()
                                  .getAllPaid(nameTable: tablePaid);
                            } else if (nameTable == "TableBorrowed") {
                              context
                                  .read<MainCubit>()
                                  .getAllBorrowed(nameTable: tableBorrowed);
                            } else if (nameTable == "TableSpent") {
                              context
                                  .read<MainCubit>()
                                  .getAllSpent(nameTable: tableSpent);
                            } else if (nameTable == "TableIncam") {
                              context
                                  .read<MainCubit>()
                                  .getAllIncam(nameTable: tableIncam);
                            }

                            Navigator.pop(context);
                          },
                          child: const Text("cancel"),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                PaidMonyModel paidModel = PaidMonyModel(
                                  dateTime: dateController,
                                  id: id,
                                  amount: double.parse(moneyController.text),
                                  description: descriptionController.text,
                                );

                                if (nameTable == "TablePaid") {
                                  await context.read<MainCubit>().updateData(
                                        nameTable: 'TablePaid',
                                        paidModel: paidModel,
                                      );

                                  if (isSuccess) {
                                    context
                                        .read<MainCubit>()
                                        .getAllPaid(nameTable: nameTable);

                                    Navigator.pop(context);
                                  }
                                } else if (nameTable == "TableBorrowed") {
                                  await context.read<MainCubit>().updateData(
                                        nameTable: 'TableBorrowed',
                                        paidModel: paidModel,
                                      );

                                  if (isSuccess) {
                                    context
                                        .read<MainCubit>()
                                        .getAllBorrowed(nameTable: nameTable);

                                    Navigator.pop(context);
                                  }
                                } else if (nameTable == "TableIncam") {
                                  await context.read<MainCubit>().updateData(
                                        nameTable: 'TableIncam',
                                        paidModel: paidModel,
                                      );

                                  if (isSuccess) {
                                    context
                                        .read<MainCubit>()
                                        .getAllIncam(nameTable: nameTable);

                                    Navigator.pop(context);
                                  }
                                } else if (nameTable == "TableSpent") {
                                  await context.read<MainCubit>().updateData(
                                        nameTable: 'TableSpent',
                                        paidModel: paidModel,
                                      );

                                  if (isSuccess) {
                                    context
                                        .read<MainCubit>()
                                        .getAllSpent(nameTable: nameTable);

                                    Navigator.pop(context);
                                  }
                                }
                              } catch (e) {
                                log("Failed to add transaction Paid: $e");
                              }
                            }
                          },
                          child: isLoading
                              ? const CircularProgressIndicator() // Show loading indicator
                              : const Text('Save'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
