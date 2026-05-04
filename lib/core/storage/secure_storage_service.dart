import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _secureStorage;

  SecureStorageService(this._secureStorage);

  static const String _keyAccessToken = 'access_token';
  static const String _keyRefreshToken = 'refresh_token';
  static const String _keyAccountType = 'account_type';

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _keyAccessToken, value: token);
  }

  Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
    await _secureStorage.write(key: _keyAccessToken, value: accessToken);
    await _secureStorage.write(key: _keyRefreshToken, value: refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: _keyAccessToken);
  }

  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: _keyRefreshToken);
  }

  Future<void> saveAccountType(String type) async {
    await _secureStorage.write(key: _keyAccountType, value: type);
  }

  Future<String?> getAccountType() async {
    return await _secureStorage.read(key: _keyAccountType);
  }

  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
