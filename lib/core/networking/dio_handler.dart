import 'package:dio/dio.dart';

import '../errors/api/exceptions/exception_helper_methods.dart';
import 'api_services.dart';

class DioHandler extends ApiServices {
  late Dio dio;

  DioHandler() {
    BaseOptions baseOptions = BaseOptions(
      //todo change base url
      //* baseUrl: AppConstants.baseUrl,
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      connectTimeout: const Duration(seconds: 20),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br'
      },
    );
    dio = Dio(baseOptions);
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    dynamic options,
  }) async {
    try {
      Response response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException catch (e) {
      throw ExceptionHelperMethods.handleDioExceptionsTypes(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    dynamic options,
  }) async {
    try {
      var response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException catch (e) {
      throw ExceptionHelperMethods.handleDioExceptionsTypes(e);
    }
  }

  @override
  Future update(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    dynamic options,
  }) async {
    try {
      Response response = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException catch (e) {
      throw ExceptionHelperMethods.handleDioExceptionsTypes(e);
    }
  }

  @override
  Future get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dynamic options,
  }) async {
    try {
      Response response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException catch (e) {
      throw ExceptionHelperMethods.handleDioExceptionsTypes(e);
    }
  }
}