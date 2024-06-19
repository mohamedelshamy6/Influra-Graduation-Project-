import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/helpers/app_images.dart';
import 'package:influra/core/routing/routes.dart';
import 'package:influra/core/theme/app_text_styles.dart';
import 'package:influra/core/widgets/custom_button.dart';

class StartChatBot extends StatelessWidget {
  const StartChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your AI Assistant',
                style:
                    AppTextStyles.poppinsBold30Blue.copyWith(fontSize: 36.sp),
              ),
              SizedBox(height: 16.h),
              Text(
                'Using this software,you can ask you\nquestions and receive articles using\nartificial intelligence assistant',
                style: AppTextStyles.poppinsRegular16SecoondaryBlue,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 64.h),
              Image.asset(
                Assets.imagesChatBot,
                height: 390.h,
              ),
              SizedBox(height: 48.h),
              CustomButton(
                buttonText: 'Continue',
                height: 60.h,
                buttonAction: () {
                  Navigator.pushNamed(context, Routes.chatBot);
                },
                buttonStyle: AppTextStyles.poppinsBold26white,
              ),
              SizedBox(height: 24.h),
              CustomButton(
                buttonText: 'Back',
                width: 124.w,
                buttonAction: () {
                  Navigator.pop(context);
                },
                buttonStyle: AppTextStyles.poppinsBold26white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
