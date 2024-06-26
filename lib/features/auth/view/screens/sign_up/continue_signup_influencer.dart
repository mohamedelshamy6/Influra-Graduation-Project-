import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:influra/core/errors/messages/error_messages.dart';
import 'package:influra/core/helpers/helper_methods.dart';

import '../../../../../core/errors/messages/validation_error_messages.dart';
import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../logic/cubit/cubit/auth_cubit.dart';
import '../../widgets/already_have_account.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/auth_title_svg.dart';

class ContinueSignUpInfluencer extends StatefulWidget {
  final String name, email, password, passwordConfirmation;
  const ContinueSignUpInfluencer(
      {super.key,
      required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirmation});

  @override
  State<ContinueSignUpInfluencer> createState() =>
      _ContinueSignUpInfluencerState();
}

class _ContinueSignUpInfluencerState extends State<ContinueSignUpInfluencer> {
  late AuthCubit authCubit;

  @override
  void initState() {
    authCubit = BlocProvider.of<AuthCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    authCubit.close();
    authCubit.xLinkController.dispose();
    authCubit.youtubeLinkController.dispose();
    authCubit.faceBookLinkController.dispose();
    authCubit.instagramLinkController.dispose();
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
              current is SignUpInfluencerFailed ||
              current is SignUpInfluencerSuccess ||
              current is SignUpInfluencerLoading,
          listener: (context, state) {
            if (state is SignUpInfluencerFailed) {
              Navigator.pop(context);
              HelperMethods.showCustomSnackBarError(
                  context, ErrorMessages.errorMessage(state.error));
            }
            if (state is SignUpInfluencerSuccess) {
              Navigator.pop(context);
              HelperMethods.showCustomSnackBarSuccess(
                  context, 'Your account has been created Successfully');
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.loginScreen, (route) => false,
                  arguments: 'influencerLogin');
            }
            if (state is SignUpInfluencerLoading) {
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
                    const Hero(
                      tag: 'signUp',
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AuthHeader(
                            authHeader: 'Continue sign Up as influencer'),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    CustomTFF(
                      controller: authCubit.faceBookLinkController,
                      hintText: 'Link for Facebook ',
                      prefixIcon: SvgPicture.asset(Assets.iconsAuthFacebook),
                      kbType: TextInputType.url,
                      validate: (value) {
                        return ValidationErrorTexts.urlValidation(value);
                      },
                    ),
                    SizedBox(height: 32.h),
                    CustomTFF(
                      controller: authCubit.instagramLinkController,
                      hintText: 'Link for Instagram ',
                      prefixIcon: SvgPicture.asset(Assets.iconsAuthInsta),
                      kbType: TextInputType.url,
                      validate: (value) {
                        return ValidationErrorTexts.urlValidation(value);
                      },
                    ),
                    SizedBox(height: 32.h),
                    CustomTFF(
                      controller: authCubit.youtubeLinkController,
                      hintText: 'Link for Youtube',
                      prefixIcon: SvgPicture.asset(Assets.iconsAuthYoutube),
                      kbType: TextInputType.url,
                      validate: (value) {
                        return ValidationErrorTexts.urlValidation(value);
                      },
                    ),
                    SizedBox(height: 32.h),
                    CustomTFF(
                      controller: authCubit.xLinkController,
                      hintText: 'Link for X ',
                      prefixIcon: SvgPicture.asset(Assets.iconsAuthTwitter),
                      kbType: TextInputType.url,
                      validate: (value) {
                        return ValidationErrorTexts.urlValidation(value);
                      },
                    ),
                    SizedBox(height: 32.h),
                    Hero(
                      tag: 'signUpBusiness',
                      child: CustomButton(
                        buttonText: 'Sign up',
                        buttonAction: () {
                          if (formKey.currentState!.validate()) {
                            authCubit.signUpInfluencer(
                              'register',
                              {
                                'email': widget.email,
                                'password': widget.password,
                                'name': widget.name,
                                'category_id': ' 1',
                                'instagram':
                                    authCubit.instagramLinkController.text,
                                'facebook':
                                    authCubit.faceBookLinkController.text,
                                'youtube': authCubit.youtubeLinkController.text,
                                'twitter': authCubit.xLinkController.text,
                                'password_confirmation':
                                    widget.passwordConfirmation,
                              },
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
      ),
    );
  }
}
