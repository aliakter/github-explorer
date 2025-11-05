import 'package:dio/dio.dart';
import 'package:github_explorer/core/errors/exceptions.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.github.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  ) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
      ),
    );
  }

  //  GET Request
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      return await dio.get(path, queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // POST Request
  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      return await dio.post(path, data: data, queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // PUT Request
  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      return await dio.put(path, data: data, queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // PATCH Request
  Future<Response> patch(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      return await dio.patch(path, data: data, queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // DELETE Request
  Future<Response> delete(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      return await dio.delete(path, data: data, queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // Centralized Error Handling
  void _handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const RequestTimeoutException();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode ?? 0;
        final message = e.response?.data?['message'] ?? 'Unexpected server response';
        if (statusCode == 401 || statusCode == 403) {
          throw UnAuthorizedException(message, statusCode: statusCode);
        } else if (statusCode == 404) {
          throw NotFoundException(message);
        } else if (statusCode >= 500) {
          throw ServerException(message, statusCode: statusCode);
        } else {
          throw ServerException(message, statusCode: statusCode);
        }
      case DioExceptionType.cancel:
        throw const UnknownException("Request Cancelled");
      case DioExceptionType.connectionError:
        throw const NoInternetException();
      default:
        throw UnknownException(e.message ?? "Unknown network error");
    }
  }
}
