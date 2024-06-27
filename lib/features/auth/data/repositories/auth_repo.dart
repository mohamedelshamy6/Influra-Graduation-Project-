import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/api/exceptions/api_exception.dart';
import '../../../../core/networking/api_services.dart';
import '../models/login_model.dart';
import '../models/logout_model.dart';
import '../models/sign_up_bussiness_model.dart';
import '../models/sign_up_influencer_model.dart';

class AuthRepo {
  late ApiServices apiServices;

  AuthRepo(this.apiServices);

  Future<Either<String, LoginModel>> login(
    String path,
    dynamic data,
  ) async {
    try {
      var response = await apiServices.post(
        path,
        data: data,
      );
      var result = LoginModel.fromJson(response);
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.errorModel.message!);
    }
  }

  Future<Either<String, LogoutModel>> logout(
    String path,
    String token,
  ) async {
    try {
      var response = await apiServices.post(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      LogoutModel result = LogoutModel.fromJson(response);
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.errorModel.message!);
    }
  }

  Future<Either<String, SignUpBussinessModel>> signUpBussiness(
    String path,
    dynamic data,
  ) async {
    try {
      var response = await apiServices.post(
        path,
        data: data,
      );
      var result = SignUpBussinessModel.fromJson(response);
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.errorModel.message!);
    }
  }

  Future<Either<String, SignUpInfluencerModel>> signUpInfluencer(
    String path,
    dynamic data,
  ) async {
    try {
      var response = await apiServices.post(
        path,
        data: data,
      );
      var result = SignUpInfluencerModel.fromJson(response);
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.errorModel.message!);
    }
  }
}
