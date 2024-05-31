import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class HomeBodyTitle extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const HomeBodyTitle({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.poppinsSemiBold30Blue,
          ),
          const Spacer(),
          TextButton(
            style: const ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size.zero),
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: MaterialStatePropertyAll(
                EdgeInsets.zero,
              ),
            ),
            onPressed: onPressed,
            child: Text(
              'more',
              style: AppTextStyles.poppinsMedium16Blue.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.mainBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
