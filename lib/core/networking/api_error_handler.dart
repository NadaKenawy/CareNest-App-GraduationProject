// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:care_nest/core/networking/api_constants.dart';
import 'package:care_nest/core/networking/api_error_model.dart';
import 'package:dio/dio.dart';

enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ResponseCode {
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORISED = 401;
  static const int FORBIDDEN = 403;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int NOT_FOUND = 404;
  static const int API_LOGIC_ERROR = 422;

  // Local status codes
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String NO_CONTENT = ApiErrors.noContent;
  static const String BAD_REQUEST = ApiErrors.badRequestError;
  static const String UNAUTHORISED = ApiErrors.unauthorizedError;
  static const String FORBIDDEN = ApiErrors.forbiddenError;
  static const String INTERNAL_SERVER_ERROR = ApiErrors.internalServerError;
  static const String NOT_FOUND = ApiErrors.notFoundError;

  // Local status messages
  static const String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static const String CANCEL = ApiErrors.defaultError;
  static const String RECEIVE_TIMEOUT = ApiErrors.timeoutError;
  static const String SEND_TIMEOUT = ApiErrors.timeoutError;
  static const String CACHE_ERROR = ApiErrors.cacheError;
  static const String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static const String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    return ApiErrorModel(
      status: "error",
      error: ErrorDetail(
        statusCode: _getStatusCode(),
        status: _getStatus(),
        isOperational: true,
      ),
      message: _getMessage(),
      stack: "",
    );
  }

  String _getMessage() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ResponseMessage.NO_CONTENT;
      case DataSource.BAD_REQUEST:
        return ResponseMessage.BAD_REQUEST;
      case DataSource.FORBIDDEN:
        return ResponseMessage.FORBIDDEN;
      case DataSource.UNAUTHORISED:
        return ResponseMessage.UNAUTHORISED;
      case DataSource.NOT_FOUND:
        return ResponseMessage.NOT_FOUND;
      case DataSource.INTERNAL_SERVER_ERROR:
        return ResponseMessage.INTERNAL_SERVER_ERROR;
      case DataSource.CONNECT_TIMEOUT:
        return ResponseMessage.CONNECT_TIMEOUT;
      case DataSource.CANCEL:
        return ResponseMessage.CANCEL;
      case DataSource.RECEIVE_TIMEOUT:
        return ResponseMessage.RECEIVE_TIMEOUT;
      case DataSource.SEND_TIMEOUT:
        return ResponseMessage.SEND_TIMEOUT;
      case DataSource.CACHE_ERROR:
        return ResponseMessage.CACHE_ERROR;
      case DataSource.NO_INTERNET_CONNECTION:
        return ResponseMessage.NO_INTERNET_CONNECTION;
      case DataSource.DEFAULT:
        return ResponseMessage.DEFAULT;
      default:
        return ResponseMessage.DEFAULT;
    }
  }

  String _getStatus() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return "No Content";
      case DataSource.BAD_REQUEST:
        return "Bad Request";
      case DataSource.FORBIDDEN:
        return "Forbidden";
      case DataSource.UNAUTHORISED:
        return "Unauthorized";
      case DataSource.NOT_FOUND:
        return "Not Found";
      case DataSource.INTERNAL_SERVER_ERROR:
        return "Internal Server Error";
      case DataSource.CONNECT_TIMEOUT:
        return "Connection Timeout";
      case DataSource.CANCEL:
        return "Request Cancelled";
      case DataSource.RECEIVE_TIMEOUT:
        return "Receive Timeout";
      case DataSource.SEND_TIMEOUT:
        return "Send Timeout";
      case DataSource.CACHE_ERROR:
        return "Cache Error";
      case DataSource.NO_INTERNET_CONNECTION:
        return "No Internet Connection";
      case DataSource.DEFAULT:
        return "Unknown Error";
      default:
        return "Unknown Error";
    }
  }

  int _getStatusCode() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ResponseCode.NO_CONTENT;
      case DataSource.BAD_REQUEST:
        return ResponseCode.BAD_REQUEST;
      case DataSource.FORBIDDEN:
        return ResponseCode.FORBIDDEN;
      case DataSource.UNAUTHORISED:
        return ResponseCode.UNAUTHORISED;
      case DataSource.NOT_FOUND:
        return ResponseCode.NOT_FOUND;
      case DataSource.INTERNAL_SERVER_ERROR:
        return ResponseCode.INTERNAL_SERVER_ERROR;
      case DataSource.CONNECT_TIMEOUT:
        return ResponseCode.CONNECT_TIMEOUT;
      case DataSource.CANCEL:
        return ResponseCode.CANCEL;
      case DataSource.RECEIVE_TIMEOUT:
        return ResponseCode.RECEIVE_TIMEOUT;
      case DataSource.SEND_TIMEOUT:
        return ResponseCode.SEND_TIMEOUT;
      case DataSource.CACHE_ERROR:
        return ResponseCode.CACHE_ERROR;
      case DataSource.NO_INTERNET_CONNECTION:
        return ResponseCode.NO_INTERNET_CONNECTION;
      case DataSource.DEFAULT:
        return ResponseCode.DEFAULT;
      default:
        return ResponseCode.DEFAULT;
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleError(error);
    } else {
      apiErrorModel = DataSource.DEFAULT.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECEIVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.data != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
    default:
      return DataSource.DEFAULT.getFailure();
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
