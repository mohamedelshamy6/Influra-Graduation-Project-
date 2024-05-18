import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_colors.dart';
import 'package:influra/core/theme/app_text_styles.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    super.key,
    required this.categoriesImages,
    required this.categories,
    required this.onTap,
  });

  final String categoriesImages;
  final String categories;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColors.homeCategoryCardsColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 4,
        child: Padding(
          padding:
              EdgeInsets.only(top: 12.h, left: 12.w, bottom: 2.h, right: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  categoriesImages,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                categories,
                style: AppTextStyles.poppinsSemiBold20Blue,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
