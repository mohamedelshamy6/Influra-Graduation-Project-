import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:influra/core/errors/messages/validation_error_messages.dart';
import 'package:influra/core/helpers/helper_methods.dart';
import 'package:influra/core/widgets/custom_text_form_field.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
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
                    'Create New Password',
                    style: AppTextStyles.poppinsBold24black,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Your password must be different from\nprevious used password',
                    style: AppTextStyles.poppinsRegular16SecoondaryBlue,
                  ),
                  SizedBox(height: 98.h),
                  CustomTFF(
                    controller: passwordController,
                    prefixIcon: SvgPicture.asset(Assets.iconsAuthLock),
                    hintText: 'New Password',
                    kbType: TextInputType.visiblePassword,
                    validate: (value) {
                      return ValidationErrorTexts.signUpPasswordValidation(
                          value);
                    },
                  ),
                  SizedBox(height: 32.h),
                  CustomTFF(
                    controller: confirmPasswordController,
                    prefixIcon: SvgPicture.asset(Assets.iconsAuthLock),
                    hintText: 'Confirm New Password',
                    kbType: TextInputType.visiblePassword,
                    validate: (value) {
                      return ValidationErrorTexts.confirmPasswordValidation(
                        value,
                        passwordController.text,
                      );
                    },
                  ),
                  SizedBox(height: 64.h),
                  CustomButton(
                    buttonText: 'Continue',
                    buttonAction: () {
                      if (formKey.currentState!.validate()) {
                        HelperMethods.showLoadingAlertDialog(context);
                        Timer(const Duration(seconds: 3), () {
                          Navigator.pop(context);
                          HelperMethods.showNewPasswordSuccessDialog(context);
                        });
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
