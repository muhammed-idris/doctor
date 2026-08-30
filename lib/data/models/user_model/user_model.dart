class UserModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? image;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    final data = json ?? const <String, dynamic>{};
    return UserModel(
      id: int.tryParse('${data['id'] ?? ''}') ?? 0,
      name: '${data['name'] ?? ''}',
      email: '${data['email'] ?? ''}',
      phone: data['phone']?.toString(),
      image: data['image']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
    };
  }
}