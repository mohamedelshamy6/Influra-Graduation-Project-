import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/helpers/app_colors.dart';
import 'package:influra/core/helpers/app_images.dart';
import 'package:influra/core/widgets/custom_text_form_field.dart';
import 'package:influra/features/auth/view/widgets/already_have_account.dart';
import 'package:influra/features/auth/view/widgets/auth_header.dart';
import 'package:influra/features/auth/view/widgets/auth_title_svg.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpBusinessOwner extends StatelessWidget {
  const SignUpBusinessOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.mainBlue, size: 36.r),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            bottom: 16.h,
          ),
          child: ListView(
            shrinkWrap: true,
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
                prefixIcon: SvgPicture.asset(Assets.iconsPerson),
                kbType: TextInputType.name,
              ),
              SizedBox(height: 32.h),
              CustomTFF(
                hintText: 'Email',
                prefixIcon: SvgPicture.asset(Assets.iconsEmail),
                kbType: TextInputType.emailAddress,
              ),
              SizedBox(height: 32.h),
              CustomTFF(
                hintText: 'Business type',
                prefixIcon: SvgPicture.asset(Assets.iconsBusiness),
                kbType: TextInputType.text,
              ),
              SizedBox(height: 32.h),
              CustomTFF(
                hintText: 'Password',
                prefixIcon: SvgPicture.asset(Assets.iconsLock),
                kbType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 32.h),
              CustomTFF(
                hintText: 'Confirm password',
                prefixIcon: SvgPicture.asset(Assets.iconsLock),
                kbType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 32.h),
              Hero(
                tag: 'signUp',
                child: CustomButton(
                  buttonText: 'Sign Up',
                  buttonAction: () {},
                  buttonStyle: AppTextStyles.interBold15White,
                ),
              ),
              const AlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}