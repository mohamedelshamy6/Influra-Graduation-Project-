import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/categories_card.dart';

class CategoriesScreen extends StatelessWidget {
  final List<String> categories;
  final List<String> categoriesImages;

  const CategoriesScreen({
    super.key,
    required this.categories,
    required this.categoriesImages,
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
              crossAxisCount: 3,
              childAspectRatio: 5 / 4,
              crossAxisSpacing: 5.w,
              mainAxisSpacing: 5.w,
            ),
            itemBuilder: (context, index) => CategoriesCard(
              onTap: () {},
              categoriesImages: categoriesImages[index],
              categories: categories[index],
            ),
            itemCount: categories.length,
          ),
        ),
      ),
    );
  }
}
