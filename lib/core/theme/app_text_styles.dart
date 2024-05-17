import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle poppinsBold15blue = GoogleFonts.poppins(
    color: AppColors.mainBlue,
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle poppinsBold30Blue = GoogleFonts.poppins(
    color: AppColors.mainBlue,
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle poppinsBold15White = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle poppinsRegular15Blue = GoogleFonts.poppins(
    color: AppColors.mainBlue,
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle valdiationError = GoogleFonts.poppins(
    color: Colors.red.withOpacity(0.8),
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle poppinsBold24black = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle poppinsRegular16SecoondaryBlue = GoogleFonts.poppins(
    color: AppColors.secondaryBlue,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle poppinsRegular14Black = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle poppinsBold26white = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 26.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle poppinsBold22Black = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle poppinsSemiBold16Black = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle poppinsMedium14Black = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
}
