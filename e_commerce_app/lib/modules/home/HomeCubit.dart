// ignore_for_file: file_names

import 'dart:developer';

import 'package:e_commerce_app/layout/FavoriteScreen/FavoriteScreen.dart';
import 'package:e_commerce_app/layout/ProfileScreeen/Language.dart';
import 'package:e_commerce_app/layout/ProfileScreeen/Logout.dart';
import 'package:e_commerce_app/layout/ProfileScreeen/MyDetails.dart';
import 'package:e_commerce_app/layout/ProfileScreeen/MyOrder.dart';
import 'package:e_commerce_app/layout/ProfileScreeen/PaymentMethod.dart';
import 'package:e_commerce_app/layout/ProfileScreeen/ProfileScreeen.dart';
import 'package:e_commerce_app/layout/ProfileScreeen/SetReminder.dart';
import 'package:e_commerce_app/layout/ProfileScreeen/Setting.dart';
import 'package:e_commerce_app/layout/ProfileScreeen/Support.dart';
import 'package:e_commerce_app/layout/CategorieScreen/CategorieScreen.dart';
import 'package:e_commerce_app/layout/cart/CartScreen.dart';
import 'package:e_commerce_app/layout/homeScreen/HomeScreen.dart';
import 'package:e_commerce_app/modules/home/HomeState.dart';
import 'package:e_commerce_app/shared/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


enum BottomSheetState { hidden, showing }

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitLoginState());

  static HomeCubit get(context) => BlocProvider.of(context);

  void showBottomSheet() => emit(BottomSheetState.showing as HomeState);

  void hideBottomSheet() => emit(BottomSheetState.hidden as HomeState);
  final formKey = GlobalKey<FormState>();

  var currentIndex = 0;

  List<Widget> screen = [
    const HomeScreen(),
    const CategorieScreen(),
    const CartScreen(),
    const Favorite(),
    const ProfileScreeen(),
  ];

  int loadPage(currentIndex) {
    emit(CurrentState(index: currentIndex));
    return currentIndex;
  }

  List<String> profileList = [
    'My Order',
    'Notifications',
    'My Details',
    'Payment Methods',
    'Settings',
    'Support',
    'Language',
    'Log-out',
  ];
  List<String> iconAssetsProfileList = [
    MyimagesAssets.myOrder,
    MyimagesAssets.setReminder,
    MyimagesAssets.about,
    MyimagesAssets.setting,
    MyimagesAssets.setting,
    MyimagesAssets.support,
    MyimagesAssets.language,
    MyimagesAssets.logOut,
  ];

  List<Widget> profileScreen = [
    const MyOrder(),
    const SetReminder(),
    MyDetails(),
    PaymentMethod(),
    Setting(),
    const Support(),
    const Language(),
    const Logout(),
  ];
  int quantite = 1;
  void addQuantiter() {
    quantite += 1;
    emit(QuantiterChange(quantite: quantite));
  }

  void minusQuantiter() {
    quantite += -1;
    if (quantite <= 1) {
      quantite = 1;
    }
    emit(QuantiterChange(quantite: quantite));
  }

  bool isDescription = false;

  Map<int, bool> containerDescriptionKey = {};

  void toggelFavoriteDescription(
    int key,
  ) {
    final state = containerDescriptionKey[key];
    log(key.toString());
    containerDescriptionKey[key] = !state!;
    emit(FavoritStateDescription(index: key, state: state));
  }

  bool isTrue = false;

  Map<int, bool> containerKey = {};

  void toggelFavorite(
    int key,
  ) {
    final state = containerKey[key];
    containerKey[key] = !state!;
    emit(FavoritState(index: key, state: state));
  }

  //Future<void> pickImage() async {
  //  try {
  // final picker = ImagePicker();
  //  final pickedFile = await picker.pickImage(source: ImageSource.camera);

  //  if (pickedFile != null) {
  //   emit(ImageLoaded(File(pickedFile.path)));
  //  }
  //  } catch (e) {
  //     emit(ImageError("Error picking image: $e"));
  //  }
  // }

  
}
