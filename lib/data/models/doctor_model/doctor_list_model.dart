
import 'doctor_model.dart';

class DoctorListResponseModel {
  final String message;
  final List<DoctorModel> data;
  final bool status;
  final int code;

  DoctorListResponseModel({
    required this.message,
    required this.data,
    this.status = true,
    this.code = 200,
  });

  factory DoctorListResponseModel.fromJson(Map<String, dynamic> json) {
    return DoctorListResponseModel(
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<DoctorModel>.from(
          (json['data'] as List).map((e) => DoctorModel.fromJson(e)))
          : [],
      status: json['status'] ?? true,
      code: json['code'] ?? 200,
    );
  }
}