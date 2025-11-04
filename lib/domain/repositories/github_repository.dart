import 'package:github_explorer/domain/entities/repo.dart';
import 'package:github_explorer/domain/entities/user.dart';

abstract class GitHubRepository {
  Future<User> getUser(String username);
  Future<List<Repo>> getRepos(String username);
}