import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_text_styles.dart';
import 'package:influra/features/home/logic/cubit/home_cubit.dart';
import '../../../../core/theme/app_colors.dart';

import '../widgets/card_body.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  void initState() {
    super.initState();
    homeCubit = BlocProvider.of<HomeCubit>(context);
  }

  late HomeCubit homeCubit;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
                right: 24.w, left: 24.w, top: 16.h, bottom: 8.h),
            child: BlocProvider.of<HomeCubit>(context).favorites.isEmpty
                ? Center(
                    child: Text(
                    'No Favourites yet.',
                    style: AppTextStyles.poppinsSemiBold30Blue,
                  ))
                : ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemCount:
                        BlocProvider.of<HomeCubit>(context).favorites.length,
                    itemBuilder: (context, index) {
                      var list = homeCubit.favorites.entries.toList();
                      return SizedBox(
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
                                category: list[index].value.category,
                                influenersImages: list[index].value.image,
                                name: list[index].value.name,
                              ),
                            ),
                            Positioned(
                              top: 2.h,
                              right: 8.w,
                              child: IconButton(
                                highlightColor: Colors.transparent,
                                onPressed: () {
                                  homeCubit.removeFromFavorites(
                                      int.parse(list[index].value.index));
                                  homeCubit.setUIFavorit(
                                      int.parse(list[index].value.index));
                                },
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
                                backgroundColor:
                                    AppColors.mainBlue.withOpacity(0.9),
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
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
