class AnswerModel {
  final String? message;

  AnswerModel({required this.message});

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(message: json['message']);
  }
}
