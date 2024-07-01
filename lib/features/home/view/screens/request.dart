import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/helpers/cache_helper.dart';
import 'package:influra/core/helpers/helper_methods.dart';
import 'package:influra/core/theme/app_colors.dart';
import 'package:influra/core/theme/app_text_styles.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: IconButton(
                onPressed: () {
                  HelperMethods.showLoadingAlertDialog(context);
                  Timer(const Duration(seconds: 3), () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
                },
                icon: const Icon(Icons.send, color: AppColors.mainBlue)),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'From :',
                      style: AppTextStyles.poppinsBold22Black,
                    ),
                    Text(
                      '  ${CacheHelper().getData(key: 'bEmail')}',
                      style: AppTextStyles.poppinsBold15blue
                          .copyWith(fontSize: 18.sp),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                const Divider(
                  color: AppColors.mainBlue,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      'To :',
                      style: AppTextStyles.poppinsBold22Black,
                    ),
                    Text(
                      '  Nossohy1985@gmail.com',
                      style: AppTextStyles.poppinsBold15blue
                          .copyWith(fontSize: 18.sp),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                const Divider(
                  color: AppColors.mainBlue,
                ),
                SizedBox(height: 4.h),
                Expanded(
                  child: SizedBox(
                    height: 500.h,
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      minLines: null,
                      textAlignVertical: TextAlignVertical.top,
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Price :',
                      style: AppTextStyles.poppinsBold22Black,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: '  ex : 20000', border: InputBorder.none),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
