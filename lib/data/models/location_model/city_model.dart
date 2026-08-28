
import 'governorate_model.dart';

class CityModel {
  final int id;
  final String name;
  final GovernorateModel? governorate;

  CityModel({
    required this.id,
    required this.name,
    this.governorate,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      governorate: json['governorate'] != null
          ? GovernorateModel.fromJson(json['governorate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'governorate': governorate?.toJson(),
    };
  }
}