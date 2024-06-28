import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_border_button.dart';
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
                      buttonText: 'Back to Login',
                      buttonAction: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.loginScreen, (route) => false,
                            arguments: 'businessLogin');
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

  static void showCustomSnackBarSuccess(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          textAlign: TextAlign.left,
          style: AppTextStyles.poppinsBold15White,
        ),
        backgroundColor: AppColors.mainBlue,
        duration: const Duration(seconds: 3),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        elevation: 4,
      ),
    );
  }

  static void showCustomSnackBarError(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          textAlign: TextAlign.left,
          style: AppTextStyles.poppinsBold15White,
        ),
        backgroundColor: AppColors.tFFErrorColor,
        duration: const Duration(seconds: 3),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        elevation: 4,
      ),
    );
  }

  static Future<Widget?> showLoadingAlertDialog(context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: AbsorbPointer(
          absorbing: true,
          child: AlertDialog.adaptive(
            contentPadding: EdgeInsets.zero,
            backgroundColor: AppColors.mainBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: SizedBox(
              height: 200.h,
              width: 100.w,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Future<Widget?> showLogoutAlertDialog(
      context, Function() buttonAction) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        content: SizedBox(
          height: 277.h,
          width: 325.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  height: 120.h,
                  width: 120.w,
                  child: const Center(
                    child: Icon(
                      Icons.error,
                      color: AppColors.tFFErrorColor,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'هل تريد تسجيل الخروج من حسابك ؟',
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.poppinsSemiBold16Black
                      .copyWith(fontSize: 14.sp),
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        buttonText: 'تسجيل الخروج',
                        buttonAction: buttonAction,
                        height: 35.h,
                        buttonStyle: AppTextStyles.poppinsSemiBold16Black
                            .copyWith(color: Colors.white, fontSize: 14.sp),
                        backgroundColor: AppColors.tFFErrorColor,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomBorderButton(
                        buttonText: 'إلغاء',
                        buttonAction: () {
                          Navigator.pop(context);
                        },
                        height: 30.h,
                        buttonStyle: AppTextStyles.poppinsSemiBold16Black
                            .copyWith(
                                color: AppColors.mainBlue, fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              ],
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

  static AppBar influencerAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.mainBlue,
      leading: const SizedBox(),
      title: SvgPicture.asset(
        height: 30.h,
        Assets.svgsInfluraWhite,
      ),
    );
  }
}
