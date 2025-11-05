import 'package:github_explorer/core/errors/exceptions.dart';
import 'package:github_explorer/core/network/dio_client.dart';
import 'package:github_explorer/data/models/repo_model.dart';

class RepoRemoteDataSource {
  final DioClient client;
  RepoRemoteDataSource(this.client);

  Future<List<RepoModel>> fetchRepos(String username) async {
    try {
      final response = await client.get('/users/$username/repos',
        queryParameters: {'per_page': 100, 'sort': 'updated'},
      );
      final data = response.data as List;
      return data.map((e) => RepoModel.fromJson(e)).toList();
    } on AppException {
      rethrow; // Repository will handle it with handleException()
    } catch (e) {
      throw DataParsingException("Failed to parse repo data: $e");
    }
  }
}