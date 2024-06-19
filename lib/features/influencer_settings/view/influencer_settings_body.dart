import 'package:flutter/material.dart';
import 'package:influra/core/routing/routes.dart';
import 'package:influra/features/influencer_settings/view/widgets/custom_settings_tile.dart';

class InfluencerSettingsBody extends StatelessWidget {
  const InfluencerSettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CustomSettingsTile(
              title: 'Account',
              icon: Icons.person_2_outlined,
              fun: () {
                Navigator.pushNamed(context, Routes.influencerAccount);
              },
            ),
            CustomSettingsTile(
              title: 'Notifications',
              icon: Icons.notifications_none_rounded,
              fun: () {
                Navigator.pushNamed(context, Routes.notifications);
              },
            ),
            CustomSettingsTile(
              title: 'Change Language',
              icon: Icons.language_outlined,
              fun: () {
                Navigator.pushNamed(context, Routes.language);
              },
            ),
            CustomSettingsTile(
              title: 'Terms & Conditions',
              icon: Icons.description_outlined,
              fun: () {
                Navigator.pushNamed(context, Routes.terms);
              },
            ),
            CustomSettingsTile(
              title: 'Privacy Policy',
              icon: Icons.lock_outline_rounded,
              fun: () {
                Navigator.pushNamed(context, Routes.privacyPolicy);
              },
            ),
            CustomSettingsTile(
              title: 'About',
              icon: Icons.error_outline,
              fun: () {},
            ),
            CustomSettingsTile(
              title: 'Chat Bot',
              icon: Icons.android,
              fun: () {
                Navigator.pushNamed(context, Routes.startChatBot);
              },
            ),
            CustomSettingsTile(
              title: 'Logout',
              icon: Icons.logout,
              fun: () {},
            ),
          ],
        ),
      ),
    );
  }
}
