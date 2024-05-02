import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ContactDetails extends StatelessWidget {
  final int value;
  final int? groupValue;
  final String title;
  final String hintText;
  final void Function(int) onChanged;
  final IconData icon;
  const ContactDetails({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChanged,
    required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    bool selected = (value == groupValue);

    return InkWell(
      splashFactory: NoSplash.splashFactory,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      onTap: () {
        onChanged(value);
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: selected
              ? Border.all(color: AppColors.mainBlue)
              : Border.all(color: AppColors.contactDetailsWayBorderColor),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              height: 64.h,
              width: 64.w,
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.mainBlue
                    : AppColors.contactDetailsWayUnselectedColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 32.r,
                  color: selected ? Colors.white : AppColors.mainBlue,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.poppinsBold24black
                      .copyWith(fontSize: 18.sp),
                ),
                SizedBox(height: 4.h),
                Text(
                  hintText,
                  style: AppTextStyles.poppinsRegular16SecoondaryBlue,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
