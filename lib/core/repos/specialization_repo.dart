import 'package:doctor/core/api/dio_client.dart';

import '../api/api_url.dart';
import '../../data/models/doctor_model/doctor_model.dart';
import '../../data/models/doctor_model/doctor_specialization.dart';

class SpecializationRepository {
  final DioClient dioClient;

  SpecializationRepository({
    required this.dioClient,
  });

  // ============================================================
  // GET ALL SPECIALIZATIONS
  // ============================================================

  Future<List<SpecializationModel>> getAllSpecializations() async {
    try {
      final response = await dioClient.get(
        ApiUrl.specializationIndexUrl,
      );

      final List data = response.data['data'];

      return data
          .map(
            (json) => SpecializationModel.fromJson(json),
      )
          .toList();
    } catch (e) {
      throw Exception(
        'Failed to load specializations: $e',
      );
    }
  }

  // ============================================================
  // GET DOCTORS BY SPECIALIZATION
  // ============================================================

  Future<List<DoctorModel>> getDoctorsBySpecialization(
      int specializationId,
      ) async {
    try {
      final response = await dioClient.get(
        ApiUrl.specializationShowUrl(specializationId),
      );

      // The endpoint returns a single specialization object,
      // e.g. { "data": { "id": 1, "name": "Cardiology", "doctors": [...] } }
      final Map<String, dynamic> data = response.data['data'];

      final List doctorsJson = data['doctors'] ?? [];

      return doctorsJson
          .map(
            (json) => DoctorModel.fromJson(json),
      )
          .toList();
    } catch (e) {
      throw Exception(
        'Failed to load doctors by specialization: $e',
      );
    }
  }
}