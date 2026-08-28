
class RegisterRequestModel {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String password;
  final String passwordConfirmation;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}