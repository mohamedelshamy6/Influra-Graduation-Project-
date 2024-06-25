import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/helpers/app_images.dart';
import 'package:influra/core/widgets/custom_text_form_field.dart';
import 'package:influra/features/chat_bot/logic/cubit/chatbot_cubit.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatbotCubit chatbotCubit;
  @override
  void initState() {
    super.initState();
    chatbotCubit = BlocProvider.of<ChatbotCubit>(context);
  }

  @override
  void dispose() {
    chatbotCubit.close();
    chatbotCubit.messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.mainBlue),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mic,
                color: AppColors.mainBlue,
                size: 32.sp,
              ),
            ),
          ),
        ],
        title: Row(
          children: [
            Image.asset(Assets.imagesRobot, height: 24.h, width: 36.w),
            SizedBox(width: 8.w),
            Text(
              'Chat bot',
              style: AppTextStyles.poppinsBold30Blue.copyWith(fontSize: 24.sp),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<ChatbotCubit, ChatbotState>(
            buildWhen: (previous, current) => current is MessageAdded,
            builder: (context, state) {
              if (chatbotCubit.messages.isEmpty) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 300.h),
                      child: Text(
                        'Ask Me Any Question',
                        style: AppTextStyles.poppinsBold30Blue,
                      ),
                    ),
                    const Spacer(),
                    CustomTFF(
                      controller: chatbotCubit.messageController,
                      hintText: 'write your message',
                      kbType: TextInputType.multiline,
                      suffixIcon: IconButton(
                        onPressed: () async {
                          chatbotCubit.askBot(
                            'chat',
                            data: {
                              'instruction': chatbotCubit.messageController.text
                            },
                          );
                          chatbotCubit
                              .addMessage(chatbotCubit.messageController.text);
                          chatbotCubit.messageController.clear();
                        },
                        icon: const Icon(Icons.send),
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            chatbotCubit.messages.length,
                            (index) => Align(
                              alignment: index % 2 == 0
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                constraints: BoxConstraints(
                                    minWidth: 64.w, maxWidth: 300.w),
                                padding: const EdgeInsets.all(12.0),
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: index % 2 == 0
                                      ? AppColors.mainBlue
                                      : AppColors.homeCategoryCardsColor,
                                  borderRadius: index % 2 == 0
                                      ? const BorderRadius.only(
                                          bottomLeft: Radius.circular(25),
                                          bottomRight: Radius.circular(25),
                                          topLeft: Radius.circular(25),
                                        )
                                      : const BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          bottomRight: Radius.circular(25),
                                          topLeft: Radius.circular(25),
                                        ),
                                ),
                                child: index % 2 == 0
                                    ? Text(chatbotCubit.messages[index],
                                        style: AppTextStyles
                                            .poppinsMedium14Black
                                            .copyWith(color: Colors.white))
                                    : Text(
                                      chatbotCubit.messages[index],
                                      style: AppTextStyles
                                          .poppinsMedium14Black,
                                      textAlign: TextAlign.left,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomTFF(
                      controller: chatbotCubit.messageController,
                      hintText: 'write your message',
                      kbType: TextInputType.multiline,
                      suffixIcon: IconButton(
                        onPressed: () {
                          chatbotCubit.askBot('chat', data: {
                            'instruction': chatbotCubit.messageController.text
                          });
                          chatbotCubit
                              .addMessage(chatbotCubit.messageController.text);
                          chatbotCubit.messageController.clear();
                        },
                        icon: const Icon(Icons.send),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
