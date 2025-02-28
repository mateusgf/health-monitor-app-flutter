import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_monitor_app_flutter/services/error_handling_service.dart';

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
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 3),
          ),
        ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final requiresAuth = options.extra['requiresAuth'] ?? true;

          if (requiresAuth) {
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              final token = await user.getIdToken();
              options.headers['Authorization'] = 'Bearer $token';
            }
          }

          options.extra.remove('requiresAuth');

          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          if (error.response?.statusCode == 401) {
            ErrorHandlingService.showAuthError();

            // This will automatically redirect the user to login page
            await FirebaseAuth.instance.signOut();

            // @TODO: Maybe calling the signOut(); is not the best approach for handling 401 requests
            // return handler.reject(
            //   DioException(
            //     requestOptions: error.requestOptions,
            //     error: 'Your session has expired. Please sign in again.',
            //     type: DioExceptionType.badResponse,
            //     response: error.response,
            //   ),
            // );
          }

          return handler.next(error);
        },
      ),
    );
  }

  Future<Response> request(
    String method,
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool requiresAuth = true,
  }) {
    final mergedOptions = options ?? Options();
    mergedOptions.method = method;
    mergedOptions.extra = {
      ...mergedOptions.extra ?? {},
      'requiresAuth': requiresAuth,
    };

    return dio.request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: mergedOptions,
    );
  }
}
