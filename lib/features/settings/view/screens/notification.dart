import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool switchValue1 = true;
  bool switchValue2 = false;
  bool switchValue3 = true;
  bool switchValue4 = false;
  bool switchValue5 = true;
  bool switchValue6 = true;
  bool switchValue7 = false;
  bool switchValue8 = false;
  bool switchValue9 = true;
  bool switchValue10 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.mainBlue),
        title: Text(
          'Notifications',
          style: AppTextStyles.poppinsBold30Blue,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 40, 40, 15),
        child: ListView(children: <Widget>[
          Text(
            'Common',
            style: TextStyle(
              color: AppColors.mainBlue,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'poppins',
            ),
          ),
          Container(
            height: 0,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'General Notification',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              Container(
                width: 140,
              ),
              Switch(
                value: switchValue1,
                onChanged: (value) {
                  setState(() {
                    switchValue1 = value;
                  });
                },
                activeColor: AppColors.mainBlue,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Sound',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              Container(
                width: 140,
              ),
              Switch(
                value: switchValue2,
                onChanged: (value) {
                  setState(() {
                    switchValue2 = value;
                  });
                },
                activeColor: AppColors.mainBlue,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Vibrate',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              Container(
                width: 140,
              ),
              Switch(
                value: switchValue3,
                onChanged: (value) {
                  setState(() {
                    switchValue3 = value;
                  });
                },
                activeColor: AppColors.mainBlue,
              ),
            ],
          ),
          Container(
            height: 25,
          ),
          Text(
            'System & services update',
            style: TextStyle(
              color: AppColors.mainBlue,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'poppins',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'App updates',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              Container(
                width: 140,
              ),
              Switch(
                value: switchValue4,
                onChanged: (value) {
                  setState(() {
                    switchValue4 = value;
                  });
                },
                activeColor: AppColors.mainBlue,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Bill Reminder',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              Container(
                width: 140,
              ),
              Switch(
                value: switchValue5,
                onChanged: (value) {
                  setState(() {
                    switchValue5 = value;
                  });
                },
                activeColor: AppColors.mainBlue,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Promotion',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              Container(
                width: 140,
              ),
              Switch(
                value: switchValue6,
                onChanged: (value) {
                  setState(() {
                    switchValue6 = value;
                  });
                },
                activeColor: AppColors.mainBlue,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Discount Available',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              Container(
                width: 140,
              ),
              Switch(
                value: switchValue7,
                onChanged: (value) {
                  setState(() {
                    switchValue7 = value;
                  });
                },
                activeColor: AppColors.mainBlue,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Payment Request',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              Container(
                width: 140,
              ),
              Switch(
                value: switchValue8,
                onChanged: (value) {
                  setState(() {
                    switchValue8 = value;
                  });
                },
                activeColor: AppColors.mainBlue,
              ),
            ],
          ),
          Container(
            height: 25,
          ),
          Text(
            'Others',
            style: TextStyle(
              color: AppColors.mainBlue,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'poppins',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'New Service Available',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              Container(
                width: 40,
              ),
              Switch(
                value: switchValue9,
                onChanged: (value) {
                  setState(() {
                    switchValue9 = value;
                  });
                },
                activeColor: AppColors.mainBlue,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'New Tips Available',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              Container(
                width: 40,
              ),
              Switch(
                value: switchValue10,
                onChanged: (value) {
                  setState(() {
                    switchValue10 = value;
                  });
                },
                activeColor: AppColors.mainBlue,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
