import 'package:dio/dio.dart';

import '../../../core/api/api_url.dart';
import '../doctor_model/doctor_specialization.dart';

class SpecializationRepository {
  final Dio dio;

  SpecializationRepository(this.dio);

  Future<List<SpecializationModel>> getAllSpecializations() async {
    final response = await dio.get(
      ApiUrl.specializationIndexUrl,
    );

    final List data = response.data['data'];

    return data
        .map(
          (json) => SpecializationModel.fromJson(json),
    )
        .toList();
  }

  Future<SpecializationModel> getSpecialization(int id) async {
    final response = await dio.get(
      ApiUrl.specializationShowUrl(id),
    );

    return SpecializationModel.fromJson(
      response.data['data'],
    );
  }
}