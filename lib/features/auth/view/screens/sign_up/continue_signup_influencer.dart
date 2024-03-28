import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../widgets/already_have_account.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/auth_title_svg.dart';

class ContinueSignUpInfluencer extends StatelessWidget {
  const ContinueSignUpInfluencer({super.key});

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
          child: ListView(
            shrinkWrap: true,
            children: [
              const AuthTitleSvg(),
              SizedBox(height: 32.h),
              const Hero(
                tag: 'signUp',
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:
                      AuthHeader(authHeader: 'Continue sign Up as influencer'),
                ),
              ),
              SizedBox(height: 32.h),
              CustomTFF(
                hintText: 'Link for Facebook ',
                prefixIcon: SvgPicture.asset(Assets.iconsFacebook),
                kbType: TextInputType.url,
              ),
              SizedBox(height: 32.h),
              CustomTFF(
                hintText: 'Link for Instagram ',
                prefixIcon: SvgPicture.asset(Assets.iconsInsta),
                kbType: TextInputType.url,
              ),
              SizedBox(height: 32.h),
              CustomTFF(
                hintText: 'Link for Youtube',
                prefixIcon: SvgPicture.asset(Assets.iconsYoutube),
                kbType: TextInputType.url,
              ),
              SizedBox(height: 32.h),
              CustomTFF(
                hintText: 'Link for X ',
                prefixIcon: SvgPicture.asset(Assets.iconsTwitter),
                kbType: TextInputType.url,
              ),
              SizedBox(height: 32.h),
              Hero(
                tag: 'signUpBusiness',
                child: CustomButton(
                  buttonText: 'Sign up',
                  buttonAction: () {},
                  buttonStyle: AppTextStyles.interBold15White,
                ),
              ),
              SizedBox(height: 16.h),
              const AlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
