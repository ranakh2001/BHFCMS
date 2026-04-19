class ServerException implements Exception {
  final String message;
  ServerException([this.message = 'An error occurred with the server']);
}

class CacheException implements Exception {}

class UnauthorizedException implements Exception {}

class NoInternetException implements Exception {}
