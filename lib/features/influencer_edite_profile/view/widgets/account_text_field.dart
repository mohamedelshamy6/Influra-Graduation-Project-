import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class AccountTextField extends StatelessWidget {
  const AccountTextField({Key? key, required this.title, required this.controller, this.secure=false}) : super(key: key);
  final String title;
  final TextEditingController controller;
  final bool? secure;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTextStyles.poppinsBold15blue,),
        const SizedBox(height: 10,),
        TextFormField(
          obscureText: secure!,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(width: 2,),
            ),
          ),
        )
      ],
    );
  }
}
