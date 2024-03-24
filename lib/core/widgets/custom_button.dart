import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.buttonAction,
    required this.buttonStyle,
  });

  final String buttonText;
  final TextStyle buttonStyle;
  final Function() buttonAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: MaterialButton(
        onPressed: buttonAction,
        padding: EdgeInsets.zero,
        color: AppColors.mainBlue,
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
