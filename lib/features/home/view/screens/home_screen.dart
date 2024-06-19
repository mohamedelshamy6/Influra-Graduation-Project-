import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_colors.dart';
import 'package:influra/features/home/view/screens/influencer_details.dart';

import '../../../../core/helpers/app_constants.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/categories_card.dart';
import '../widgets/home_body_title.dart';
import '../widgets/influencer_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Container(
              height: 245.h,
              color: AppColors.mainBlue,
              child: Center(
                child: Text(
                  'A video will be shown here',
                  style: AppTextStyles.poppinsBold26white,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            HomeBodyTitle(
              title: 'Categories',
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Routes.categories,
                  arguments: <List<String>>[
                    AppConstants.categories,
                    AppConstants.categoriesImages,
                  ],
                );
              },
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 5 / 4,
                ),
                itemBuilder: (context, index) => CategoriesCard(
                  onTap: () {},
                  categoriesImages: AppConstants.categoriesImages[index],
                  categories: AppConstants.categories[index],
                ),
                itemCount: 6,
              ),
            ),
            SizedBox(height: 24.h),
            HomeBodyTitle(
              title: 'Influencers',
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Routes.influencers,
                  arguments: <List<String>>[
                    AppConstants.influenersNames,
                    AppConstants.influenersImages,
                    AppConstants.influenersCategories,
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5 / 4,
                  crossAxisSpacing: 5.w,
                  mainAxisSpacing: 5.h,
                ),
                itemBuilder: (context, index) => InfluencersCard(
                  category: AppConstants.influenersCategories[index],
                  description:
                      'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                  image: AppConstants.influenersImages[index],
                  name: AppConstants.influenersNames[index],
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InfluencerDetails(
                        category: AppConstants.influenersCategories[index],
                        image: AppConstants.influenersImages[index],
                        name: AppConstants.influenersNames[index],
                      ),
                    ));
                  },
                ),
                itemCount: 6,
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
