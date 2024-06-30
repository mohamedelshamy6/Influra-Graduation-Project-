import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/theme/app_text_styles.dart';

class AccountDropDownField extends StatelessWidget {
  const AccountDropDownField({Key? key, required this.title,  this.loc, this.isLoc=false}) : super(key: key);
  final String? title,loc;
  final bool? isLoc;
  @override
  Widget build(BuildContext context) {
    List cities=[
      "Cairo", "Giza", "Alexandria", "Dakahlia", "Red Sea", "Beheira", "Fayoum", "Gharbia", "Ismailia", "Menofia", "Minya", "Qalyubia", "New Valley", "Suez", "Aswan", "Assiut", "Beni Suef", "Port Said", "Damietta", "Sharqia", "South Sinai", "Kafr El Sheikh", "Matrouh", "Luxor", "Qena", "North Sinai", "Sohag"
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title??'',style: AppTextStyles.poppinsBold15blue,),
        const SizedBox(height: 10,),
        DropdownButtonFormField(
          menuMaxHeight: 200,
          value:isLoc! ? loc:null,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(width: 2,),
              ),
            ),
            items: List.generate(cities.length, (index)=>DropdownMenuItem(value: cities[index],child: Text(cities[index]),),),
            onChanged: (x){
              CacheHelper().saveData(key: 'loc', value: x);
            }),
      ],
    );
  }
}
