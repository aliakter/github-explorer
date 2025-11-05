
/// Base class for all exceptions in the app.
abstract class AppException implements Exception {
  final String message;
  final String? prefix;
  final int? statusCode;

  const AppException(this.message, {this.prefix, this.statusCode});

  @override
  String toString() => "${prefix ?? "Error"}: $message";
}

/// 🔐 Thrown when authentication fails (401, 403)
class UnAuthorizedException extends AppException {
  const UnAuthorizedException(super.message, {super.statusCode})
      : super(prefix: "Unauthorized");
}

/// 🌐 Thrown when there’s no internet connection
class NoInternetException extends AppException {
  const NoInternetException([super.message = "No Internet Connection"])
      : super(prefix: "Network Error");
}

/// ⏱️ Thrown when a request times out
class RequestTimeoutException extends AppException {
  const RequestTimeoutException([super.message = "Request Timeout"])
      : super(prefix: "Timeout");
}

/// ⚡ Thrown when a bad response is received (400–500)
class ServerException extends AppException {
  const ServerException(super.message, {super.statusCode})
      : super(prefix: "Server Error");
}

/// ❌ Thrown when data parsing/decoding fails
class DataParsingException extends AppException {
  const DataParsingException([super.message = "Data Parsing Error"])
      : super(prefix: "Parsing Error");
}

/// 🚫 Thrown when a resource is not found (404)
class NotFoundException extends AppException {
  const NotFoundException([super.message = "Not Found"])
      : super(prefix: "Not Found");
}

/// ⚙️ Generic fallback for unexpected errors
class UnknownException extends AppException {
  const UnknownException([super.message = "An unknown error occurred"])
      : super(prefix: "Unknown Error");
}
