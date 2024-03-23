import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_text_styles.dart';

import '../helpers/app_colors.dart';

class CustomTFF extends StatefulWidget {
  final String hintText;
  final TextInputType kbType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final dynamic validate;
  const CustomTFF({
    Key? key,
    this.suffixIcon,
    this.prefixIcon,
    required this.hintText,
    required this.kbType,
    this.controller,
    this.validate,
  }) : super(key: key);

  @override
  State<CustomTFF> createState() => _CustomTFFState();
}

class _CustomTFFState extends State<CustomTFF> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    var borderSide = const BorderSide(
      color: AppColors.mainBlue,
      width: 2,
    );
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        obscureText: widget.hintText == 'Password' ||
                widget.hintText == 'Confirm password'
            ? showPassword
                ? false
                : true
            : false,
        style: AppTextStyles.interRegular15Blue,
        textAlignVertical: TextAlignVertical.center,
        controller: widget.controller,
        decoration: InputDecoration(
          hintFadeDuration: const Duration(milliseconds: 100),
          prefixIcon: Padding(
            padding: EdgeInsets.all(16.r),
            child: widget.prefixIcon,
          ),
          suffixIcon: widget.hintText == 'Password' ||
                  widget.hintText == 'Confirm password'
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.mainBlue,
                  ),
                )
              : widget.suffixIcon,
          prefixIconColor: AppColors.mainBlue,
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: borderSide,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: borderSide,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: borderSide,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
            borderSide: borderSide,
          ),
          hintText: widget.hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.h),
          hintStyle: AppTextStyles.interRegular15Blue.copyWith(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
