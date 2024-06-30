import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:influra/features/search/data/models/search_model.dart';
import '../widgets/influencer_card.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/theme/app_colors.dart';
import 'influencer_details.dart';

class InfluencersScreen extends StatelessWidget {
  final List<SearchModel> search;
  const InfluencersScreen({
    super.key,
    required this.search,
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
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => InfluencerDetails(
                    index: index,
                    category: search[index].category!,
                    image: search[index].image!,
                    name: search[index].name!,
                  ),
                ));
              },
              name: search[index].name!,
              image: search[index].image!,
              description:
                  'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
              category: search[index].category!,
            ),
            itemCount: search.length,
          ),
        ),
      ),
    );
  }
}
