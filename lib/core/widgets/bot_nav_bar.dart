import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/favourites/view/screens/favourites_screen.dart';
import '../../features/search/view/screens/search_screen.dart';
import '../../features/settings/view/screens/settings.dart';
import '../../features/home/view/screens/home_screen.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/app_images.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

int selectedIndex = 0;
List pages = [
  const HomeScreen(),
  const SearchScreen(),
  const FavouritesScreen(),
  const SettingsScreen(),
];

class _BottomNavBarState extends State<BottomNavBar> {
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainBlue,
        centerTitle: true,
        title: SvgPicture.asset(
          Assets.svgsInfluraWhite,
        ),
      ),
      extendBody: true,
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        height: 67.h,
        margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
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
                icon: Icon(Icons.favorite),
                label: 'Favourites',
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
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
