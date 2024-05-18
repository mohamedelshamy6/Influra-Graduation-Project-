import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    super.key,
    required this.influenersImages,
    required this.name,
    required this.category,
  });

  final String influenersImages;
  final String name;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: Image.asset(
            influenersImages,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(width: 16.w),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextStyles.poppinsSemiBold16Black,
              ),
              Text(
                category,
                style: AppTextStyles.poppinsMedium14Black,
              ),
              const Spacer(),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    size: 26.r,
                    color: Colors.yellow[700],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
