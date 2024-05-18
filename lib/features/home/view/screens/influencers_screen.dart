import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/influencer_card.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/theme/app_colors.dart';

class InfluencersScreen extends StatelessWidget {
  final List<String> name, image, category;
  const InfluencersScreen({
    super.key,
    required this.name,
    required this.image,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: AppColors.mainBlue,
        centerTitle: true,
        title: SvgPicture.asset(
          Assets.svgsInfluraWhite,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.5 / 4,
              crossAxisSpacing: 5.w,
              mainAxisSpacing: 5.h,
            ),
            itemBuilder: (context, index) => InfluencersCard(
              onTap: () {},
              name: name[index],
              image: image[index],
              description:
                  'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
              category: category[index],
            ),
            itemCount: name.length,
          ),
        ),
      ),
    );
  }
}
