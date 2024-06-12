import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_text_styles.dart';
import 'package:influra/features/influencer_messages/view/widgets/search_app_bar.dart';


class InfluencerMessagesBody extends StatelessWidget {
  const InfluencerMessagesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SearchAppBar(),),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRtsPyC-2IOOjw7ccarXm379ohHTSB5jJ94A&s'),
              onBackgroundImageError: (x,y)=>const Text('No Image',style: TextStyle(color: Colors.black),),
            ),
            title: Text('Ahmed Elwakil',style: AppTextStyles.poppinsSemiBold16Black,),
            subtitle: const Text('Car Blogger',style: TextStyle(color: Colors.black54)),
            trailing: const Column(
              children: [
                Text('18:30',style: TextStyle(color: Colors.black54)),
                SizedBox(height: 5,),
                CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  radius: 10,child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('15',style: TextStyle(color: Colors.white,fontSize: 14),)),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 8.h,),

      ),
    );
  }
}
