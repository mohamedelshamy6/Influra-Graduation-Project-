import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/features/influencer_req/view/influencer_req.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class RequestTile extends StatelessWidget {
  const RequestTile({Key? key, required this.data}) : super(key: key);
  final List data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    data[1],
                  ))),
          height: 50,
          width: 50,
        ),
        SizedBox(
          width: 20.w,
        ),
        SizedBox(
          width: 240.w,
          child: Text(data[0]),
        ),
        const Spacer(),
        CustomButton(
          buttonText: 'view',
          buttonStyle: AppTextStyles.poppinsBold15White,
          backgroundColor: AppColors.mainBlue.withOpacity(.6),
          width: 70.w,
          buttonAction: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InfluencerReq()));
          },
        )
      ],
    );
  }
}
