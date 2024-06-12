import 'package:flutter/material.dart';
import 'package:influra/core/routing/app_routes.dart';
import 'package:influra/features/influencer_account/influencer_account.dart';
import 'package:influra/features/influencer_settings/influencer_settings.dart';
import 'package:influra/features/influencer_settings/view/widgets/custom_settings_tile.dart';

class InfluencerSettingsBody extends StatelessWidget {
  const InfluencerSettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomSettingsTile(title: 'Account',icon: Icons.person_2_outlined,fun: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const InfluencerAccount()));
          },),
          CustomSettingsTile(title: 'Notifications',icon: Icons.notifications_none_rounded,fun: (){},),
          CustomSettingsTile(title: 'Change Language',icon: Icons.language_outlined,fun: (){},),
          CustomSettingsTile(title: 'Terms & Conditions',icon: Icons.description_outlined,fun: (){},),
          CustomSettingsTile(title: 'Privacy Policy',icon: Icons.lock_outline_rounded,fun: (){},),
          CustomSettingsTile(title: 'About',icon: Icons.error_outline,fun: (){},),
          CustomSettingsTile(title: 'Chat Bot',icon: Icons.android,fun: (){},),
          CustomSettingsTile(title: 'Logout',icon: Icons.logout,fun: (){},),
        ],
      ),
    );
  }
}
