import 'dart:developer';

import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  late ApiErrorModel apiErrorModel;

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      return dioExceptionHandlers(error);
    } else {
      log(error.toString());
      return ApiErrorModel(message: "Something went wrong");
    }
  }

  static ApiErrorModel dioExceptionHandlers(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionError:
        return ApiErrorModel(message: "Connection error with the server");
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(message: "Connection timeout with the server");
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
            message: "Timeout while receiving data from the server");
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(
            message: "Timeout while sending data to the server");
      case DioExceptionType.cancel:
        return ApiErrorModel(message: "The request to the server was canceled");
      case DioExceptionType.unknown:
        return ApiErrorModel(message: "An unexpected error occurred");
      case DioExceptionType.badResponse:
        return _handleError(error.response?.data);
      default:
        return ApiErrorModel(message: "Something went wrong");
    }
  }
}

//to show map of errors like email, password etc required
ApiErrorModel _handleError(dynamic errorResponse) {
  return ApiErrorModel(
    message: errorResponse["message"] ?? "An unknown error occurred",
    code: errorResponse["code"],
    errors: errorResponse['errors'],
  );
}
