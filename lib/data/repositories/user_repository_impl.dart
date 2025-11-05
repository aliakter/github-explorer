import 'package:dartz/dartz.dart';
import 'package:github_explorer/core/errors/exceptions.dart';
import 'package:github_explorer/core/errors/failures.dart';
import 'package:github_explorer/core/errors/error_mapper.dart';
import 'package:github_explorer/data/data_sources/user_remote_data_source.dart';
import 'package:github_explorer/domain/entities/user.dart';
import 'package:github_explorer/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remote;

  UserRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, User>> getUser(String username) async {
    try {
      final user = await remote.fetchUser(username);
      return Right(user);
    } on AppException catch (e) {
      return Left(handleException(e));
    }
  }
}
