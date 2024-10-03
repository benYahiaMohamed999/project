import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomonylist/model/Tronsaction/TransactionModel.dart';
import 'package:tomonylist/model/database/nameTable.dart';
import 'package:tomonylist/modules/cubit/main_cubit.dart';

void showFullScreenBottomSheetPaid({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController moneyController,
  required TextEditingController descriptionController,
  required String dateController,
  required String nameTable,
}) {
  // Format the DateTime

  showModalBottomSheet(
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: 400,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: moneyController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Money',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
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
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  dateController, // Updated line
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        context.read<MainCubit>().insertPaidData(
                              PaidMonyModel(
                                amount: double.parse(moneyController.text),
                                dateTime: dateController,
                                description: descriptionController.text,
                              ),
                            );
                        // ignore: use_build_context_synchronously
                        context
                            .read<MainCubit>()
                            .getAllPaid(nameTable: tablePaid);

                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      } catch (e) {
                        log("Failed to add transaction Paid: $e");
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void showFullScreenBottomSheetBorrowed({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController moneyController,
  required TextEditingController descriptionController,
  required String dateController,
  required String nameTable,
}) {
  // Format the DateTime

  showModalBottomSheet(
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: 400,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: moneyController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Money',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
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
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  dateController, // Updated line
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        context.read<MainCubit>().insertBorrowedData(
                              PaidMonyModel(
                                amount: double.parse(moneyController.text),
                                dateTime: dateController,
                                description: descriptionController.text,
                              ),
                            );

                        // ignore: use_build_context_synchronously
                        context
                            .read<MainCubit>()
                            .getAllBorrowed(nameTable: tableBorrowed);

                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      } catch (e) {
                        log("Failed to add transaction Paid: $e");
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void showFullScreenBottomSheetSpent({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController moneyController,
  required TextEditingController descriptionController,
  required String dateController,
  required String nameTable,
}) {
  // Format the DateTime

  showModalBottomSheet(
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: 400,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: moneyController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Money',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
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
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  dateController, // Updated line
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        context.read<MainCubit>().insertSpentData(
                              PaidMonyModel(
                                amount: double.parse(moneyController.text),
                                dateTime: dateController,
                                description: descriptionController.text,
                              ),
                            );
                        context
                            .read<MainCubit>()
                            .getAllSpent(nameTable: nameTable);

                        Navigator.pop(context);
                      } catch (e) {
                        log("Failed to add transaction Paid: $e");
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void showFullScreenBottomSheetIncam({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController moneyController,
  required TextEditingController descriptionController,
  required String dateController,
  required String nameTable,
}) {
  // Format the DateTime

  showModalBottomSheet(
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: 400,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: moneyController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Money',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
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
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  dateController, // Updated line
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        context.read<MainCubit>().insertIncamData(
                              PaidMonyModel(
                                amount: double.parse(moneyController.text),
                                dateTime: dateController,
                                description: descriptionController.text,
                              ),
                            );
                        // ignore: use_build_context_synchronously
                        context
                            .read<MainCubit>()
                            .getAllIncam(nameTable: tableIncam);

                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      } catch (e) {
                        log("Failed to add transaction Paid: $e");
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
