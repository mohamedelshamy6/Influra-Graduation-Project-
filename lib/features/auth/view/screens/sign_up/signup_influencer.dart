import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/errors/messages/validation_error_messages.dart';
import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../logic/cubit/cubit/auth_cubit.dart';
import '../../widgets/already_have_account.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/auth_title_svg.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpInfluencer extends StatefulWidget {
  const SignUpInfluencer({super.key});

  @override
  State<SignUpInfluencer> createState() => _SignUpInfluencerState();
}

class _SignUpInfluencerState extends State<SignUpInfluencer> {
  late AuthCubit authCubit;

  @override
  void initState() {
    authCubit = BlocProvider.of<AuthCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    authCubit.close();
    authCubit.emailController.dispose();
    authCubit.passwordController.dispose();
    authCubit.fullNameController.dispose();
    authCubit.passwordConfirmationController.dispose();
    super.dispose();
  }

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
                  const Hero(
                    tag: 'signUpBusiness',
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AuthHeader(authHeader: 'Sign Up as influencer'),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomTFF(
                    controller: authCubit.fullNameController,
                    hintText: 'Full name',
                    prefixIcon: SvgPicture.asset(Assets.iconsAuthPerson),
                    kbType: TextInputType.name,
                    validate: (value) {
                      return ValidationErrorTexts.fullNameValidation(value);
                    },
                  ),
                  SizedBox(height: 32.h),
                  Hero(
                    tag: 'email',
                    child: Material(
                      color: Colors.transparent,
                      child: CustomTFF(
                        controller: authCubit.emailController,
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
                      color: Colors.transparent,
                      child: CustomTFF(
                        controller: authCubit.passwordController,
                        hintText: 'Password',
                        prefixIcon: SvgPicture.asset(Assets.iconsAuthLock),
                        kbType: TextInputType.visiblePassword,
                        validate: (value) {
                          return ValidationErrorTexts.signUpPasswordValidation(
                            value,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomTFF(
                    controller: authCubit.passwordConfirmationController,
                    hintText: 'Confirm password',
                    prefixIcon: SvgPicture.asset(Assets.iconsAuthLock),
                    kbType: TextInputType.visiblePassword,
                    validate: (value) {
                      return ValidationErrorTexts.confirmPasswordValidation(
                        value,
                        authCubit.passwordController.text,
                      );
                    },
                  ),
                  SizedBox(height: 32.h),
                  Hero(
                    tag: 'signUp',
                    child: CustomButton(
                      buttonText: 'Next',
                      buttonAction: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(
                            context,
                            Routes.continueSignUpInfluencer,
                            arguments: [
                              authCubit.emailController.text,
                              authCubit.passwordController.text,
                              authCubit.fullNameController.text,
                              authCubit.passwordConfirmationController.text
                            ],
                          );
                        }
                      },
                      buttonStyle: AppTextStyles.poppinsBold15White,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const AlreadyHaveAccount(
                    goTo: 'influencerLogin',
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
