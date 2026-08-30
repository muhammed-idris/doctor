
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
    final rawData = json['data'];
    final dataList = rawData is List
        ? rawData
        : rawData is Map
            ? _firstList(Map<String, dynamic>.from(rawData))
            : const <dynamic>[];

    return DoctorListResponseModel(
      message: '${json['message'] ?? ''}',
      data: dataList
          .whereType<Map>()
          .map((e) => DoctorModel.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
      status: _asBool(json['status']),
      code: int.tryParse('${json['code'] ?? 200}') ?? 200,
    );
  }

  static List<dynamic> _firstList(Map<String, dynamic> data) {
    for (final key in const ['doctors', 'data', 'items']) {
      if (data[key] is List) return data[key] as List<dynamic>;
    }
    return const [];
  }

  static bool _asBool(dynamic value) {
    if (value is bool) return value;
    if (value is String) return value.toLowerCase() == 'true' || value == '1';
    if (value is num) return value != 0;
    return true;
  }
}