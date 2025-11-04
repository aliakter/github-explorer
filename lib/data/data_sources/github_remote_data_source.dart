import 'package:github_explorer/core/network/dio_client.dart';
import 'package:github_explorer/data/models/repo_model.dart';
import 'package:github_explorer/data/models/user_model.dart';

class GitHubRemoteDataSource {
  final DioClient client;
  GitHubRemoteDataSource(this.client);

  Future<UserModel> fetchUser(String username) async {
    final resp = await client.get('/users/$username');
    return UserModel.fromJson(resp.data);
  }

  Future<List<RepoModel>> fetchRepos(String username) async {
    final resp = await client.get('/users/$username/repos', queryParameters: {'per_page': 100});
    final data = resp.data as List;
    return data.map((e) => RepoModel.fromJson(e)).toList();
  }
}