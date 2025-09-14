import 'package:dio/dio.dart';
import 'failures.dart';

class ErrorMapper {
  static Failures mapError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return NetworkFailure("Connection timed out. Check your network and try again.");
        case DioExceptionType.sendTimeout:
          return NetworkFailure("Request timed out while sending. Try again.");
        case DioExceptionType.receiveTimeout:
          return NetworkFailure("Server took too long to respond. Try later.");
        case DioExceptionType.badCertificate:
          return ServerFailure("Invalid SSL certificate. Secure connection failed.");
        case DioExceptionType.cancel:
          return NetworkFailure("Request was cancelled. Please retry.");
        case DioExceptionType.connectionError:
          return NetworkFailure("No internet connection. Please check your network.");
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 500;
          final message = error.response?.data?['message'] ?? "Unexpected server error";
          switch (statusCode) {
            case 400: return ValidationFailure(message);
            case 401: return ServerFailure(message);
            case 403: return ServerFailure(message);
            case 404: return ServerFailure(message);
            case 422: return ValidationFailure(message);
            case 500: return ServerFailure(message);
            default: return ServerFailure(message);
          }
        case DioExceptionType.unknown:
          return NetworkFailure("Unexpected network issue. Please check your connection.");
      }
    }
    return ServerFailure("Unexpected error occurred. Please try again.");
  }
}
