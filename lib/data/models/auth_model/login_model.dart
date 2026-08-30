import '../user_model/user_model.dart';

class AuthModel {
  final String token;
  final UserModel user;

  AuthModel({
    required this.token,
    required this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];
    final payload = rawData is Map
        ? Map<String, dynamic>.from(rawData)
        : json;
    final rawUser = payload['user'];

    return AuthModel(
      token: '${payload['token'] ?? payload['access_token'] ?? ''}',
      user: UserModel.fromJson(
        rawUser is Map ? Map<String, dynamic>.from(rawUser) : null,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user.toJson(),
    };
  }
}