import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/features/influencer_req/view/widgets/chat_screen.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class ReqActions extends StatefulWidget {
  const ReqActions({Key? key}) : super(key: key);

  @override
  State<ReqActions> createState() => _ReqActionsState();
}

class _ReqActionsState extends State<ReqActions> {
  bool clicked = false,submit=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child:!clicked? Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(buttonText: 'Accept', buttonAction: (){
            clicked=true;
            setState(() {});
          }, buttonStyle: AppTextStyles.poppinsBold15White,),
          SizedBox(height: 10.h,),
          CustomButton(buttonText: 'Decline', buttonAction: (){}, buttonStyle: AppTextStyles.poppinsBold15White,backgroundColor: Colors.black26,),
        ],
      ):
      Row(
        children: [
          Expanded(child: CustomButton(buttonText: 'Start Chat', buttonAction: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
          }, buttonStyle: AppTextStyles.poppinsBold15White,)),
          SizedBox(width: 10.w,),
          Expanded(child: CustomButton(buttonText: submit?'waiting':'Submit', buttonAction: (){
            submit=true;setState(() {});
          }, buttonStyle: AppTextStyles.poppinsBold15White,backgroundColor:submit? Colors.red.withOpacity(.6):Colors.green,)),
        ],
      ),
    );
  }
}
