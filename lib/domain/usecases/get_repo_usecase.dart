import 'package:dartz/dartz.dart';
import 'package:github_explorer/core/errors/failures.dart';
import 'package:github_explorer/domain/entities/repo.dart';
import 'package:github_explorer/domain/repositories/repo_repository.dart';

class GetRepoUseCase {
  final RepoRepository repository;

  GetRepoUseCase(this.repository);

  Future<Either<Failure, List<Repo>>> getRepo(String username) async {
    if (username.trim().isEmpty) {
      return Left(const ValidationFailure("Username cannot be empty"));
    }
    return await repository.getRepos(username.trim());
  }
}
