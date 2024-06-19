import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_colors.dart';

import '../../../../core/theme/app_text_styles.dart';

class ProfileDetails extends StatelessWidget {
  final IconData icon;
  final String title, detail;
  const ProfileDetails(
      {super.key,
      required this.icon,
      required this.title,
      required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 64.h,
          width: 64.w,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.mainBlue),
          ),
          child: Center(
            child: Icon(
              icon,
              color: AppColors.mainBlue,
              size: 50.r,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.poppinsSemiBold20Blue),
              SizedBox(height: 8.h),
              Text(
                detail,
                style: AppTextStyles.poppinsRegular16SecoondaryBlue
                    .copyWith(fontSize: 18.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
