import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_colors.dart';
import 'package:influra/core/widgets/custom_button.dart';
import 'package:influra/features/home/data/models/faorite_model.dart';
import 'package:influra/features/home/logic/cubit/home_cubit.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../influencer_account/view/widgets/links_container.dart';

class InfluencerDetails extends StatefulWidget {
  final String name, image, category;
  final int index;

  const InfluencerDetails({
    super.key,
    required this.name,
    required this.image,
    required this.category,
    required this.index,
  });

  @override
  State<InfluencerDetails> createState() => _InfluencerDetailsState();
}

class _InfluencerDetailsState extends State<InfluencerDetails> {
  bool color = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  BlocProvider.of<HomeCubit>(context)
                              .favoritesList[widget.index] ==
                          true
                      ? BlocProvider.of<HomeCubit>(context).removeFromFavorites(
                          widget.index,
                          FavoriteModel(
                              name: widget.name,
                              image: widget.image,
                              category: widget.category))
                      : BlocProvider.of<HomeCubit>(context).addToFavorites(
                          widget.index,
                          FavoriteModel(
                              name: widget.name,
                              image: widget.image,
                              category: widget.category));
                  BlocProvider.of<HomeCubit>(context)
                      .setUIFavorit(widget.index);
                },
                icon: BlocProvider.of<HomeCubit>(context)
                            .favoritesList[widget.index] ==
                        true
                    ? const Icon(
                        Icons.favorite,
                        color: AppColors.tFFErrorColor,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: AppColors.mainBlue,
                      ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(widget.image),
                onBackgroundImageError: (x, y) => const Text('No Images'),
              ),
              const SizedBox(height: 20),
              Text(
                widget.name,
                style: AppTextStyles.poppinsSemiBold20Blue,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30.r,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.name.length / 4 < 1
                    ? 'Reviews: ${((widget.name.length / 4) * 1000).toStringAsFixed(0)}'
                    : 'Reviews: ${widget.name.length / 4}K',
                style: AppTextStyles.poppinsBold22Black,
              ),
              const SizedBox(height: 8),
              CustomButton(
                buttonText: 'Send Request',
                buttonAction: () {},
                buttonStyle: AppTextStyles.poppinsBold15White,
                width: 160.w,
              ),
              const SizedBox(height: 20),
              LinksContainer(name: widget.name.split(' ').join('-')),
              const SizedBox(height: 20),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: widget.name.length < 5 ? 5 : widget.name.length,
                itemBuilder: (context, index) => Image(
                  image: AssetImage(widget.image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
