import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class InfluencersCard extends StatelessWidget {
  final void Function() onTap;

  final String name;
  final String description;
  final String category;
  final String image;

  const InfluencersCard({
    super.key,
    required this.onTap,
    required this.name,
    required this.description,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned(
            top: 60.h,
            child: SizedBox(
              width: 200.w,
              height: 250.h,
              child: Card(
                color: AppColors.homeCategoryCardsColor,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 35.h, left: 8.w, right: 8.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.poppinsBold22Black,
                        ),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          softWrap: true,
                          style: AppTextStyles.poppinsRegular16SecoondaryBlue
                              .copyWith(
                            color: Colors.black54,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          category,
                          style: AppTextStyles.poppinsSemiBold16Black
                              .copyWith(fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 26.w,
            top: 16.h,
            child: Transform.rotate(
              angle: 0.20,
              child: SizedBox(
                height: 120.h,
                width: 140.w,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 4,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            right: 75.w,
            child: CircleAvatar(
              backgroundColor: AppColors.mainBlue.withOpacity(0.9),
              radius: 24.r,
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    size: 24.r,
                    Icons.message,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
