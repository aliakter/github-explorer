import 'package:github_explorer/core/errors/exceptions.dart';
import 'package:github_explorer/core/errors/failures.dart';

Failure handleException(AppException e) {
  if (e is NoInternetException) return const NetworkFailure();
  if (e is RequestTimeoutException) return const TimeoutFailure();
  if (e is UnAuthorizedException) return const AuthFailure();
  if (e is NotFoundException) return const NotFoundFailure();
  if (e is ServerException) return ServerFailure(e.message);
  if (e is DataParsingException) return const DataParsingFailure();
  if (e is UnknownException) return const UnknownFailure();
  return const UnknownFailure();
}
