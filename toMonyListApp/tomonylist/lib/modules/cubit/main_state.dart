part of 'main_cubit.dart';

sealed class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

final class ChangePageState extends MainState {
  final int index;
  const ChangePageState({required this.index});
  ChangePageState copyWith({int? index}) {
    return ChangePageState(index: index ?? this.index);
  }

  @override
  List<Object> get props => [index];
}

final class MainInitial extends MainState {}

final class SaveDataPaidLodedState extends MainState {}

final class SaveDataPaidSucessState extends MainState {}

final class SaveDataPaidFiledState extends MainState {
  final String error;

  const SaveDataPaidFiledState({required this.error});
  @override
  List<Object> get props => [error];
}

final class SaveDataBorrowedLodedState extends MainState {}

final class SaveDataBorrowedSucessState extends MainState {}

final class SaveDataBorrowedFiledState extends MainState {
  final String error;

  const SaveDataBorrowedFiledState({required this.error});
  @override
  List<Object> get props => [error];
}

final class SaveDataIncamLodedState extends MainState {}

final class SaveDataIncamSucessState extends MainState {}

final class SaveDataincamFiledState extends MainState {
  final String error;

  const SaveDataincamFiledState({required this.error});
  @override
  List<Object> get props => [error];
}

final class SaveDataSpentLodedState extends MainState {}

final class SaveDataSpentSucessState extends MainState {}

final class SaveDataSpentFiledState extends MainState {
  final String error;

  const SaveDataSpentFiledState({required this.error});
  @override
  List<Object> get props => [error];
}


final class GetDataPaidLodedState extends MainState {}

final class GetDataPaidSucessState extends MainState {
  final List transaction;
  final String totalAmount;

  const GetDataPaidSucessState(
      {required this.totalAmount, required this.transaction});

  @override
  List<Object> get props => [totalAmount, transaction];
}

final class GetDataPaidFiledState extends MainState {
  final String error;

  const GetDataPaidFiledState({required this.error});
}

final class GetDataBorrowedLodedState extends MainState {}

final class GetDataBorrowedSucessState extends MainState {
  final List transaction;
  final String totalAmount;

  const GetDataBorrowedSucessState(
      {required this.totalAmount, required this.transaction});

  @override
  List<Object> get props => [totalAmount, transaction];
}

final class GetDataBorrowedFiledState extends MainState {
  final String error;

  const GetDataBorrowedFiledState({required this.error});
}

final class GetDataSpentLodedState extends MainState {}

final class GetDataSpentSucessState extends MainState {
  final List transaction;
  final String totalAmount;

  const GetDataSpentSucessState(
      {required this.totalAmount, required this.transaction});

  @override
  List<Object> get props => [totalAmount, transaction];
}

final class GetDataSpentFiledState extends MainState {
  final String error;

  const GetDataSpentFiledState({required this.error});
}

final class GetDataIncamLodedState extends MainState {}

final class GetDataIncamSucessState extends MainState {
  final List transaction;
  final String totalAmount;

  const GetDataIncamSucessState(
      {required this.totalAmount, required this.transaction});

  @override
  List<Object> get props => [totalAmount, transaction];
}

final class GetDataIncamFiledState extends MainState {
  final String error;

  const GetDataIncamFiledState({required this.error});
}

final class TransactionDeleteLoading extends MainState {}

final class TransactionDeleteSuccess extends MainState {
  final int res;
  const TransactionDeleteSuccess({required this.res});
}

final class TransactionDeleteError extends MainState {
  final String error;
  const TransactionDeleteError({required this.error});
}

final class GetAmountTotalSucess extends MainState {
  final double totalAmount;
  final List transaction;
  const GetAmountTotalSucess(
      {required this.totalAmount, required this.transaction});

  @override
  List<Object> get props => [totalAmount, transaction];
}

final class GetAmountTotalLoaded extends MainState {}

final class GetAmountTotalError extends MainState {
  final String error;

  const GetAmountTotalError({required this.error});
}

final class UpdateDataLoadedState extends MainState {}

final class UpdateDataSuccessState extends MainState {
  final int? res;
  const UpdateDataSuccessState({required this.res});
}

final class UpdateDataErrorState extends MainState {
  final String error;
  const UpdateDataErrorState({required this.error});
}
