import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/errors/messages/error_messages.dart';
import 'package:influra/core/helpers/helper_methods.dart';
import '../../../../../core/errors/messages/validation_error_messages.dart';
import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../logic/cubit/cubit/auth_cubit.dart';
import '../../widgets/already_have_account.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/auth_title_svg.dart';
import '../../widgets/social_integration.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpBusinessOwner extends StatefulWidget {
  const SignUpBusinessOwner({super.key});

  @override
  State<SignUpBusinessOwner> createState() => _SignUpBusinessOwnerState();
}

class _SignUpBusinessOwnerState extends State<SignUpBusinessOwner> {
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
    authCubit.bussinessTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              bottom: 16.h,
            ),
            child: BlocListener<AuthCubit, AuthState>(
              listenWhen: (previous, current) =>
                  current is SignUpBusinessFailed ||
                  current is SignUpBusinessSuccess ||
                  current is SignUpBusinessLoading,
              listener: (context, state) {
                if (state is SignUpBusinessSuccess) {
                  Navigator.pop(context);
                  HelperMethods.showCustomSnackBarSuccess(
                    context,
                    'Your account has been created Successfully',
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.loginScreen,
                    arguments: 'businessLogin',
                    (route) => false,
                  );
                }
                if (state is SignUpBusinessLoading) {
                  HelperMethods.showLoadingAlertDialog(context);
                }
                if (state is SignUpBusinessFailed) {
                  Navigator.pop(context);
                  HelperMethods.showCustomSnackBarError(
                    context,
                    ErrorMessages.errorMessage(state.error),
                  );
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AuthTitleSvg(),
                    SizedBox(height: 32.h),
                    const Hero(
                      tag: 'signUpBusiness',
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:
                            AuthHeader(authHeader: 'Sign Up as business owner'),
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
                    CustomTFF(
                      controller: authCubit.bussinessTypeController,
                      hintText: 'Business type',
                      prefixIcon: SvgPicture.asset(Assets.iconsAuthBusiness),
                      kbType: TextInputType.text,
                      validate: (value) {
                        return ValidationErrorTexts.categoryValidation(value);
                      },
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
                            return ValidationErrorTexts
                                .signUpPasswordValidation(value);
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
                            value, authCubit.passwordController.text);
                      },
                    ),
                    SizedBox(height: 32.h),
                    Hero(
                      tag: 'signUp',
                      child: CustomButton(
                        buttonText: 'Sign Up',
                        buttonAction: () {
                          if (formKey.currentState!.validate()) {
                            authCubit.signUpBussiness(
                              'register_bussiness',
                              {
                                'name': authCubit.fullNameController.text,
                                'email': authCubit.emailController.text,
                                'password': authCubit.passwordController.text,
                                'category_id': '1'
                              },
                            );
                          }
                        },
                        buttonStyle: AppTextStyles.poppinsBold15White,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    SocialIntegration(
                      title: 'Or Sign Up With',
                      integrateWithGoogle: () {},
                      integrateWithFacebook: () {},
                      integrateWithInsta: () {},
                    ),
                    const AlreadyHaveAccount(
                      goTo: 'businessLogin',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
