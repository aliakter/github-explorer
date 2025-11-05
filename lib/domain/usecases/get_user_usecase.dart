import 'package:dartz/dartz.dart';
import 'package:github_explorer/core/errors/failures.dart';
import 'package:github_explorer/domain/entities/user.dart';
import 'package:github_explorer/domain/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  Future<Either<Failure, User>> getUser(String username) async {
    if (username.trim().isEmpty) {
      return Left(const ValidationFailure("Username cannot be empty"));
    }
    return await repository.getUser(username.trim());
  }
}
