import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class SocialIntegration extends StatelessWidget {
  final String title;

  final Function() integrateWithFacebook;
  final Function() integrateWithGoogle;
  final Function() integrateWithInsta;
  const SocialIntegration({
    super.key,
    required this.title,
    required this.integrateWithFacebook,
    required this.integrateWithGoogle,
    required this.integrateWithInsta,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: AppColors.mainBlue,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                title,
                style: AppTextStyles.poppinsBold15blue,
              ),
            ),
            const Expanded(
              child: Divider(
                color: AppColors.mainBlue,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 250.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PlatformCard(
                integrateWith: integrateWithGoogle,
                platformIcon: Assets.iconsAuthGoogle,
              ),
              PlatformCard(
                integrateWith: integrateWithFacebook,
                platformIcon: Assets.iconsAuthFacbookFilledBlue,
              ),
              PlatformCard(
                integrateWith: integrateWithInsta,
                platformIcon: Assets.iconsAuthInstaColored,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PlatformCard extends StatelessWidget {
  const PlatformCard({
    super.key,
    required this.integrateWith,
    required this.platformIcon,
  });

  final Function() integrateWith;
  final String platformIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: integrateWith,
      child: SizedBox(
        height: 60.h,
        width: 60.h,
        child: Card(
          surfaceTintColor: Colors.white,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          color: Colors.white,
          child: Center(
            child: SvgPicture.asset(
              width: 30.w,
              height: 30.h,
              platformIcon,
            ),
          ),
        ),
      ),
    );
  }
}
