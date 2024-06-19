import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_colors.dart';
import 'package:influra/core/widgets/custom_button.dart';
import 'package:influra/features/influencer_edite_profile/view/widgets/account_drop_down_field.dart';
import 'package:influra/features/influencer_edite_profile/view/widgets/account_text_field.dart';

import '../../../../core/theme/app_text_styles.dart';

class EditOwnerProfile extends StatelessWidget {
  const EditOwnerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: AppTextStyles.poppinsSemiBold30Blue,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.homeCategoryCardsColor,
                  radius: 80,
                  child: Icon(
                    Icons.person,
                    size: 80.r,
                    color: AppColors.mainBlue,
                  ),
                ),
                const PositionedDirectional(
                    bottom: 0,
                    end: 0,
                    child: CircleAvatar(
                        backgroundColor: AppColors.currentPinPutBorderColor,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ))),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            AccountTextField(
              title: 'Name',
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 15.h,
            ),
            AccountTextField(
              title: 'Email',
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 15.h,
            ),
            AccountTextField(
              title: 'Password',
              controller: TextEditingController(),
              secure: true,
            ),
            SizedBox(
              height: 15.h,
            ),
            const AccountDropDownField(
              title: 'Date of Birth',
            ),
            SizedBox(
              height: 15.h,
            ),
            const AccountDropDownField(
              title: 'Country',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomButton(
          buttonText: 'Save Changes',
          buttonAction: () {},
          buttonStyle: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
