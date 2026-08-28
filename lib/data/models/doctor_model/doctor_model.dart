
import '../location_model/city_model.dart';
import 'doctor_specialization.dart';

class DoctorModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? photo;
  final String? gender;
  final String? address;
  final String? description;
  final String? degree;
  final SpecializationModel? specialization;
  final CityModel? city;
  final num appointPrice;
  final String? startTime;
  final String? endTime;

  DoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    required this.appointPrice,
    this.startTime,
    this.endTime,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      photo: json['photo'],
      gender: json['gender'],
      address: json['address'],
      description: json['description'],
      degree: json['degree'],
      specialization: json['specialization'] != null
          ? SpecializationModel.fromJson(json['specialization'])
          : null,
      city: json['city'] != null ? CityModel.fromJson(json['city']) : null,
      appointPrice: json['appoint_price'] ?? 0,
      startTime: json['start_time'],
      endTime: json['end_time'],
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
      'specialization': specialization?.toJson(),
      'city': city?.toJson(),
      'appoint_price': appointPrice,
      'start_time': startTime,
      'end_time': endTime,
    };
  }
}