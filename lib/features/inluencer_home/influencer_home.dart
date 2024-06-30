import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/features/inluencer_home/view/widgets/request_tile.dart';

import '../../core/theme/app_text_styles.dart';

class InfluencerHome extends StatelessWidget {
  InfluencerHome({Key? key}) : super(key: key);
  List influncers = [
    ['Mohamed Yasser','https://img.freepik.com/free-photo/portrait-man-having-great-time_23-2149443790.jpg'],
    ['Omar Maher','https://as1.ftcdn.net/v2/jpg/03/02/88/46/1000_F_302884605_actpipOdPOQHDTnFtp4zg4RtlWzhOASp.jpg'],
    ['Rana Mohamed','https://www.shutterstock.com/image-photo/profile-picture-studio-headshot-business-260nw-2310388241.jpg']
  ];
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
              'Requests (3)',
              style: AppTextStyles.poppinsSemiBold16Black,
            ),
            SizedBox(height: 20.h,),
            Expanded(
                child: ListView.separated(padding: EdgeInsets.only(bottom: 120.h),
                  separatorBuilder: (context, index) => SizedBox(height: 30.h,),
                  itemBuilder: (context, index) => RequestTile(data: influncers[index],),
                  itemCount: influncers.length,
            ))
          ],
        ),
      ),
    );
  }
}
