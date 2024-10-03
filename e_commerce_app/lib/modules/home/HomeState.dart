// ignore_for_file: file_names

import 'dart:io';

import 'package:equatable/equatable.dart';


abstract class HomeState extends Equatable {}

class InitLoginState extends HomeState {
  @override
  List<Object?> get props => [];
}

class CurrentState extends HomeState {
  final int index;

  CurrentState({required this.index});

  @override
  List<Object?> get props => [index];
}

class BottomSheetState extends HomeState {
  final int state;

  BottomSheetState({required this.state});

  @override
  List<Object?> get props => [state];
}


class FavoritState extends HomeState {
  final int index;
  final bool state;

  FavoritState({required this.index, required this.state});

  @override
  List<Object?> get props => [index, state];
}

class FavoritStateDescription extends HomeState {
  final int index;
  final bool state;

  FavoritStateDescription({required this.index, required this.state});

  @override
  
  List<Object?> get props => [index, state];
}

class RebuildApplicationLocalization extends HomeState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadIconFavorite extends HomeState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ImageEmpty extends HomeState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class QuantiterChange extends HomeState {
  final int quantite;

  QuantiterChange({required this.quantite});
  @override
  List<Object?> get props => [quantite];
}

class CartState extends HomeState {
  @override
  List<Object?> get props => [];
}

class ImageLoaded extends HomeState {
  final File file;

  ImageLoaded(this.file);

  @override
  List<Object?> get props => [file];
}

class ImageError extends HomeState {
  final String message;

  ImageError(this.message);

  @override
  List<Object?> get props => [message];
}
