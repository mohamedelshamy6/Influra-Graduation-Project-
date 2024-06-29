import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_text_styles.dart';

import '../../../../core/theme/app_colors.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.mainBlue),
        title: Text(
          'Language',
          style: AppTextStyles.poppinsBold30Blue,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 15),
        child: ListView(children: <Widget>[
          const Text('Suggested',
              style: TextStyle(
                color: AppColors.mainBlue,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'poppins',
              )),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'English (us)',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              const Spacer(),
              Radio(
                value: 1,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value as int;
                  });
                },
                activeColor: Colors.blueAccent,
              )
            ],
          ),
          Row(children: [
            const Expanded(
              child: Text(
                'English (uk)',
                style: TextStyle(
                  color: AppColors.mainBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins',
                ),
              ),
            ),
            Radio(
              value: 2,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value as int;
                });
              },
              activeColor: Colors.blueAccent,
            )
          ]),
          SizedBox(height: 16.h),
          const Divider(
            color: AppColors.mainBlue,
          ),
          SizedBox(height: 16.h),
          const Text('Others',
              style: TextStyle(
                color: AppColors.mainBlue,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'poppins',
              )),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Mandarin',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              const Spacer(),
              Radio(
                value: 3,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value as int;
                  });
                },
                activeColor: Colors.blueAccent,
              )
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Indian',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              const Spacer(),
              Radio(
                value: 4,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value as int;
                  });
                },
                activeColor: Colors.blueAccent,
              )
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Spanish',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              const Spacer(),
              Radio(
                value: 5,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value as int;
                  });
                },
                activeColor: Colors.blueAccent,
              )
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'French',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              const Spacer(),
              Radio(
                value: 6,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value as int;
                  });
                },
                activeColor: Colors.blueAccent,
              )
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Arabic',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              const Spacer(),
              Radio(
                value: 7,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value as int;
                  });
                },
                activeColor: Colors.blueAccent,
              )
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Russian',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              const Spacer(),
              Radio(
                value: 8,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value as int;
                  });
                },
                activeColor: Colors.blueAccent,
              )
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'indonesia',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              const Spacer(),
              Radio(
                value: 9,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value as int;
                  });
                },
                activeColor: Colors.blueAccent,
              )
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'vitnamese',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              const Spacer(),
              Radio(
                value: 10,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value as int;
                  });
                },
                activeColor: Colors.blueAccent,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
