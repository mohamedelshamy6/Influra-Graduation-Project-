import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/features/inluencer_home/view/widgets/request_tile.dart';

import '../../core/theme/app_text_styles.dart';

class InfluencerHome extends StatelessWidget {
  const InfluencerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Requests (4)',
              style: AppTextStyles.poppinsSemiBold16Black,
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: ListView.separated(
              padding: EdgeInsets.only(bottom: 120.h),
              separatorBuilder: (context, index) => SizedBox(
                height: 30.h,
              ),
              itemBuilder: (context, index) => const RequestTile(),
              itemCount: 20,
            ))
          ],
        ),
      ),
    );
  }
}
