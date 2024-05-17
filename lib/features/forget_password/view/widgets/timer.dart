import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_colors.dart';

import '../../../../core/theme/app_text_styles.dart';

class TimerCode extends StatefulWidget {
  const TimerCode({
    super.key,
  });

  @override
  State<TimerCode> createState() => _TimerCodeState();
}

class _TimerCodeState extends State<TimerCode> {
  int resendTime = 15;
  bool codeSent = false;

  sendCodeTimer() {
    setState(() {
      codeSent = true;
    });

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime--;
        if (resendTime == 0) {
          timer.cancel();
          resendTime = 15;
        }
      });
    });
    Timer(const Duration(seconds: 15), () {
      setState(() {
        codeSent = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: codeSent ? null : sendCodeTimer,
            child: Text(
              'Resend code',
              style: codeSent
                  ? AppTextStyles.poppinsBold15blue.copyWith(
                      color: AppColors.pinPutBorderColor,
                      fontSize: 18.sp,
                    )
                  : AppTextStyles.poppinsBold15blue.copyWith(
                      fontSize: 18.sp,
                    ),
            ),
          ),
          codeSent
              ? Text(
                  '($resendTime)',
                  style: AppTextStyles.poppinsRegular16SecoondaryBlue,
                )
              : Container(),
        ],
      ),
    );
  }
}
