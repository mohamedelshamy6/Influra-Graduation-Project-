import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_text_styles.dart';
import 'package:influra/core/widgets/custom_button.dart';
import 'package:influra/features/settings/view/screens/edit_owner_profile.dart';
import 'package:influra/features/settings/view/widgets/profile_details.dart';

import '../../../../core/theme/app_colors.dart';

class OwnerProfile extends StatelessWidget {
  const OwnerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: AppTextStyles.poppinsSemiBold30Blue,
        ),
        centerTitle: true,
        actions: [
          CustomButton(
            buttonText: 'Edit',
            buttonAction: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditOwnerProfile()));
            },
            buttonStyle: AppTextStyles.poppinsBold15White,
            width: 60.w,
          ),
          SizedBox(width: 10.w)
        ],
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: AppColors.homeCategoryCardsColor,
              radius: 80,
              child: Icon(
                Icons.person,
                size: 80.r,
                color: AppColors.mainBlue,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: const ProfileDetails(
              icon: Icons.person,
              title: 'Name',
              detail: 'Mohamed Elshamy',
            ),
          ),
          SizedBox(height: 32.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: const ProfileDetails(
              icon: Icons.location_on_outlined,
              title: 'Address',
              detail: 'Cairo',
            ),
          ),
          SizedBox(height: 32.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: const ProfileDetails(
              icon: Icons.phone,
              title: 'Phone Number',
              detail: '+20 1234567890',
            ),
          ),
          SizedBox(height: 32.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: const ProfileDetails(
              icon: Icons.mail_outlined,
              title: 'E-mail',
              detail: 'elshamy15@gmail.com',
            ),
          ),
        ],
      ),
    );
  }
}
