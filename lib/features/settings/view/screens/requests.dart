import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/helpers/app_constants.dart';
import 'package:influra/core/theme/app_colors.dart';
import 'package:influra/core/theme/app_text_styles.dart';
import 'package:influra/core/widgets/custom_button.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Requests',
          style: AppTextStyles.poppinsSemiBold30Blue,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(
              3,
              (index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundImage:
                          AssetImage(AppConstants.influenersImages[index]),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppConstants.influenersNames[index],
                            style: AppTextStyles.poppinsMedium16Blue),
                        SizedBox(height: 4.h),
                        Text(AppConstants.influenersCategories[index],
                            style: AppTextStyles.poppinsRegular14Black
                                .copyWith(color: AppColors.secondaryBlue)),
                      ],
                    ),
                    const Spacer(),
                    Text('Waiting', style: AppTextStyles.poppinsRegular14Black),
                    SizedBox(width: 16.w),
                    CustomButton(
                      buttonText: 'Cancel',
                      buttonAction: () {},
                      buttonStyle: AppTextStyles.poppinsBold15White
                          .copyWith(fontSize: 12.sp),
                      width: 75.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
