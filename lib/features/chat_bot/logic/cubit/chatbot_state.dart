part of 'chatbot_cubit.dart';

@immutable
sealed class ChatbotState {}

final class ChatbotInitial extends ChatbotState {}

final class ChatbotSuccess extends ChatbotState {
  final AnswerModel? answerModel;
  ChatbotSuccess(this.answerModel);
}

final class ChatbotFailure extends ChatbotState {
  final String error;
  ChatbotFailure(this.error);
}

final class ChatbotLoading extends ChatbotState {}

final class MessageAdded extends ChatbotState {}
