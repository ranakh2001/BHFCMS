import '../../../../core/network/dio_manager.dart';
import '../../../../core/network/network_constants.dart';
import '../models/login_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
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
}
