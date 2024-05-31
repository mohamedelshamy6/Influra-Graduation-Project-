import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_images.dart';

import '../routing/routes.dart';
import '../theme/app_text_styles.dart';
import '../widgets/custom_button.dart';

class HelperMethods {
  HelperMethods._();
  static Future<dynamic> showNewPasswordSuccessDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: PopScope(
          canPop: false,
          child: AlertDialog.adaptive(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SizedBox(
              height: 400.h,
              width: 335.w,
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.svgsDone,
                      height: 120.h,
                      width: 120.w,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Password Update\nSuccessfully',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.poppinsBold22Black,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Password changed succesfully\nYou can login again with new password',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.poppinsRegular16SecoondaryBlue,
                    ),
                    SizedBox(height: 32.h),
                    CustomButton(
                      buttonText: 'Back to Home',
                      buttonAction: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.loginScreen,
                          (route) => false,
                        );
                      },
                      buttonStyle: AppTextStyles.poppinsBold15White,
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

  static void svgPrecacheImage() {
    const cacheSvgImages = [
      Assets.iconsAuthBusiness,
      Assets.iconsAuthEmail,
      Assets.iconsAuthFacbookFilledBlue,
      Assets.iconsAuthFacebook,
      Assets.iconsAuthGoogle,
      Assets.iconsAuthInsta,
      Assets.iconsAuthInstaColored,
      Assets.iconsAuthLock,
      Assets.iconsAuthPerson,
      Assets.iconsAuthTwitter,
      Assets.iconsAuthYoutube,
      Assets.svgsInflura,
      Assets.svgsInfluraWhite,
      Assets.svgsDone,
    ];

    for (String element in cacheSvgImages) {
      var loader = SvgAssetLoader(element);
      svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }
}
