import 'package:doctor/core/api/dio_client.dart';

import '../api/api_url.dart';
import '../../data/models/doctor_model/doctor_model.dart';
import '../../data/models/specialization_model/specialization_model.dart';

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

      final body = _asMap(response.data);
      _ensureSuccessful(body);

      final rawData = body['data'];
      final List<dynamic> data = rawData is List
          ? rawData
          : rawData is Map
              ? _firstList(
                  Map<String, dynamic>.from(rawData),
                  const [
                    'specializations',
                    'specialties',
                    'data',
                  ],
                )
              : <dynamic>[];

      return data
          .map(
            (json) => SpecializationModel.fromJson(
              json is Map ? Map<String, dynamic>.from(json) : null,
            ),
          )
          .where((specialization) => specialization.id > 0)
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

      final body = _asMap(response.data);
      _ensureSuccessful(body);

      final rawData = body['data'];
      final List<dynamic> doctorsJson;
      if (rawData is List) {
        doctorsJson = rawData;
      } else if (rawData is Map) {
        doctorsJson = _firstList(
          Map<String, dynamic>.from(rawData),
          const ['doctors', 'data'],
        );
      } else {
        doctorsJson = const [];
      }

      return doctorsJson
          .map(
            (json) => DoctorModel.fromJson(
              json is Map
                  ? Map<String, dynamic>.from(json)
                  : <String, dynamic>{},
            ),
          )
          .where((doctor) => doctor.id > 0)
          .toList();
    } catch (e) {
      throw Exception(
        'Failed to load doctors by specialization: $e',
      );
    }
  }

  Map<String, dynamic> _asMap(dynamic value) {
    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }

    throw const FormatException(
      'The server returned an unexpected response format.',
    );
  }

  List<dynamic> _firstList(
    Map<String, dynamic> data,
    List<String> keys,
  ) {
    for (final key in keys) {
      final value = data[key];
      if (value is List) {
        return value;
      }
    }
    return const [];
  }

  void _ensureSuccessful(Map<String, dynamic> body) {
    if (body['status'] == false) {
      final message = body['message'];
      throw Exception(
        message is String && message.isNotEmpty
            ? message
            : 'The server could not load specializations.',
      );
    }
  }
}