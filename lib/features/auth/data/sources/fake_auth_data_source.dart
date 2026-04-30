import '../../../../core/error/exceptions.dart';
import 'auth_remote_data_source.dart';

/// In-memory mock — drop-in replacement for [AuthRemoteDataSourceImpl].
/// To switch to the real API, change the provider binding in auth_provider.dart;
/// this file and the interface both stay untouched.
class FakeAuthDataSource implements AuthRemoteDataSource {
  /// Master user registry.  Password is stored in plain text here only because
  /// this is a local mock; the real data source never receives the raw password.
  static const _users = <String, Map<String, String>>{
    'therapist@test.com': {
      'id': 'u-001',
      'name': 'Dr. Sarah Johnson',
      'role': 'therapist',
      'password': '123456',
    },
    'parent@test.com': {
      'id': 'u-002',
      'name': 'Ahmed Al-Rashidi',
      'role': 'parent',
      'password': '123456',
    },
    'reception@test.com': {
      'id': 'u-003',
      'name': 'Layla Hassan',
      'role': 'receptionist',
      'password': '123456',
    },
    'supervisor@test.com': {
      'id': 'u-004',
      'name': 'Sara Al-Ahmad',
      'role': 'supervisor',
      'password': '123456',
    },
  };

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 900));

    final record = _users[email.trim().toLowerCase()];

    if (record == null || record['password'] != password) {
      throw UnauthorizedException();
    }

    return {
      'access_token': 'mock_token_${record['role']}',
      'refresh_token': 'mock_refresh_${record['role']}',
      'user': {
        'id': record['id'],
        'name': record['name'],
        'email': email.trim().toLowerCase(),
        'role': record['role'],
      },
    };
  }
}
