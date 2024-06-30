import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/helpers/cache_helper.dart';
import 'package:influra/core/helpers/helper_methods.dart';
import 'package:influra/core/theme/app_colors.dart';
import 'package:influra/core/widgets/custom_button.dart';
import 'package:influra/features/influencer_edite_profile/view/widgets/account_drop_down_field.dart';
import 'package:influra/features/influencer_edite_profile/view/widgets/account_text_field.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../influencer_account/view/influencer_account_body.dart';

class EditeProfileBody extends StatefulWidget {
  const EditeProfileBody({Key? key,}) : super(key: key);
  @override
  State<EditeProfileBody> createState() => _EditeProfileBodyState();
}

class _EditeProfileBodyState extends State<EditeProfileBody> {
  late TextEditingController dateController,nameController,emailController,cityController,passController;

  @override
  void initState() {
    dateController=TextEditingController();nameController=TextEditingController();
    emailController=TextEditingController();cityController=TextEditingController();
    passController=TextEditingController();
    passController.text=123123123.toString();
    dateController.text='1980-05-25';
    cityController.text=CacheHelper().getDataString(key: 'loc')??'Cairo';
    nameController.text=CacheHelper().getDataString(key: 'name')??'Amr Nossohy';
    emailController.text='Nossohy1985@gmail.com';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (x)async{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const InfluencerAccountBody()));
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Account',
            style: AppTextStyles.poppinsSemiBold20Blue,
          ),
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const InfluencerAccountBody()));
          },),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: const NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2go3DY4UlFzbibP4SBwU8I10f99YF6d6bYccj-OpLeEj_-9cNqCX-WuTZvFYLDzKmP7M&usqp=CAU'),
                    onBackgroundImageError: (x, y) => const Text('No Images'),
                  ),
                  const PositionedDirectional(
                      bottom: 0,
                      end: 0,
                      child: CircleAvatar(
                          backgroundColor: AppColors.currentPinPutBorderColor,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ))),
                ],
              ),
              SizedBox(height: 15.h,),
              AccountTextField(title: 'Name', controller: nameController,),
              SizedBox(height: 15.h,),
              AccountTextField(title: 'Email', controller: emailController,),
              SizedBox(height: 15.h,),
              AccountTextField(title: 'Password', controller: passController, secure: true,),
              SizedBox(height: 15.h,),
              AccountTextField(
                onTap: (){
                  _selected(context);
                },
                  readOnly: true,
                  title: 'Date of Birth', controller: dateController),
              SizedBox(
                height: 15.h,
              ),
              AccountDropDownField(
                title: 'City',loc: cityController.text,isLoc: true,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomButton(
            buttonText: 'Save Changes',
            buttonAction: () async{
              showDialog(context: context, builder: (context)=> Center(child: CircularProgressIndicator(color: AppColors.mainBlue,),));
              Future.delayed(const Duration(milliseconds: 400),(){
                Navigator.pop(context);
                CacheHelper().saveData(key: 'name', value: nameController.text);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const InfluencerAccountBody()));
              });

            },
            buttonStyle: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Future<void> _selected(BuildContext context)async{
    DateTime? _picked = await showDatePicker(context: context, firstDate: DateTime(1950), lastDate: DateTime(2014),initialDate: DateTime(2000));
    if(_picked!=null){
      setState(() {
        dateController.text=_picked.toString().split(" ")[0];
      });
    }
  }
}
