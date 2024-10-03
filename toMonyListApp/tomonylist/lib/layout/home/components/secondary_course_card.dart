// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tomonylist/modules/cubit/main_cubit.dart';

class SecondaryCourseCard extends StatelessWidget {
  const SecondaryCourseCard(
      {key,
      required this.iconsSrc,
      required this.colorl,
      required this.description,
      required this.id,
      required this.price,
      required this.nameTable,
      required this.dateController})
      : super(key: key);

  final String iconsSrc;
  final int id;
  final String nameTable;
  final Color colorl;
  final double price;
  final String description;
  final String dateController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if (state is TransactionDeleteError) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Eroro")),
          );
        }

        if (state is TransactionDeleteLoading) {
          // Show success message or handle success
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Transaction deleted: Loading')),
          );
        }
        if (state is TransactionDeleteSuccess) {
          // Show success message or handle success
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Transaction deleted: Sucess')),
          );
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
              color: colorl,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${NumberFormat("###.000", "en_US").format(price).replaceAll('.', ',')} €",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      dateController,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
                child: VerticalDivider(
                  // thickness: 5,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                child: SvgPicture.asset(iconsSrc),
                onTap: () {
                  context
                      .read<MainCubit>()
                      .deletePaidId(id: id, nameTable: nameTable);

                  if (nameTable == "TableBorrowed") {
                    context.read<MainCubit>().getAllBorrowed(
                          nameTable: nameTable,
                        );

                  }else if(nameTable=="TablePaid"){

                    context.read<MainCubit>().getAllPaid(
                          nameTable: nameTable,
                        );

                  }
                  else if(nameTable=="TableSpent"){

                    context.read<MainCubit>().getAllSpent(
                          nameTable: nameTable,
                        );

                  }else if(nameTable=="TableIncam"){

                    context.read<MainCubit>().getAllIncam(
                          nameTable: nameTable,
                        );

                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
