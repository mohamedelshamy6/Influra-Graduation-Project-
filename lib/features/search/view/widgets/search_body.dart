import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_constants.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'search_suggestions.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
              splashColor: Colors.transparent,
              child: SearchSugg(
                name: AppConstants.influenersNames[index],
                image: AppConstants.influenersImages[index],
                category: AppConstants.influenersCategories[index],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 60.w, top: 12.h),
              child: Text(
                '${((index + 1) * 2 + 12) * 2}k Followers',
                style: AppTextStyles.poppinsMedium14Black
                    .copyWith(fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) =>
          const Divider(color: AppColors.mainBlue),
      itemCount: 6,
    );
  }
}
