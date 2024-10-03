// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tomonylist/layout/FormMony/monyFormPaid.dart';
import 'package:tomonylist/layout/FormMony/updateFormeShowBottomSheet.dart';
import 'package:tomonylist/layout/home/components/course_card.dart';
import 'package:tomonylist/layout/home/components/secondary_course_card.dart';
import 'package:tomonylist/model/database/nameTable.dart';
import 'package:tomonylist/modules/cubit/main_cubit.dart';
import 'package:tomonylist/shared/config/constants.dart';

class IncamScreen extends StatefulWidget {
  const IncamScreen({super.key});

  @override
  State<IncamScreen> createState() => _IncamScreenState();
}

class _IncamScreenState extends State<IncamScreen> {
  @override
  void initState() {
    super.initState();

    // Access the cubit and call getAllPaid
    final cubit = context.read<MainCubit>();
    cubit.initDB();
    cubit.getAllIncam(nameTable: tableIncam); // Fetch data
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final moneyController = TextEditingController();
    final descriptionController = TextEditingController();

    return BlocConsumer<MainCubit, MainState>(listener: (context, state) {
      if (state is GetDataIncamFiledState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error)),
        );
      }
    }, builder: (context, state) {
      if (state is GetDataIncamLodedState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is GetDataIncamSucessState) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showFullScreenBottomSheetIncam(
                context: context,
                dateController: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                descriptionController: descriptionController,
                formKey: formKey,
                moneyController: moneyController,
                nameTable: tableIncam,
              );
            },
            backgroundColor: const Color(0xFF9CC5FF),
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.endTop, // or any other location
          body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Incam",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CourseCard(
                      dateTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                      total: state.totalAmount.toString(),
                      title: "Incam",
                      iconSrc: "assets/icons/ios.svg",
                      color: const Color(0xFF7553F6),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: ListView.separated(
                      physics: const PageScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      shrinkWrap: true,
                      itemCount: state.transaction.length,
                      itemBuilder: (context, index) {
                        // Access the transaction map
                        var transaction = state.transaction[index];

                        // Ensure the transaction is a map and access fields correctly
                        String description =
                            transaction['description'] ?? 'No description';
                        String dateTime = transaction['dateTime'] ?? 'No date';
                        double amount = transaction['amount'] ?? 0;

                        int id = transaction['id'] ?? 0;

                        return GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ShowFullScreenBottomSheetUpdatePaid(
                                    nameTable: 'TableIncam',
                                    id: id,
                                    initialAmount: amount,
                                    initialDescription: description,
                                    dateController: dateTime,
                                  ),
                                ));
                          },
                          child: SecondaryCourseCard(
                            nameTable: tableIncam,
                            colorl: index % 2 == 0 ? bleuSiel : pink,
                            iconsSrc: index % 2 == 0 ? imageCodeAss : imageAss,
                            id: transaction['id'],
                            description: description,
                            price: amount,
                            dateController: dateTime,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return Container(
        color: Colors.amber,
      );
    });
  }
}
