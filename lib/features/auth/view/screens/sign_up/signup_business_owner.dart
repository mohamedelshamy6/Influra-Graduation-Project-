import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../widgets/already_have_account.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/auth_title_svg.dart';
import '../../widgets/social_integration.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpBusinessOwner extends StatelessWidget {
  const SignUpBusinessOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            bottom: 16.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AuthTitleSvg(),
                SizedBox(height: 32.h),
                const Hero(
                  tag: 'signUpBusiness',
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AuthHeader(authHeader: 'Sign Up as business owner'),
                  ),
                ),
                SizedBox(height: 32.h),
                CustomTFF(
                  hintText: 'Full name',
                  prefixIcon: SvgPicture.asset(Assets.iconsAuthPerson),
                  kbType: TextInputType.name,
                ),
                SizedBox(height: 32.h),
                Hero(
                  tag: 'email',
                  child: Material(
                    child: CustomTFF(
                      hintText: 'Email',
                      prefixIcon: SvgPicture.asset(Assets.iconsAuthEmail),
                      kbType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                CustomTFF(
                  hintText: 'Business type',
                  prefixIcon: SvgPicture.asset(Assets.iconsAuthBusiness),
                  kbType: TextInputType.text,
                ),
                SizedBox(height: 32.h),
                Hero(
                  tag: 'password',
                  child: Material(
                    child: CustomTFF(
                      hintText: 'Password',
                      prefixIcon: SvgPicture.asset(Assets.iconsAuthLock),
                      kbType: TextInputType.visiblePassword,
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                CustomTFF(
                  hintText: 'Confirm password',
                  prefixIcon: SvgPicture.asset(Assets.iconsAuthLock),
                  kbType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 32.h),
                Hero(
                  tag: 'signUp',
                  child: CustomButton(
                    buttonText: 'Sign Up',
                    buttonAction: () {},
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
                const AlreadyHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
