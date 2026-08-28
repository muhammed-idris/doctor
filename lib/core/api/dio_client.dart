import 'package:dio/dio.dart';

import 'api_url.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // ================= GET =================

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.get(url, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ?? e.message ?? 'Something went wrong',
      );
    }
  }

  // ================= POST =================

  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.post(url, data: data, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ?? e.message ?? 'Something went wrong',
      );
    }
  }

  // ================= PUT =================

  Future<Response> put(String url, {dynamic data}) async {
    try {
      return await dio.put(url, data: data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ?? e.message ?? 'Something went wrong',
      );
    }
  }

  // ================= DELETE =================

  Future<Response> delete(String url, {dynamic data}) async {
    try {
      return await dio.delete(url, data: data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ?? e.message ?? 'Something went wrong',
      );
    }
  }
}
