import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CustomSettingsTile extends StatelessWidget {
  const CustomSettingsTile(
      {Key? key, required this.fun, required this.title, required this.icon})
      : super(key: key);
  final void Function() fun;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              icon,
              color: AppColors.currentPinPutBorderColor,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: AppColors.mainBlue,
            ),
            title: Text(
              title,
              style: AppTextStyles.poppinsMedium16Blue.copyWith(fontSize: 18),
            ),
          ),
          const Divider(
            color: AppColors.currentPinPutBorderColor,
            indent: 15,
            endIndent: 15,
          )
        ],
      ),
    );
  }
}
