import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/errors/messages/validation_error_messages.dart';
import '../../../../core/theme/app_colors.dart';

class CutomPinPut extends StatelessWidget {
  const CutomPinPut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pinput(
        keyboardType: TextInputType.number,
        validator: (value) => ValidationErrorTexts.otpValidation(value),
        length: 4,
        defaultPinTheme: PinTheme(
          width: 64.w,
          height: 64.h,
          textStyle: GoogleFonts.poppins(
            fontSize: 25.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.pinPutBorderColor,
              width: 2.w,
            ),
          ),
        ),
        focusedPinTheme: PinTheme(
          width: 64.w,
          height: 64.h,
          textStyle: GoogleFonts.poppins(
            fontSize: 25.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.currentPinPutBorderColor,
              width: 2.w,
            ),
          ),
        ),
        errorTextStyle: GoogleFonts.poppins(
          fontSize: 18.sp,
          color: Colors.red.withOpacity(0.8),
          fontWeight: FontWeight.w500,
        ),
        showCursor: true,
      ),
    );
  }
}
