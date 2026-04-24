import 'dart:convert';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../../../core/storage/shared_preferences_service.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';
import '../sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SecureStorageService secureStorage;
  final SharedPreferencesService sharedPrefs;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.secureStorage,
    required this.sharedPrefs,
  });

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await remoteDataSource.login(email, password);

      await secureStorage.saveTokens(
        accessToken: response['access_token'] as String,
        refreshToken: response['refresh_token'] as String,
      );

      final user = UserModel.fromJson(
        response['user'] as Map<String, dynamic>,
      );

      // Persist user so the session survives app restarts.
      await sharedPrefs.saveSessionUser(jsonEncode(user.toJson()));

      return user;
    } on UnauthorizedException {
      throw const UnauthorizedFailure('Invalid email or password');
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure('Unexpected error: $e');
    }
  }

  @override
  Future<void> logout() async {
    await Future.wait([
      secureStorage.clearAll(),
      sharedPrefs.clearSessionUser(),
    ]);
  }

  /// Restores the previously logged-in user from SharedPreferences.
  /// Returns null if no session exists or if the stored data is corrupt.
  @override
  Future<User?> checkAuthStatus() async {
    final json = sharedPrefs.sessionUserJson;
    if (json == null) return null;

    try {
      final decoded = jsonDecode(json) as Map<String, dynamic>;
      return UserModel.fromJson(decoded);
    } catch (_) {
      await sharedPrefs.clearSessionUser();
      return null;
    }
  }
}
