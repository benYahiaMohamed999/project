import 'dart:developer';


import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomonylist/layout/BorrowedScreen/BorrowedScreen.dart';
import 'package:tomonylist/layout/IncamScreen/IncamScreen.dart';
import 'package:tomonylist/layout/PaidScreen.dart/PaidScreen.dart';
import 'package:tomonylist/layout/SpentScreen/SpentScreen.dart';
import 'package:tomonylist/model/Tronsaction/TransactionModel.dart';
import 'package:tomonylist/model/database/databaseSqlLite.dart';
import 'package:tomonylist/model/database/nameTable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  Widget? selectPage(int index, context) {
    log(index.toString());
    //emit(ChangePageState(index: index));
    switch (index) {
      case 0:
        return const PaidScreen();

      case 1:
        return const BorrowedScreen();

      case 2:
        return const SpentScreen();

      case 3:
        return const IncamScreen();

      default:
        return const PaidScreen();
    }
  }

  List<Widget> screens = const [
    PaidScreen(),
    BorrowedScreen(),
    SpentScreen(),
    IncamScreen(),
  ];

  Future<void> initDB() async {
    await DataSqlLiteHelper().intDB();
  }

  Future<int?> insertPaidData(PaidMonyModel transaction) async {
    try {
      emit(SaveDataPaidLodedState());

      var res = await DataSqlLiteHelper().saveTaransaction(
        transaction: transaction,
        nameTable: tablePaid,
      );
      emit(SaveDataPaidSucessState());
      return res;
    } catch (e) {
      emit(SaveDataPaidFiledState(error: e.toString()));
    }
    return null;
  }

  Future<int?> insertBorrowedData(PaidMonyModel transaction) async {
    try {
      emit(SaveDataBorrowedLodedState());

      var res = await DataSqlLiteHelper().saveTaransaction(
        transaction: transaction,
        nameTable: tableBorrowed,
      );
      emit(SaveDataBorrowedSucessState());
      return res;
    } catch (e) {
      emit(SaveDataBorrowedFiledState(error: e.toString()));
    }
    return null;
  }

  Future<int?> insertSpentData(PaidMonyModel transaction) async {
    try {
      emit(SaveDataSpentLodedState());

      var res = await DataSqlLiteHelper().saveTaransaction(
        transaction: transaction,
        nameTable: tableSpent,
      );
      emit(SaveDataSpentSucessState());
      return res;
    } catch (e) {
      emit(SaveDataSpentFiledState(error: e.toString()));
    }
    return null;
  }

  Future<int?> insertIncamData(PaidMonyModel transaction) async {
    try {
      emit(SaveDataIncamLodedState());

      var res = await DataSqlLiteHelper().saveTaransaction(
        transaction: transaction,
        nameTable: tableIncam,
      );
      emit(SaveDataIncamSucessState());
      return res;
    } catch (e) {
      emit(SaveDataSpentFiledState(error: e.toString()));
    }
    return null;
  }

  Future<int?> updateData(
      {required PaidMonyModel paidModel, required String nameTable}) async {
    try {
      emit(UpdateDataLoadedState());
      var res = await DataSqlLiteHelper().updateTransaction(
        transaction: paidModel,
        columnAmount_: columnAmount,
        columnDate_: columnDateTime,
        columnDescription_: columnDescription,
        nameTable: nameTable,
      );
      emit(UpdateDataSuccessState(res: res));
      return res;
    } catch (e) {
      emit(UpdateDataErrorState(error: e.toString()));
    }
    return null;
  }

  Future<List?> getAllPaid({required String nameTable}) async {
    try {
      emit(GetDataPaidLodedState());
      var listTran =
          await DataSqlLiteHelper().getALlTransaction(nameTable: nameTable);
      var totalPaid =
          await DataSqlLiteHelper().getTotalPaid(nameTable: tablePaid);

      // ignore: unnecessary_null_comparison
      if (listTran != null) {
        emit(GetDataPaidSucessState(
            transaction: listTran, totalAmount: totalPaid.toString()));
      } else {
        throw Exception("Received null data");
      }
    } catch (e) {
      emit(GetDataPaidFiledState(error: e.toString()));
    }
    return null;
  }

  Future<List?> getAllBorrowed({required String nameTable}) async {
    try {
      emit(GetDataBorrowedLodedState());
      var listTran =
          await DataSqlLiteHelper().getALlTransaction(nameTable: tableBorrowed);
      var totalPaid =
          await DataSqlLiteHelper().getTotalBorrowed(nameTable: tableBorrowed);

      // ignore: unnecessary_null_comparison
      if (listTran != null) {
        emit(GetDataBorrowedSucessState(
            transaction: listTran, totalAmount: totalPaid.toString()));
      } else {
        throw Exception("Received null data");
      }
    } catch (e) {
      emit(GetDataBorrowedFiledState(error: e.toString()));
    }
    return null;
  }

  Future<List?> getAllSpent({required String nameTable}) async {
    try {
      emit(GetDataSpentLodedState());
      var listTran =
          await DataSqlLiteHelper().getALlTransaction(nameTable: tableSpent);
      var totalPaid =
          await DataSqlLiteHelper().getTotalBorrowed(nameTable: tableSpent);

      // ignore: unnecessary_null_comparison
      if (listTran != null) {
        emit(GetDataSpentSucessState(
            transaction: listTran, totalAmount: totalPaid.toString()));
      } else {
        throw Exception("Received null data");
      }
    } catch (e) {
      emit(GetDataSpentFiledState(error: e.toString()));
    }
    return null;
  }

  Future<List?> getAllIncam({required String nameTable}) async {
    try {
      emit(GetDataIncamLodedState());
      var listTran =
          await DataSqlLiteHelper().getALlTransaction(nameTable: tableIncam);
      var totalPaid =
          await DataSqlLiteHelper().getTotalBorrowed(nameTable: tableIncam);

      // ignore: unnecessary_null_comparison
      if (listTran != null) {
        emit(GetDataIncamSucessState(
            transaction: listTran, totalAmount: totalPaid.toString()));
      } else {
        throw Exception("Received null data");
      }
    } catch (e) {
      emit(GetDataIncamFiledState(error: e.toString()));
    }
    return null;
  }

  Future<int?> deletePaidId(
      {required int id, required String nameTable}) async {
    try {
      emit(TransactionDeleteLoading());
      var res = await DataSqlLiteHelper().deleteTransaction(
        id: id,
        columnIdName: columnId,
        nameTable: nameTable,
      );
      emit(TransactionDeleteSuccess(res: res));
      return res;
    } catch (e) {
      emit(TransactionDeleteError(error: e.toString()));
    }
    return null;
  }


}
