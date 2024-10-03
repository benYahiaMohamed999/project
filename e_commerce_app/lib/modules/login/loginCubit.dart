// ignore_for_file: file_names

import 'package:e_commerce_app/modules/login/loginState.dart';
import 'package:e_commerce_app/shared/network/DioService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<shopLoginState> {
  ShopLoginCubit() : super(InitshopLoginState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  bool isPassw = true;
  void iconPassword() {
    isPassw = !isPassw;
    emit(IconsState());
  }

  bool isChecked = true;
  void check() {
    emit(CheckBoxState());
  }

  void emitHome() {
    emit(SocialHomeState());
  }

  // ignore: unused_field
  final UserService _userService = UserService();

  

  
}
