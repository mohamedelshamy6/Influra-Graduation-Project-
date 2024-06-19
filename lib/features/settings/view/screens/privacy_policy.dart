import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.mainBlue),
          title: Text(
            'Privacy Policy',
            style: AppTextStyles.poppinsBold30Blue,
          ),
        ),
        body: Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 15),
            child: ListView(children: <Widget>[
              Text('1. Types data we collect',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                  )),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.',
                style: TextStyle(
                  color: AppColors.mainBlue,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins',
                ),
              ),
              Container(
                height: 25,
              ),
              Text('2. Use of your personal data',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                  )),
              Text(
                  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  )),
              Container(
                height: 25,
              ),
              Text('3. Disclosure of your personal data',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                  )),
              Text(
                'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus',
                style: TextStyle(
                  color: AppColors.mainBlue,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins',
                ),
              ),
              Container(
                height: 25,
              ),
            ])));
  }
}
