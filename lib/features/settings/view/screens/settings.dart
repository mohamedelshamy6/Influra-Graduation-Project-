import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/helpers/app_images.dart';
import 'package:influra/core/theme/app_colors.dart';

import '../widgets/settings_body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> settingsIcons = [
      Assets.iconsSettingsPerson,
      Assets.iconsSettingsNotification,
      Assets.iconsSettingsLanguage,
      Assets.iconsSettingsDocs,
      Assets.iconsSettingsLock,
      Assets.iconsSettingsAbout,
      Assets.iconsSettingsChatBot,
      Assets.iconsSettingsChat,
      Assets.iconsSettingsLogout,
    ];
    List<String> settingsTitle = [
      "Profile",
      "Notifications",
      "Change Language",
      "Terms & Conditions",
      "Privacy Policy",
      "About",
      "Chat Bot",
      "Request",
      "Logout",
    ];
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 32.h, right: 32.w, left: 32.w),
        child: ListView.separated(
          itemBuilder: (context, index) => SettingsBody(
            settingsIcon: settingsIcons[index],
            settingsTitle: settingsTitle[index],
            onTap: () {},
          ),
          separatorBuilder: (context, index) => const Divider(
            color: AppColors.mainBlue,
          ),
          itemCount: settingsIcons.length,
        ),
      ),
    );
  }
}
