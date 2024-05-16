import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/features/settings/view/screens/settings.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

int selectedIndex = 0;
List pages = [
  const Scaffold(
    body: Center(
      child: Text('one'),
    ),
  ),
  const Scaffold(
    body: Center(
      child: Text('two'),
    ),
  ),
  const Scaffold(
    body: Center(
      child: Text('three'),
    ),
  ),
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
      extendBody: true,
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
        ),
        height: 67.h,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
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
