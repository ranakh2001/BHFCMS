import 'package:dio/dio.dart';
import 'network_constants.dart';

/// A structured, user-friendly exception produced by every failed API call.
///
/// Always created via [ApiException.fromDioException] so that the rest of the
/// app never has to import Dio directly for error handling.
class ApiException implements Exception {
  /// Human-readable message safe to show in the UI.
  final String message;

  /// HTTP status code, or `null` for network-level errors (timeout, no internet).
  final int? statusCode;

  /// Validation errors returned by the server, keyed by field name.
  ///
  /// Example: `{"email": ["The email has already been taken."]}`.
  final Map<String, dynamic>? errors;

  const ApiException({
    required this.message,
    this.statusCode,
    this.errors,
  });

  // ---------------------------------------------------------------------------
  // Factory
  // ---------------------------------------------------------------------------

  /// Maps a raw [DioException] to a clean [ApiException].
  factory ApiException.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ApiException(
          message: 'Connection timed out. Please check your internet and try again.',
        );
      case DioExceptionType.sendTimeout:
        return const ApiException(
          message: 'Request timed out while sending data. Please try again.',
        );
      case DioExceptionType.receiveTimeout:
        return const ApiException(
          message: 'The server took too long to respond. Please try again later.',
        );
      case DioExceptionType.cancel:
        return const ApiException(message: 'Request was cancelled.');
      case DioExceptionType.connectionError:
        return const ApiException(
          message: 'No internet connection. Please check your network settings.',
        );
      case DioExceptionType.badCertificate:
        return const ApiException(
          message: 'SSL certificate error. The connection is not secure.',
        );
      case DioExceptionType.badResponse:
        return _fromBadResponse(e);
      case DioExceptionType.unknown:
        return ApiException(
          message: e.message ?? 'An unexpected error occurred. Please try again.',
        );
    }
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  static ApiException _fromBadResponse(DioException e) {
    final statusCode = e.response?.statusCode;
    final data = e.response?.data;

    String? serverMessage;
    Map<String, dynamic>? validationErrors;

    if (data is Map<String, dynamic>) {
      serverMessage = data['message'] as String?;
      if (data['errors'] is Map<String, dynamic>) {
        validationErrors = data['errors'] as Map<String, dynamic>;
      }
    }

    switch (statusCode) {
      case NetworkConstants.statusBadRequest:
        return ApiException(
          message: serverMessage ?? 'Bad request. Please check your input.',
          statusCode: statusCode,
          errors: validationErrors,
        );
      case NetworkConstants.statusUnauthorized:
        return ApiException(
          message: serverMessage ?? 'Session expired. Please log in again.',
          statusCode: statusCode,
        );
      case NetworkConstants.statusForbidden:
        return ApiException(
          message: serverMessage ?? 'You do not have permission to perform this action.',
          statusCode: statusCode,
        );
      case NetworkConstants.statusNotFound:
        return ApiException(
          message: serverMessage ?? 'The requested resource was not found.',
          statusCode: statusCode,
        );
      case NetworkConstants.statusUnprocessableEntity:
        return ApiException(
          message: serverMessage ?? 'Validation failed. Please check your input.',
          statusCode: statusCode,
          errors: validationErrors,
        );
      case NetworkConstants.statusTooManyRequests:
        return ApiException(
          message: serverMessage ?? 'Too many requests. Please wait and try again.',
          statusCode: statusCode,
        );
      default:
        if (statusCode != null && statusCode >= 500) {
          return ApiException(
            message: serverMessage ?? 'A server error occurred. Please try again later.',
            statusCode: statusCode,
          );
        }
        return ApiException(
          message: serverMessage ?? 'Unexpected response (HTTP $statusCode).',
          statusCode: statusCode,
        );
    }
  }

  @override
  String toString() =>
      'ApiException(statusCode: $statusCode, message: $message)';
}
