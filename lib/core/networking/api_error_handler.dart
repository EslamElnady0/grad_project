import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
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
        return ApiErrorModel(
            message:
                _getLocalizedErrorMessage(DioExceptionType.connectionError));
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(
            message:
                _getLocalizedErrorMessage(DioExceptionType.connectionTimeout));
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
            message:
                _getLocalizedErrorMessage(DioExceptionType.receiveTimeout));
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(
            message: _getLocalizedErrorMessage(DioExceptionType.sendTimeout));
      case DioExceptionType.cancel:
        return ApiErrorModel(
            message: _getLocalizedErrorMessage(DioExceptionType.cancel));
      case DioExceptionType.unknown:
        return ApiErrorModel(
            message: _getLocalizedErrorMessage(DioExceptionType.unknown));
      case DioExceptionType.badResponse:
        return _handleError(error.response?.data);
      default:
        return ApiErrorModel(
            message: _getLocalizedErrorMessage(DioExceptionType.unknown));
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

String _getLocalizedErrorMessage(DioExceptionType dioExceptionType) {
  final isArabic = Intl.getCurrentLocale() == 'ar';
  switch (dioExceptionType) {
    case DioExceptionType.connectionError:
      return isArabic
          ? "خطأ في الاتصال بالخادم"
          : "Connection error with the server";
    case DioExceptionType.connectionTimeout:
      return isArabic
          ? "انتهت مهلة الاتصال بالخادم"
          : "Connection timeout with the server";
    case DioExceptionType.receiveTimeout:
      return isArabic
          ? "انتهت مهلة استلام البيانات من الخادم"
          : "Timeout while receiving data from the server";
    case DioExceptionType.sendTimeout:
      return isArabic
          ? "انتهت مهلة إرسال البيانات إلى الخادم"
          : "Timeout while sending data to the server";
    case DioExceptionType.cancel:
      return isArabic
          ? "تم إلغاء الطلب إلى الخادم"
          : "The request to the server was canceled";
    case DioExceptionType.unknown:
      return isArabic ? "حدث خطأ غير متوقع" : "An unexpected error occurred";
    case DioExceptionType.badResponse:
      return isArabic
          ? "استجابة سيئة من الخادم"
          : "Bad response from the server";
    default:
      break;
  }
  return "An error occurred";
}
