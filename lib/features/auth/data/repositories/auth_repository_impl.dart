import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';
import '../sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SecureStorageService secureStorage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.secureStorage,
  });

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await remoteDataSource.login(email, password);
      
      final token = response['access_token'] as String;
      final refreshToken = response['refresh_token'] as String;
      final userJson = response['user'] as Map<String, dynamic>;

      await secureStorage.saveTokens(
        accessToken: token,
        refreshToken: refreshToken,
      );

      return UserModel.fromJson(userJson);
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
    await secureStorage.clearAll();
  }

  @override
  Future<User?> checkAuthStatus() async {
    final token = await secureStorage.getAccessToken();
    if (token != null) {
      // Typically fetch user profile here
      return const UserModel(id: '1', name: 'Saved User', email: 'user@example.com');
    }
    return null;
  }
}
