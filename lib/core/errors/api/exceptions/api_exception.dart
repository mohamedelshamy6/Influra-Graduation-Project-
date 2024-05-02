import '../models/error_model.dart';

class ApiException implements Exception {
  final ErrorModel errorModel;

  ApiException({
    required this.errorModel,
  });
}
