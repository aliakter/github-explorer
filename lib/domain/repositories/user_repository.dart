import 'package:dartz/dartz.dart';
import 'package:github_explorer/core/errors/failures.dart';
import 'package:github_explorer/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String username);
}