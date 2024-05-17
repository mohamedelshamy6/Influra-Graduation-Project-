import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/errors/messages/validation_error_messages.dart';
import '../../../../../core/routing/routes.dart';
import '../../widgets/social_integration.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/auth_title_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            bottom: 16.h,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AuthTitleSvg(),
                  SizedBox(height: 32.h),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: AuthHeader(authHeader: 'Sign in'),
                  ),
                  SizedBox(height: 32.h),
                  Hero(
                    tag: 'email',
                    child: Material(
                      child: CustomTFF(
                        hintText: 'Email',
                        prefixIcon: SvgPicture.asset(Assets.iconsAuthEmail),
                        kbType: TextInputType.emailAddress,
                        validate: (value) {
                          return ValidationErrorTexts.emailValidation(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Hero(
                    tag: 'password',
                    child: Material(
                      child: CustomTFF(
                        hintText: 'Password',
                        prefixIcon: SvgPicture.asset(Assets.iconsAuthLock),
                        kbType: TextInputType.visiblePassword,
                        validate: (value) {
                          return ValidationErrorTexts.loginPasswordValidation(
                              value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: const ButtonStyle(
                        overlayColor:
                            MaterialStatePropertyAll(Colors.transparent),
                        splashFactory: NoSplash.splashFactory,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.forgotPassword);
                      },
                      child: Text(
                        'Forgot password?',
                        style: AppTextStyles.poppinsBold15blue.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.mainBlue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomButton(
                    buttonText: 'Sign in',
                    buttonAction: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    buttonStyle: AppTextStyles.poppinsBold15White,
                  ),
                  SizedBox(height: 48.h),
                  SocialIntegration(
                    title: 'Or sign in with',
                    integrateWithFacebook: () {},
                    integrateWithGoogle: () {},
                    integrateWithInsta: () {},
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: AppTextStyles.poppinsRegular15Blue,
                      ),
                      TextButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () =>
                            Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.signUpSelection,
                          (Route<dynamic> route) => false,
                        ),
                        child: Text(
                          'Sign Up',
                          style: AppTextStyles.poppinsBold15blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
