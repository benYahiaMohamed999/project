// ignore_for_file: file_names

// ignore: camel_case_types
abstract class shopLoginState {}

class InitshopLoginState extends shopLoginState {}

class SocialLoginSuccesState extends shopLoginState {}

class SocialLoginLodingState extends shopLoginState {}

class SocialLoginErrorState extends shopLoginState {
  final String error;

  SocialLoginErrorState(this.error);
}

class IconsState extends shopLoginState {}

class SocialHomeState extends shopLoginState {}

class SocialLodingFacebookloginState extends shopLoginState {}

class SocialErrorFacebookLoginState extends shopLoginState {
  final String error;

  SocialErrorFacebookLoginState(this.error);
}

class SocialSuccessFacebookLoginState extends shopLoginState {}

class CheckBoxState extends shopLoginState {}
