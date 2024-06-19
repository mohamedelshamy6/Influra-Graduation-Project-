import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.mainBlue),
          title: Text(
            'Terms & Conditions',
            style: AppTextStyles.poppinsBold26white
                .copyWith(color: AppColors.mainBlue),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.fromLTRB(15, 40, 40, 15),
            child: ListView(children: <Widget>[
              const Text('Clause 1',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                  )),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.',
                style: TextStyle(
                  color: AppColors.mainBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins',
                ),
              ),
              Container(
                height: 25,
              ),
              const Text('Clause 2',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                  )),
              const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  )),
              Container(
                height: 25,
              ),
              const Text('Clause 3',
                  style: TextStyle(
                    color: AppColors.mainBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                  )),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.',
                style: TextStyle(
                  color: AppColors.mainBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins',
                ),
              ),
              Container(
                height: 25,
              ),
              Container(
                //width: 100,
                //color: AppColors.blue,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.mainBlue,
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    'Accept & Continue',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ])));
  }
}
