import 'package:doctor/core/api/dio_client.dart';
import '../../data/models/doctor_model/doctor_list_model.dart';
import '../api/api_url.dart';
import '../../data/models/doctor_model/doctor_model.dart';

class DoctorRepository {
  final DioClient dioClient;

  DoctorRepository({required this.dioClient});

  Future<List<DoctorModel>> getDoctors() async {
    try {
      final response = await dioClient.get(ApiUrl.doctorIndexUrl);

      final doctorResponse = DoctorListResponseModel.fromJson(response.data);

      if (!doctorResponse.status) {
        throw Exception(
          doctorResponse.message.isNotEmpty
              ? doctorResponse.message
              : 'Failed to load doctors',
        );
      }

      return doctorResponse.data;
    } catch (e) {
      throw Exception('Failed to load doctors: $e');
    }
  }

  Future<DoctorModel> getDoctorById(int id) async {
    try {
      final response = await dioClient.get(ApiUrl.doctorShowUrl(id));

      final data = response.data;

      return DoctorModel.fromJson(data['data']);
    } catch (e) {
      throw Exception('Failed to load doctor: $e');
    }
  }

  Future<List<DoctorModel>> getDoctorsByCity(int cityId) async {
    try {
      final response = await dioClient.get(
        ApiUrl.doctorFilterUrl,
        queryParameters: {'city': cityId},
      );

      final doctorResponse = DoctorListResponseModel.fromJson(response.data);

      if (!doctorResponse.status) {
        throw Exception(
          doctorResponse.message.isNotEmpty
              ? doctorResponse.message
              : 'Failed to filter doctors',
        );
      }

      return doctorResponse.data;
    } catch (e) {
      throw Exception('Failed to filter doctors: $e');
    }
  }

  Future<List<DoctorModel>> searchDoctors(String name) async {
    try {
      final response = await dioClient.get(
        ApiUrl.doctorSearchUrl,
        queryParameters: {'name': name},
      );

      final doctorResponse = DoctorListResponseModel.fromJson(response.data);

      if (!doctorResponse.status) {
        throw Exception(
          doctorResponse.message.isNotEmpty
              ? doctorResponse.message
              : 'Failed to search doctors',
        );
      }

      return doctorResponse.data;
    } catch (e) {
      throw Exception('Failed to search doctors: $e');
    }
  }
}
