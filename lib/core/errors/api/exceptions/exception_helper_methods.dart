import 'package:dio/dio.dart';

import '../models/error_model.dart';
import 'api_exception.dart';

class ExceptionHelperMethods {
  ExceptionHelperMethods._();

  static handleDioExceptionsTypes(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throwApiException();
      case DioExceptionType.sendTimeout:
        throwApiException();
      case DioExceptionType.receiveTimeout:
        throwApiException();
      case DioExceptionType.badCertificate:
        throwApiException();
      case DioExceptionType.cancel:
        throwApiException();
      case DioExceptionType.unknown:
        throwApiException();
      case DioExceptionType.badResponse:
        badResponseErrorHandle(e);
      case DioExceptionType.connectionError:
        throw ApiException(
          errorModel: ErrorModel.fromJson(noInternetErrorMessage),
        );
      default:
        throwApiException();
    }
  }

  static void badResponseErrorHandle(DioException e) {
    switch (e.response?.statusCode) {
      case 400:
        badResponseExceptionThrow(e);
      case 401:
        badResponseExceptionThrow(e);
      case 403:
        badResponseExceptionThrow(e);
      case 404:
        badResponseExceptionThrow(e);
      case 409:
        badResponseExceptionThrow(e);
      case 422:
        badResponseExceptionThrow(e);
      case 502:
        badResponseExceptionThrow(e);
      case 504:
        badResponseExceptionThrow(e);
      case 302:
        badResponseExceptionThrow(e);
      default:
        badResponseExceptionThrow(e);
    }
  }

  static void badResponseExceptionThrow(DioException e) {
    if (e.response != null || e.response!.data != null) {
      if (e.response!.data is String) {
        throw ApiException(
          errorModel: ErrorModel.fromJson({'message': '${e.response!.data}'}),
        );
      } else if (e.response!.data is Map<String, dynamic>) {
        throw ApiException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      } else {
        throwApiException();
      }
    } else {
      throwApiException();
    }
  }

  static void throwApiException() {
    throw ApiException(
      errorModel: ErrorModel.fromJson(connectionErrorMessage),
    );
  }

  static Map<String, dynamic> get connectionErrorMessage =>
      {'message': 'Something went wrong , try again later.'};

  static Map<String, dynamic> get noInternetErrorMessage =>
      {'message': 'Check your internet connection.'};
}
