import 'package:github_explorer/core/errors/exceptions.dart';
import 'package:github_explorer/core/network/dio_client.dart';
import 'package:github_explorer/data/models/user_model.dart';

class UserRemoteDataSource {
  final DioClient client;
  UserRemoteDataSource(this.client);

  Future<UserModel> fetchUser(String username) async {
    try {
      final response = await client.get('/users/$username');
      return UserModel.fromJson(response.data);
    } on AppException {
      rethrow; // Repository will handle it with handleException()
    } catch (e) {
      throw DataParsingException("Failed to parse user data: $e");
    }
  }
}