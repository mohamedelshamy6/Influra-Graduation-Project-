import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/helpers/app_images.dart';
import 'package:influra/core/theme/app_colors.dart';

import '../widgets/card_body.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> influenersImages = [
      Assets.imagesInfluencersElwakil,
      Assets.imagesInfluencersSrry,
      Assets.imagesInfluencersS7s,
      Assets.imagesInfluencersMon3sh,
      Assets.imagesInfluencersNso7i,
      Assets.imagesInfluencersMarzouqi,
    ];
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(right: 24.w, left: 24.w, top: 16.h, bottom: 8.h),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemCount: 6,
          itemBuilder: (context, index) => SizedBox(
            width: double.infinity,
            height: 140.h,
            child: Stack(
              children: [
                Card(
                  elevation: 4,
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CardBody(
                    influenersImages: influenersImages[index],
                  ),
                ),
                Positioned(
                  top: 2.h,
                  right: 8.w,
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12.h,
                  right: 10.w,
                  child: CircleAvatar(
                    backgroundColor: AppColors.mainBlue.withOpacity(0.9),
                    radius: 24.r,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          size: 24.r,
                          Icons.message,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
