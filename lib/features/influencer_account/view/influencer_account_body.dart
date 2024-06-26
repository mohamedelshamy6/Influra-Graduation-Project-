import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/helpers/cache_helper.dart';
import 'package:influra/core/theme/app_text_styles.dart';
import 'package:influra/core/widgets/custom_button.dart';
import 'package:influra/features/influencer_account/view/widgets/account_top_body.dart';
import 'package:influra/features/influencer_edite_profile/view/widgets/edite_profile_body.dart';

class InfluencerAccountBody extends StatefulWidget {
  const InfluencerAccountBody({Key? key}) : super(key: key);

  @override
  State<InfluencerAccountBody> createState() => _InfluencerAccountBodyState();
}

class _InfluencerAccountBodyState extends State<InfluencerAccountBody> {
  late String name,loc;
  @override
  void initState() {
    name = CacheHelper().getDataString(key: 'name')??'Amr Nossohy';
    loc = CacheHelper().getDataString(key: 'loc')??'Cairo';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Account',style: AppTextStyles.poppinsSemiBold20Blue,),centerTitle: true,actions: [
        CustomButton(buttonText: 'Edit', buttonAction: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const EditeProfileBody()));
        }, buttonStyle: AppTextStyles.poppinsBold15White,width: 60,),
        const SizedBox(width: 10,)
      ],),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(child: AccountTopBody(name: name,loc: loc,),),
          ];
        },
        body: GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 25.h,horizontal: 10.w),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              ),
            itemCount: 15,
            itemBuilder: (context,index)=>const Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_wHeGen6gtmyBX4kAZCCtAVPBCbxHY9Vvmw&s'))
        ),

      ),
    );
  }
}
