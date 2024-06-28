import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:influra/core/errors/messages/error_messages.dart';
import 'package:influra/core/helpers/app_constants.dart';
import 'package:influra/core/helpers/helper_methods.dart';
import '../../../../../core/errors/messages/validation_error_messages.dart';
import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/routing/routes.dart';
import '../../../logic/cubit/cubit/auth_cubit.dart';
import '../../widgets/social_integration.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/auth_title_svg.dart';

class LoginScreen extends StatefulWidget {
  final String toGo;
  const LoginScreen({super.key, required this.toGo});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthCubit authCubit;
  @override
  void initState() {
    super.initState();
    authCubit = BlocProvider.of<AuthCubit>(context);
  }

  @override
  void dispose() {
    authCubit.close();
    authCubit.emailController.dispose();
    authCubit.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              current is LoginSuccess ||
              current is LoginFailed ||
              current is LoginLoading,
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pop(context);
              CacheHelper().saveData(
                  key: AppConstants.token, value: state.loginModel.data!.token);
              Navigator.pushNamedAndRemoveUntil(
                context,
                widget.toGo == 'influencerLogin'
                    ? Routes.influencerNavbar
                    : Routes.botNavbar,
                (route) => false,
              );
            }
            if (state is LoginFailed) {
              Navigator.pop(context);
              HelperMethods.showCustomSnackBarError(
                  context, ErrorMessages.errorMessage(state.error));
            }
            if (state is LoginLoading) {
              HelperMethods.showLoadingAlertDialog(context);
            }
          },
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
                        child: CustomTFF(
                          controller: authCubit.passwordController,
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
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.transparent,
                            overlayColor: Colors.transparent),
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
                      buttonAction: () async {
                        if (formKey.currentState!.validate()) {
                          authCubit.login(
                            widget.toGo != 'influencerLogin'
                                ? 'login_bussiness'
                                : 'login',
                            {
                              'email': authCubit.emailController.text,
                              'password': authCubit.passwordController.text
                            },
                          );
                        }
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
                            padding: WidgetStatePropertyAll(EdgeInsets.zero),
                            overlayColor:
                                WidgetStatePropertyAll(Colors.transparent),
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
      ),
    );
  }
}
