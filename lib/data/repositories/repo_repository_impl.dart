import 'package:dartz/dartz.dart';
import 'package:github_explorer/core/errors/exceptions.dart';
import 'package:github_explorer/core/errors/failures.dart';
import 'package:github_explorer/core/errors/error_mapper.dart';
import 'package:github_explorer/data/data_sources/repo_remote_data_source.dart';
import 'package:github_explorer/domain/entities/repo.dart';
import 'package:github_explorer/domain/repositories/repo_repository.dart';

class RepoRepositoryImpl implements RepoRepository {
  final RepoRemoteDataSource remote;

  RepoRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<Repo>>> getRepos(String username) async {
    try {
      final repos = await remote.fetchRepos(username);
      return Right(repos);
    } on AppException catch (e) {
      return Left(handleException(e));
    }
  }
}
