import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/helpers/app_images.dart';

class AuthTitleSvg extends StatelessWidget {
  const AuthTitleSvg({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 70.h,
        child: SvgPicture.asset(
          Assets.svgsInflura,
        ),
      ),
    );
  }
}
