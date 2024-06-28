import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/routing/routes.dart';
import '../../../../core/errors/messages/error_messages.dart';
import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/helper_methods.dart';
import '../../../../core/theme/app_colors.dart';

import '../../../auth/logic/cubit/cubit/auth_cubit.dart';
import '../widgets/settings_body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
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
      child: BlocListener<AuthCubit, AuthState>(
        listenWhen: (previous, current) =>
            current is LogoutFailed ||
            current is LogoutSuccess ||
            current is LogoutLoading,
        listener: (context, state) {
          if (state is LogoutSuccess) {
            Navigator.pop(context);
            HelperMethods.showCustomSnackBarSuccess(
              context,
              'You have been Logged out Successfully',
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.signUpSelection,
              (route) => false,
            );
          }
          if (state is LogoutLoading) {
            HelperMethods.showLoadingAlertDialog(context);
          }
          if (state is LogoutFailed) {
            Navigator.pop(context);
            HelperMethods.showCustomSnackBarError(
              context,
              ErrorMessages.errorMessage(state.error),
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.only(top: 32.h, right: 32.w, left: 32.w),
          child: ListView.separated(
            itemBuilder: (context, index) => SettingsBody(
              settingsIcon: settingsIcons[index],
              settingsTitle: settingsTitle[index],
              onTap: () {
                if (settingsTitle[index].contains('Language')) {
                  Navigator.of(context).pushNamed(Routes.language);
                }
                if (settingsTitle[index].contains('Notifications')) {
                  Navigator.of(context).pushNamed(Routes.notifications);
                }
                if (settingsTitle[index].contains('Policy')) {
                  Navigator.of(context).pushNamed(Routes.privacyPolicy);
                }
                if (settingsTitle[index].contains('Terms')) {
                  Navigator.of(context).pushNamed(Routes.terms);
                }
                if (settingsTitle[index].contains('Chat')) {
                  Navigator.of(context).pushNamed(Routes.startChatBot);
                }
                if (settingsTitle[index].contains('Profile')) {
                  Navigator.of(context).pushNamed(Routes.ownerProfile);
                }
                if (settingsTitle[index].contains('Request')) {
                  Navigator.of(context).pushNamed(Routes.requests);
                }
                if (settingsTitle[index].contains('Logout')) {
                  authCubit.logout('logout/bussiness');
                }
              },
            ),
            separatorBuilder: (context, index) => const Divider(
              color: AppColors.mainBlue,
            ),
            itemCount: settingsIcons.length,
          ),
        ),
      ),
    );
  }
}
