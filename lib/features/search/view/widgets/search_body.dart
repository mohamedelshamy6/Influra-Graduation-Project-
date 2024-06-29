import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/features/search/data/models/search_model.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../home/view/screens/influencer_details.dart';
import 'search_suggestions.dart';

class SearchBody extends StatelessWidget {
  final List<SearchModel> list;
  const SearchBody({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    log('searhed $list');
    return list.isEmpty
        ? Center(
            child: Text(
              'Search on someone',
              style: AppTextStyles.poppinsBold15blue,
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InfluencerDetails(
                          index: index,
                          category: list[index].category!,
                          image: list[index].image!,
                          name: list[index].name!,
                        ),
                      ));
                    },
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    overlayColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                    splashColor: Colors.transparent,
                    child: SearchSugg(
                      name: list[index].name!,
                      image: list[index].image!,
                      category: list[index].category!,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 60.w, top: 12.h),
                    child: Text(
                      '${((index + 1) * 2 + 12) * 2}k Followers',
                      style: AppTextStyles.poppinsMedium14Black
                          .copyWith(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) =>
                const Divider(color: AppColors.mainBlue),
            itemCount: list.length,
          );
  }
}
