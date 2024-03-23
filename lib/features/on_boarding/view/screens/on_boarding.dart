import 'package:flutter/material.dart';
import 'package:influra/core/helpers/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainBlue,
      body: Center(
        child: Text('Fake'),
      ),
    );
  }
}
