import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:influra/core/networking/api_services.dart';
import 'package:influra/features/home/data/models/infleuncer_model.dart';

import '../../../../core/errors/api/exceptions/api_exception.dart';

class HomeRepo {
  late ApiServices apiServices;
  HomeRepo(
     this.apiServices
  );

  Future<Either<String, InfluencerModel>> getInfluencers(
      String path, String token) async {
    try {
      var response = await apiServices.get(
        path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      InfluencerModel result = InfluencerModel.fromJson(response);
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.errorModel.message!);
    }
  }
}
