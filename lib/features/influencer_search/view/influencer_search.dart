import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_text_form_field.dart';
import '../../search/view/widgets/search_body.dart';

class InfluencerSearch extends StatelessWidget {
  const InfluencerSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
          EdgeInsets.only(right: 24.w, left: 24.w, top: 16.h, bottom: 8.h),
          child: Column(
            children: [
              const CustomTFF(
                hintText: 'Mon3esh',
                kbType: TextInputType.name,
                prefixIcon: Icon(Icons.search),
              ),
              SizedBox(height: 16.h),
              const Expanded(child: SearchBody()),
            ],
          ),
        ),
      ),
    );
  }
}
