import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/features/forget_password/view/widgets/timer.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/pinput.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verification Code',
                    style: AppTextStyles.poppinsBold24black,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Enter the verification code that we have\nsent to your phone number',
                    style: AppTextStyles.poppinsRegular16SecoondaryBlue,
                  ),
                  SizedBox(height: 110.h),
                  const CutomPinPut(),
                  SizedBox(height: 16.h),
                  const TimerCode(),
                  SizedBox(height: 32.h),
                  CustomButton(
                    buttonText: 'Continue',
                    buttonAction: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                          context,
                          Routes.newPassword,
                        );
                      }
                    },
                    buttonStyle: AppTextStyles.poppinsBold26white,
                    height: 64.h,
                  ),
                  SizedBox(height: 64.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
