import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_text_styles.dart';

import '../theme/app_colors.dart';

class CustomTFF extends StatefulWidget {
  final String hintText;
  final TextInputType kbType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height;
  final dynamic validate;
  final void Function(String)? onChanged;
  const CustomTFF({
    Key? key,
    this.suffixIcon,
    this.prefixIcon,
    required this.hintText,
    required this.kbType,
    this.controller,
    this.validate,
    this.height,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTFF> createState() => _CustomTFFState();
}

class _CustomTFFState extends State<CustomTFF> {
  bool showPassword = false;
  String content = '';

  @override
  Widget build(BuildContext context) {
    var borderSide = const BorderSide(
      color: AppColors.mainBlue,
      width: 2,
    );
    return SizedBox(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: widget.hintText == 'Password' ||
                widget.hintText == 'New Password' ||
                widget.hintText == 'Confirm password' ||
                widget.hintText == 'Confirm New Password'
            ? showPassword
                ? false
                : true
            : false,
        style: AppTextStyles.poppinsRegular15Blue,
        textAlignVertical: TextAlignVertical.center,
        validator: widget.validate,
        onChanged: widget.onChanged ??
            (value) {
              setState(() {
                content = value;
              });
            },
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon == null
              ? null
              : Padding(
                  padding: EdgeInsets.all(16.r),
                  child: widget.prefixIcon,
                ),
          suffixIcon: widget.hintText == 'Password' ||
                  widget.hintText == 'New Password' ||
                  widget.hintText == 'Confirm password' ||
                  widget.hintText == 'Confirm New Password'
              ? IconButton(
                  style: const ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
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
          errorStyle: AppTextStyles.valdiationError,
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
          hintStyle: AppTextStyles.poppinsRegular15Blue.copyWith(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
