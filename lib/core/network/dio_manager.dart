import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'network_constants.dart';
import 'dio_inspector.dart';
import 'api_exception.dart';

/// Singleton HTTP client for the entire app.
///
/// Wires up [DioInspector] for debug logging and an inline auth interceptor
/// that attaches `Authorization: Bearer <token>` on every request.
///
/// Example:
/// ```dart
/// final response = await DioManager.instance.post(
///   NetworkConstants.login,
///   data: {'email': email, 'password': password},
/// );
/// ```
class DioManager {
  DioManager._internal();

  /// The single shared instance.
  static final DioManager instance = DioManager._internal();

  late final Dio _dio = _buildDio();

  // ---------------------------------------------------------------------------
  // Initialisation
  // ---------------------------------------------------------------------------

  Dio _buildDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: NetworkConstants.baseUrl,
        connectTimeout: NetworkConstants.connectTimeout,
        receiveTimeout: NetworkConstants.receiveTimeout,
        sendTimeout: NetworkConstants.sendTimeout,
        headers: Map<String, String>.from(NetworkConstants.defaultHeaders),
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors
      ..add(DioInspector())
      ..add(_authInterceptor());

    return dio;
  }

  /// Reads the stored access token from secure storage and attaches it as a
  /// Bearer header. Skips the login endpoint so unauthenticated calls go through.
  Interceptor _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final isLoginEndpoint = options.path.contains(NetworkConstants.login);
        if (!isLoginEndpoint) {
          const storage = FlutterSecureStorage();
          final token = await storage.read(key: 'access_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        }
        handler.next(options);
      },
      onError: (err, handler) {
        if (err.response?.statusCode == NetworkConstants.statusUnauthorized) {
          // TODO: trigger token refresh or navigate to login screen.
        }
        handler.next(err);
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Public HTTP methods
  // ---------------------------------------------------------------------------

  /// Sends a GET request to [path].
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// Sends a POST request to [path] with optional [data].
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// Sends a PUT request to [path] with optional [data].
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// Sends a PATCH request to [path] with optional [data].
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  /// Sends a DELETE request to [path].
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
