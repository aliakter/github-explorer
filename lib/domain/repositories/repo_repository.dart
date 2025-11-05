import 'package:dartz/dartz.dart';
import 'package:github_explorer/core/errors/failures.dart';
import 'package:github_explorer/domain/entities/repo.dart';

abstract class RepoRepository {
  Future<Either<Failure, List<Repo>>> getRepos(String username);
}