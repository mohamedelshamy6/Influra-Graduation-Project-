import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:influra/features/chat_bot/data/model/answer_model.dart';

import '../../../../core/errors/api/exceptions/api_exception.dart';
import '../../../../core/networking/api_services.dart';

class AnswerRepo {
  late ApiServices apiServices;
  AnswerRepo(
    this.apiServices,
  );
  Future<Either<String, AnswerModel>> askBot(String path,
      {dynamic data}) async {
    try {
      var response = await Dio().post(
        path,
        data: data,
      );
      var result = AnswerModel.fromJson(response.data);
      return Right(result);
    } on ApiException catch (e) {
      return Left(e.errorModel.message!);
    }
  }
}
