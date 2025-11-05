/// Base class for all domain-level failures.
abstract class Failure {
  final String message;
  final int? statusCode;

  const Failure(this.message, {this.statusCode});

  @override
  String toString() => message;
}

/// 🌐 Network or Internet failure
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = "No Internet Connection"]);
}

/// ⏱ Request timeout failure
class TimeoutFailure extends Failure {
  const TimeoutFailure([super.message = "Request Timeout"]);
}

/// ⚡ Server or API failure
class ServerFailure extends Failure {
  const ServerFailure([super.message = "Server Error"]);
}

/// 🔐 Authentication or authorization failure
class AuthFailure extends Failure {
  const AuthFailure([super.message = "Unauthorized Access"]);
}

/// 🚫 Resource not found (404)
class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = "Not Found"]);
}

/// 💾 Data parsing or conversion failure
class DataParsingFailure extends Failure {
  const DataParsingFailure([super.message = "Data Parsing Error"]);
}

/// ⚙️ Unknown / unexpected failure
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = "Unexpected Error Occurred"]);
}

/// 🧩 Validation or business logic failure
class ValidationFailure extends Failure {
  const ValidationFailure([super.message = "Invalid Input"]);
}
