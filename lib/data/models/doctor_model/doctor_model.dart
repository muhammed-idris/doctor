import 'doctor_specialization.dart';

class GovernorateModel {
  final int id;
  final String name;

  GovernorateModel({
    required this.id,
    required this.name,
  });

  factory GovernorateModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return GovernorateModel(id: 0, name: '');
    }
    return GovernorateModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

class CityModel {
  final int id;
  final String name;
  final GovernorateModel governorate;

  CityModel({
    required this.id,
    required this.name,
    required this.governorate,
  });

  factory CityModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return CityModel(
        id: 0,
        name: '',
        governorate: GovernorateModel(id: 0, name: ''),
      );
    }
    return CityModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      // Note: API key is spelled "governrate" (typo in backend), not "governorate".
      governorate: GovernorateModel.fromJson(json['governrate']),
    );
  }
}

class DoctorModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final SpecializationModel specialization;
  final CityModel city;
  final num appointPrice;
  final String startTime;
  final String endTime;

  DoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.city,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      photo: json['photo'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      description: json['description'] ?? '',
      degree: json['degree'] ?? '',
      specialization: SpecializationModel.fromJson(json['specialization']),
      city: CityModel.fromJson(json['city']),
      appointPrice: json['appoint_price'] ?? 0,
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'photo': photo,
      'gender': gender,
      'address': address,
      'description': description,
      'degree': degree,
      'specialization': specialization.toJson(),
      'appoint_price': appointPrice,
      'start_time': startTime,
      'end_time': endTime,
    };
  }
}