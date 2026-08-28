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
}