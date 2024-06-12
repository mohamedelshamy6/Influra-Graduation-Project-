import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Icon(Icons.menu,color: Colors.grey,)),
        SizedBox(width: 10.w,),
        Expanded(
            flex: 10,
            child: CupertinoSearchTextField(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),color: Colors.grey.shade200),
            )
        )
      ],
    );
  }
}
