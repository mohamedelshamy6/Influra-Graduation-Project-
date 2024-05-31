import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_border_button.dart';

class SearchSugg extends StatelessWidget {
  final String name, image, category;
  const SearchSugg({
    super.key,
    required this.name,
    required this.image,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundImage: AssetImage(image),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.poppinsSemiBold16Black,
            ),
            Text(
              category,
              style: AppTextStyles.poppinsRegular14Black,
            ),
          ],
        ),
        const Spacer(),
        CustomBorderButton(
          buttonText: 'Follow',
          buttonAction: () {},
          buttonStyle: AppTextStyles.poppinsMedium14Black,
          width: 120.w,
        ),
      ],
    );
  }
}
