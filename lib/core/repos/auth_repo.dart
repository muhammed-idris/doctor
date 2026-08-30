import 'package:dio/dio.dart';
import 'package:doctor/data/models/auth_model/login_model.dart';

import '../api/api_url.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository(this.dio);

  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      ApiUrl.loginUrl,
      data: {
        'email': email,
        'password': password,
      },
    );

    return AuthModel.fromJson(response.data);
  }

  Future<AuthModel> register({
    required String number,
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      ApiUrl.registerUrl,
      data: {
        'number': number,
        'email': email,
        'password': password,
      },
    );

    return AuthModel.fromJson(response.data);
  }

  Future<void> logout() async {
    await dio.post(ApiUrl.logoutUrl);
  }
}