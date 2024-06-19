import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class AccountDropDownField extends StatelessWidget {
  const AccountDropDownField({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTextStyles.poppinsBold15blue,),
        const SizedBox(height: 10,),
        DropdownButtonFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(width: 2,),
              ),
            ),
            items: const [
              DropdownMenuItem(value: 1,child: Text('data 1'),),
              DropdownMenuItem(value: 2,child: Text('data 2'),),
            ], onChanged: (x){}),
      ],
    );
  }
}
