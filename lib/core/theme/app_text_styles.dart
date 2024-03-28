import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle interBold15blue = GoogleFonts.inter(
    color: AppColors.mainBlue,
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle interBold30Blue = GoogleFonts.inter(
    color: AppColors.mainBlue,
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle interBold15White = GoogleFonts.inter(
    color: Colors.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle interRegular15Blue = GoogleFonts.inter(
    color:AppColors.mainBlue,
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
  );
}
