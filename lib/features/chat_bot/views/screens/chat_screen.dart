import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/helpers/app_images.dart';
import 'package:influra/core/widgets/custom_text_form_field.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      'Hello chatGPT,how are you today?',
      'Hello,i’m fine,how can i help you?',
      'What is the best programming language?',
      'There are many programming languages ​​in the market that are used in designing and building websites, various applications and other tasks. All these languages ​​are popular in their place and in the way they are used, and many programmers learn and use them.',
      'So explain to me more'
    ];
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
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      5,
                      (index) => Align(
                        alignment: index % 2 == 0
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          constraints:
                              BoxConstraints(minWidth: 64.w, maxWidth: 300.w),
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
                          child: Text(
                            texts[index],
                            style: index % 2 == 0
                                ? AppTextStyles.poppinsMedium14Black
                                    .copyWith(color: Colors.white)
                                : AppTextStyles.poppinsMedium14Black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              CustomTFF(
                hintText: 'write your message',
                kbType: TextInputType.multiline,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
