import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/helpers/helper_methods.dart';
import 'package:influra/features/influencer_messages/influencer_messages.dart';
import 'package:influra/features/influencer_settings/influencer_settings.dart';
import 'package:influra/features/inluencer_home/influencer_home.dart';

import '../../features/influencer_search/view/influencer_search.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class InfluencerNavScreen extends StatefulWidget {
  const InfluencerNavScreen({Key? key}) : super(key: key);

  @override
  State<InfluencerNavScreen> createState() => _InfluencerNavScreenState();
}

class _InfluencerNavScreenState extends State<InfluencerNavScreen> {
  List influencerPagesList=[
    InfluencerHome(),
    InfluencerSearch(),
    InfluencerMessages(),
    InfluencerSettings(),
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelperMethods.influencerAppBar(),
      body: influencerPagesList[selectedIndex],
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          height: 67.h,
          margin: EdgeInsets.only(bottom: 20.h,left: 10.w,right: 10.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.mainBlue,
              elevation: 0.0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.telegram),
                  label: 'messages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              currentIndex: selectedIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black54,
              unselectedLabelStyle: AppTextStyles.poppinsBold15White.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
              selectedLabelStyle: AppTextStyles.poppinsBold15White.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
              onTap: (x){
                selectedIndex=x;
                setState(() {});
              },
            ),
          ),
        )
    );
  }
}
