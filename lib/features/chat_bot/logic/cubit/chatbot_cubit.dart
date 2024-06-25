import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:influra/features/chat_bot/data/repository/answer_repo.dart';
import 'package:meta/meta.dart';

import '../../data/model/answer_model.dart';

part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  ChatbotCubit() : super(ChatbotInitial());
  List<String> messages = [];
  late AnswerRepo answerRepo;
  TextEditingController messageController = TextEditingController();

  void addMessage(String message) {
    messages.add(message);
    log('message: $message');
    log('messagelist: $messages');
    emit(MessageAdded());
  }

  Future<void> postQuestionsAnswers(
    String path, {
    dynamic data,
  }) async {
    emit(ChatbotLoading());
    var response = await answerRepo.askBot(
      path,
      data: data,
    );

    response.fold((error) {
      emit(ChatbotFailure(error));
    }, (model) {
      emit(ChatbotSuccess(model));
      messages.add(model.message!);
      emit(MessageAdded());
    });
  }
}
