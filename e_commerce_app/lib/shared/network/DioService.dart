// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:e_commerce_app/shared/network/endPoint.dart';

class UserService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchUserData() async {
    try {
      Response response = await _dio.get(BASEURL+REGISTER);
      return response.data;
    } catch (error) {
      throw Exception('Failed to fetch user data: $error');
    }
  }
}