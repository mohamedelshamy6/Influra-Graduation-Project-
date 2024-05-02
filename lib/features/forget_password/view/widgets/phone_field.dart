import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/features/forget_password/logic/cubit/forget_password_cubit.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    InputBorder myBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: const BorderSide(
        color: AppColors.mainBlue,
        width: 2,
      ),
    );
    return IntlPhoneField(
      onChanged: (value) {
        BlocProvider.of<ForgetPasswordCubit>(context).onNumberChanged(value.number);
        log(value.number);
      },
      textAlignVertical: TextAlignVertical.center,
      validator: (value) {
        if (value == null || value.number == '' || value.number.isEmpty) {
          return 'Please Enter Your Phone Number';
        }
        if (value.number.contains(RegExp(r'[^\w\s]+')) ||
            value.completeNumber.contains(RegExp(r'[^\w\s]+')) ||
            value.number.contains('_') ||
            value.completeNumber.contains('_')) {
          return 'Please Enter Valid Phone Number';
        }
        return 'null';
      },
      decoration: InputDecoration(
        errorStyle: AppTextStyles.valdiationError,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h),
        hintText: '2666 666 66',
        hintStyle: AppTextStyles.poppinsRegular15Blue.copyWith(
          color: Colors.black.withOpacity(0.6),
        ),
        enabledBorder: myBorder,
        focusedBorder: myBorder,
        errorBorder: myBorder,
        focusedErrorBorder: myBorder,
      ),
      languageCode: "en",
      keyboardType: TextInputType.phone,
    );
  }
}
