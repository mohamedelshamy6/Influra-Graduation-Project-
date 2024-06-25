import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:influra/core/theme/app_colors.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController firstFadeAnimationController;

  late Animation<double> firstFadeAnimation;
  bool isShowWelcomeText = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    myFirstFadeAnimation();
    timer = Timer(const Duration(milliseconds: 3500), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.signUpSelection,
        (route) => false,
      );
    });
  }

  void myFirstFadeAnimation() {
    firstFadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..forward();
    firstFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
          parent: firstFadeAnimationController, curve: Curves.easeInQuad),
    );
  }

  @override
  void dispose() {
    firstFadeAnimationController.dispose();
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      body: Center(
        child: FadeTransition(
          opacity: firstFadeAnimation,
          child: SvgPicture.asset(
            Assets.svgsInfluraWhite,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
