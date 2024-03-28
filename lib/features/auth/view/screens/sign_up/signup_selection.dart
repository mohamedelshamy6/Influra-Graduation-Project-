import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../widgets/already_have_account.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/auth_title_svg.dart';

class SignUpSelection extends StatelessWidget {
  const SignUpSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 64.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthTitleSvg(),
                SizedBox(height: 98.h),
                const AuthHeader(authHeader: 'Sign Up as'),
                SizedBox(height: 98.h),
                Hero(
                  tag: 'signUp',
                  child: CustomButton(
                    buttonStyle: AppTextStyles.interBold15White,
                    buttonText: 'Sign Up as influencer',
                    buttonAction: () =>
                        Navigator.pushNamed(context, Routes.signUpInfluencer),
                  ),
                ),
                SizedBox(height: 48.h),
                Center(
                  child: Text(
                    'Or',
                    style: AppTextStyles.interBold30Blue,
                  ),
                ),
                SizedBox(height: 48.h),
                Hero(
                  tag: 'signUpBusiness',
                  child: CustomButton(
                    buttonText: 'Sign Up as business owner',
                    buttonAction: () => Navigator.pushNamed(
                      context,
                      Routes.signUpBusinessOwner,
                    ),
                    buttonStyle: AppTextStyles.interBold15White,
                  ),
                ),
                SizedBox(height: 150.h),
                const AlreadyHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
