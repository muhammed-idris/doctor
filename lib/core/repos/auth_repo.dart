import 'package:doctor/data/models/auth_model/login_model.dart';

import '../api/api_url.dart';
import '../api/dio_client.dart';

class AuthRepository {
  final DioClient dioClient;

  AuthRepository(this.dioClient);

  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    final response = await dioClient.post(
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
    final response = await dioClient.post(
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
    await dioClient.post(ApiUrl.logoutUrl);
  }
}