import 'package:dio/dio.dart';
import '../storge/token_storge.dart';
import 'api_url.dart';

class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiUrl.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  // ================= INTERCEPTORS =================

  void _setupInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenStorage.getToken();

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },

        onError: (error, handler) {
          handler.next(error);
        },
      ),
    );
  }

  // ================= GET =================

  Future<Response> get(
      String url, {
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      return await dio.get(
        url,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ??
            e.message ??
            'Something went wrong',
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
      return await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ??
            e.message ??
            'Something went wrong',
      );
    }
  }

  // ================= PUT =================

  Future<Response> put(
      String url, {
        dynamic data,
      }) async {
    try {
      return await dio.put(
        url,
        data: data,
      );
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ??
            e.message ??
            'Something went wrong',
      );
    }
  }

  // ================= DELETE =================

  Future<Response> delete(
      String url, {
        dynamic data,
      }) async {
    try {
      return await dio.delete(
        url,
        data: data,
      );
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ??
            e.message ??
            'Something went wrong',
      );
    }
  }
}