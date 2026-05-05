import 'dart:convert';
import 'dart:developer' as dev;

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/network_constants.dart';
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

      await secureStorage.saveToken(response['access_token'] as String);
      await secureStorage.saveAccountType(response['account_type'] as String);

      final user = UserModel.fromJson(
        response['user'] as Map<String, dynamic>,
      );

      await sharedPrefs.saveSessionUser(jsonEncode(user.toJson()));

      return user;
    } on ApiException catch (e) {
      if (e.statusCode == NetworkConstants.statusUnauthorized) {
        throw UnauthorizedFailure(e.message);
      }
      throw ServerFailure(e.message);
    } on UnauthorizedException {
      throw const UnauthorizedFailure('بيانات اعتماد غير صحيحة');
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw const ServerFailure('حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await secureStorage.clearAll();
    } catch (e) {
      dev.log('SecureStorage clearAll failed: $e', name: 'AuthRepository');
    }
    try {
      await sharedPrefs.clearSessionUser();
    } catch (e) {
      dev.log('SharedPreferences clearSessionUser failed: $e',
          name: 'AuthRepository');
    }
  }

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

  @override
  Future<User> getAuthUser() async {
    try {
      final body = await remoteDataSource.getAuthUser();

      final data = body['data'] as Map<String, dynamic>;
      final accountType = body['account_type'] as String?;

      final user = UserModel.fromJson(data, accountType: accountType);

      // Persist refreshed data so checkAuthStatus stays up-to-date.
      await sharedPrefs.saveSessionUser(jsonEncode(user.toJson()));
      if (accountType != null) {
        await secureStorage.saveAccountType(accountType);
      }

      return user;
    } on ApiException catch (e) {
      if (e.statusCode == NetworkConstants.statusUnauthorized) {
        throw UnauthorizedFailure(e.message);
      }
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
