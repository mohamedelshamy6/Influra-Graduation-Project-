import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/helpers/app_constants.dart';
import 'package:influra/core/theme/app_colors.dart';
import 'package:influra/core/theme/app_text_styles.dart';
import 'package:influra/core/widgets/custom_button.dart';
import 'package:influra/features/settings/view/screens/request_body.dart';

List requestsName = [
  AppConstants.influenersNames[0],
  AppConstants.influenersNames[1],
  AppConstants.influenersNames[2]
];
List requestsCategory = [
  AppConstants.influenersCategories[0],
  AppConstants.influenersCategories[1],
  AppConstants.influenersCategories[2]
];
List requestsImage = [
  AppConstants.influenersImages[0],
  AppConstants.influenersImages[1],
  AppConstants.influenersImages[2]
];

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
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
              requestsName.length,
              (index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestBody(
                        title: Text(
                          index == 1
                              ? 'Accepted'
                              : index == 2
                                  ? 'Submitted'
                                  : 'Waiting',
                          style: AppTextStyles.poppinsBold24black.copyWith(
                            color: index == 1
                                ? Colors.green
                                : index == 2
                                    ? AppColors.secondaryBlue
                                    : null,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundImage: AssetImage(requestsImage[index]),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(requestsName[index],
                              style: AppTextStyles.poppinsMedium16Blue),
                          SizedBox(height: 4.h),
                          Text(requestsCategory[index],
                              style: AppTextStyles.poppinsRegular14Black
                                  .copyWith(color: AppColors.secondaryBlue)),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        index == 1
                            ? 'Accepted'
                            : index == 2
                                ? 'Submitted'
                                : 'Waiting',
                        style: AppTextStyles.poppinsRegular14Black.copyWith(
                          color: index == 1
                              ? Colors.green
                              : index == 2
                                  ? AppColors.secondaryBlue
                                  : null,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      CustomButton(
                        buttonText: 'Cancel',
                        buttonAction: () {
                          setState(() {
                            requestsCategory.removeAt(index);
                            requestsImage.removeAt(index);
                            requestsName.removeAt(index);
                          });
                        },
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
      ),
    );
  }
}
