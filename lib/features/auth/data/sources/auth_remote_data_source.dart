import '../../../../core/network/dio_manager.dart';
import '../../../../core/network/network_constants.dart';
import '../models/login_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> getAuthUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioManager _dioManager;

  AuthRemoteDataSourceImpl(this._dioManager);

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dioManager.post<Map<String, dynamic>>(
      NetworkConstants.login,
      data: LoginRequestModel(email: email, password: password).toJson(),
    );

    final body = response.data!;

    // Normalize to the internal contract that AuthRepositoryImpl reads:
    // { access_token, account_type, user: { id, name, email, role } }
    final userData = body['data'] as Map<String, dynamic>;
    final accountType = body['account_type'] as String? ?? 'therapist';

    return {
      'access_token': body['token'] as String,
      'account_type': accountType,
      'user': {
        'id': userData['id'].toString(),
        'name': [
          userData['first_name'] as String? ?? '',
          userData['last_name'] as String? ?? '',
        ].join(' ').trim(),
        'email': userData['email'] as String,
        'role': accountType,
      },
    };
  }

  @override
  Future<Map<String, dynamic>> getAuthUser() async {
    // Uses baseUrlWithoutV2 because the endpoint is /api/auth-user, not /api/v2/auth-user.
    // Dio treats an absolute path (starts with https://) as the full URL, overriding baseUrl.
    final response = await _dioManager.get<Map<String, dynamic>>(
      NetworkConstants.baseUrlWithoutV2 + NetworkConstants.authUser,
    );

    return response.data!;
  }
}
