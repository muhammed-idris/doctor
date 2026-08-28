import 'package:dio/dio.dart';

import '../../../core/api/api_url.dart';
import '../doctor_model/doctor_model.dart';
import '../doctor_model/doctor_specialization.dart';

class SpecializationRepository {
  final Dio dio;

  SpecializationRepository(this.dio);

  // Get all specializations
  Future<List<SpecializationModel>> getAllSpecializations() async {
    final response = await dio.get(ApiUrl.specializationIndexUrl);

    final List data = response.data['data'];

    return data.map((json) => SpecializationModel.fromJson(json)).toList();
  }

  // Get all doctors that have this specialization
  Future<List<DoctorModel>> getDoctorsBySpecialization(
    int specializationId,
  ) async {
    final response = await dio.get(
      ApiUrl.specializationShowUrl(specializationId),
    );

    final List data = response.data['data'];

    return data.map((json) => DoctorModel.fromJson(json)).toList();
  }
}
