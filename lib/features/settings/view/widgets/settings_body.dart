import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({
    super.key,
    required this.settingsIcon,
    required this.settingsTitle,
    this.onTap,
  });

  final String settingsIcon;
  final String settingsTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      splashColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        child: Row(
          children: [
            SizedBox(
              height: 24.h,
              width: 24.w,
              child: Image.asset(
                settingsIcon,
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              settingsTitle,
              style: AppTextStyles.poppinsRegular16SecoondaryBlue
                  .copyWith(color: AppColors.mainBlue),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.mainBlue,
              size: 24.r,
            ),
          ],
        ),
      ),
    );
  }
}
