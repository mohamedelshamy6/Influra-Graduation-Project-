import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/routing/routes.dart';
import 'package:influra/core/theme/app_text_styles.dart';
import 'package:influra/core/widgets/custom_button.dart';
import 'package:influra/features/forget_password/view/widgets/contact_detalis.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int? groupValue;

  void onChanged(int value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: AppTextStyles.poppinsBold24black,
              ),
              SizedBox(height: 8.h),
              Text(
                'Select which contact details should we use\nto reset yout password',
                style: AppTextStyles.poppinsRegular16SecoondaryBlue,
              ),
              SizedBox(height: 110.h),
              ContactDetails(
                value: 0,
                groupValue: groupValue,
                title: 'Email',
                onChanged: onChanged,
                icon: Icons.email_outlined,
                hintText: '**********@gmail.com',
              ),
              SizedBox(height: 16.h),
              ContactDetails(
                value: 1,
                groupValue: groupValue,
                title: 'Phone Number',
                onChanged: onChanged,
                icon: Icons.phone_outlined,
                hintText: '********123',
              ),
              const Spacer(),
              CustomButton(
                buttonText: 'Continue',
                buttonAction: groupValue == null
                    ? null
                    : () {
                        Navigator.pushNamed(
                          context,
                          Routes.resetPassword,
                          arguments: groupValue,
                        );
                      },
                buttonStyle: AppTextStyles.poppinsBold26white,
                height: 64.h,
              ),
              SizedBox(height: 64.h),
            ],
          ),
        ),
      ),
    );
  }
}
