import 'package:github_explorer/data/data_sources/github_remote_data_source.dart';
import 'package:github_explorer/domain/entities/repo.dart';
import 'package:github_explorer/domain/entities/user.dart';
import 'package:github_explorer/domain/repositories/github_repository.dart';

class GitHubRepositoryImpl implements GitHubRepository {
  final GitHubRemoteDataSource remote;
  GitHubRepositoryImpl(this.remote);

  @override
  Future<User> getUser(String username) async {
    return remote.fetchUser(username);
  }

  @override
  Future<List<Repo>> getRepos(String username) async {
    return remote.fetchRepos(username);
  }
}