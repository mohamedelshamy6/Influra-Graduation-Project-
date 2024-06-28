import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_colors.dart';

import 'package:influra/features/home/view/screens/influencer_details.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/helpers/app_constants.dart';
import '../../../../core/routing/routes.dart';
import '../widgets/categories_card.dart';
import '../widgets/home_body_title.dart';
import '../widgets/influencer_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/vid.mp4');
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      _controller.play();
      _controller.setLooping(true);
      setState(() {});
    });
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              child: FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Center(
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(
                            _controller,
                          ),
                        ),
                      );
                    }
                  }),
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
                        index: index,
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
