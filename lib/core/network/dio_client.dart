import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../constants/app_constants.dart';
import 'auth_interceptor.dart';

class DioClient {
  final Dio _dio;

  DioClient(AuthInterceptor authInterceptor) 
    : _dio = Dio(
        BaseOptions(
          baseUrl: AppConstants.baseUrl,
          connectTimeout: const Duration(milliseconds: AppConstants.connectionTimeout),
          receiveTimeout: const Duration(milliseconds: AppConstants.receiveTimeout),
          responseType: ResponseType.json,
        ),
      ) {
    _dio.interceptors.add(authInterceptor);
    
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ));
    }
  }

  Dio get dio => _dio;
  
  // Custom API mapping logic could go here
}
