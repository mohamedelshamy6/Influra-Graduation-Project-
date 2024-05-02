import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/errors/messages/validation_error_messages.dart';
import 'package:influra/core/routing/routes.dart';
import 'package:influra/core/theme/app_colors.dart';
import 'package:influra/core/widgets/custom_text_form_field.dart';
import 'package:influra/features/forget_password/logic/cubit/forget_password_cubit.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/phone_field.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class ResetPasswordScreen extends StatelessWidget {
  final int value;
  const ResetPasswordScreen({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: SingleChildScrollView(
              child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reset Password',
                        style: AppTextStyles.poppinsBold24black,
                      ),
                      SizedBox(height: 8.h),
                      value == 0
                          ? Text(
                              'Enter your email, we will send a verification\ncode to your email',
                              style:
                                  AppTextStyles.poppinsRegular16SecoondaryBlue,
                            )
                          : Text(
                              'Enter your phone number, we will send a\nverification code to  phone number',
                              style:
                                  AppTextStyles.poppinsRegular16SecoondaryBlue,
                            ),
                      SizedBox(height: 110.h),
                      value == 0
                          ? CustomTFF(
                              onChanged: (value) {
                                BlocProvider.of<ForgetPasswordCubit>(context)
                                    .onEmailChanged(value);
                              },
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: AppColors.mainBlue,
                              ),
                              hintText: 'Hello@gmail.com',
                              kbType: TextInputType.emailAddress,
                              validate: (value) {
                                return ValidationErrorTexts.emailValidation(
                                  value,
                                );
                              },
                            )
                          : const PhoneField(),
                      SizedBox(height: 48.h),
                      CustomButton(
                        buttonText: 'Continue',
                        buttonAction: value == 0
                            ? emailContinueButton(context)
                            : phoneNumContinueButton(context),
                        buttonStyle: AppTextStyles.poppinsBold26white,
                        height: 64.h,
                      ),
                      SizedBox(height: 64.h),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  emailContinueButton(BuildContext context) {
    final forgetPasswordCubit = BlocProvider.of<ForgetPasswordCubit>(context);
    return forgetPasswordCubit.email == null ||
            forgetPasswordCubit.email!.isEmpty
        ? null
        : () {
            if (formKey.currentState!.validate()) {
              Navigator.pushNamed(context, Routes.verificationCode);
            }
          };
  }

  phoneNumContinueButton(BuildContext context) {
    final forgetPasswordCubit = BlocProvider.of<ForgetPasswordCubit>(context);
    return forgetPasswordCubit.phoneNumber == null ||
            forgetPasswordCubit.phoneNumber!.isEmpty
        ? null
        : () {
            if (formKey.currentState!.validate()) {
              Navigator.pushNamed(context, Routes.verificationCode);
            }
          };
  }
}
