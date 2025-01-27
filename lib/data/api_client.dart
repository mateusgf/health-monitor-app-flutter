import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  final Dio dio;

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal()
      : dio = Dio(
          BaseOptions(
            baseUrl: dotenv.env['BASE_URL'] ?? '',
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 3),
          ),
        );
}
