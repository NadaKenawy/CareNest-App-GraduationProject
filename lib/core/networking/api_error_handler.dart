import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection Timeout");
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: "Send Timeout in connection with the server");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "Receive Timeout in connection with the server");
        case DioExceptionType.badCertificate:
          return ApiErrorModel(message: "Bad Certificate");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request Cancelled");
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection Error");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message:
                  "connection to the server failed due to internet connection");
        }
    } else {
      return ApiErrorModel(message: "Unknown error occurred");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  if (data is Map<String, dynamic>) {
    if (data['errors'] is List && (data['errors'] as List).isNotEmpty) {
      String firstError = data['errors'][0]['msg'] ?? "Unknown error occurred";
      return ApiErrorModel(message: firstError);
    }
    return ApiErrorModel(
      message: data['message'] ?? "Unknown error occurred",
    );
  } else if (data is String) {
    return ApiErrorModel(
      message: data,
    );
  } else {
    return ApiErrorModel(message: "Unknown error occurred");
  }
}
