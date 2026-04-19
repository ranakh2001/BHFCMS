import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/error/exceptions.dart';


abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      // Simulate network request
      // final response = await dioClient.dio.post('/auth/login', data: {
      //   'email': email,
      //   'password': password,
      // });
      // return response.data;
      
      // Delay to simulate network
      await Future.delayed(const Duration(seconds: 1));
      
      // Fake successful response
      return {
        'access_token': 'fake_access_token_123',
        'refresh_token': 'fake_refresh_token_123',
        'user': {
          'id': '1',
          'name': 'Admin User',
          'email': email,
        }
      };
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException();
      }
      throw ServerException(e.message ?? 'Unknown server error');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
