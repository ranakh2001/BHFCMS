/// All network-related constants for the BHCFMS app.
///
/// Keep every magic string or number here. Nothing outside this file
/// should hard-code a URL, timeout value, or status code.
class NetworkConstants {
  NetworkConstants._();

  // ---------------------------------------------------------------------------
  // Base URL
  // ---------------------------------------------------------------------------

  /// Root URL for every API call.
  static const String baseUrl = 'https://bhcfms.net/api/v2/';
  static const String baseUrlWithoutV2 = "https://bhcfms.net/api/";

  // ---------------------------------------------------------------------------
  // Timeouts
  // ---------------------------------------------------------------------------

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // ---------------------------------------------------------------------------
  // Default headers
  // ---------------------------------------------------------------------------

  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // ---------------------------------------------------------------------------
  // Endpoints
  // ---------------------------------------------------------------------------

  static const String login = 'login';
  static const String logout = 'auth/logout';
  static const String authUser = 'auth-user';

  // ---------------------------------------------------------------------------
  // HTTP status codes
  // ---------------------------------------------------------------------------

  static const int statusOk = 200;
  static const int statusCreated = 201;
  static const int statusNoContent = 204;
  static const int statusBadRequest = 400;
  static const int statusUnauthorized = 401;
  static const int statusForbidden = 403;
  static const int statusNotFound = 404;
  static const int statusUnprocessableEntity = 422;
  static const int statusTooManyRequests = 429;
  static const int statusServerError = 500;
  static const int statusBadGateway = 502;
  static const int statusServiceUnavailable = 503;
}
