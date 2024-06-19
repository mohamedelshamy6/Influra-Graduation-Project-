import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.buttonAction,
    required this.buttonStyle,
    this.height,
    this.width, this.backgroundColor=AppColors.mainBlue,
  });

  final String buttonText;
  final TextStyle buttonStyle;
  final void Function()? buttonAction;
  final double? height;
  final double? width;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      child: MaterialButton(
        disabledColor: AppColors.secondaryBlue,
        disabledTextColor: AppColors.contactDetailsWayUnselectedColor,
        onPressed: buttonAction,
        padding: EdgeInsets.zero,
        color: backgroundColor ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: buttonStyle,
          ),
        ),
      ),
    );
  }
}
