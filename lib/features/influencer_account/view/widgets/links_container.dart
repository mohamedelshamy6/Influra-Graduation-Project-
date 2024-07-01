import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class LinksContainer extends StatelessWidget {
  final String name;
  const LinksContainer({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundImage: const NetworkImage(
                    'https://store-images.s-microsoft.com/image/apps.37935.9007199266245907.b029bd80-381a-4869-854f-bac6f359c5c9.91f8693c-c75b-4050-a796-63e1314d18c9?h=464'),
                onBackgroundImageError: (x, y) => const Text('No Images'),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                  width: 360.w,
                  child: Text(
                    'https://facebook.com/${name.split(' ').join('-')}',
                    style: AppTextStyles.poppinsRegular15Blue,
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundImage: const NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/800px-Instagram_icon.png'),
                onBackgroundImageError: (x, y) => const Text('No Images'),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                  width: 360.w,
                  child: Text(
                    'https://instagram.com/${name.split(' ').join('-')}',
                    style: AppTextStyles.poppinsRegular15Blue,
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundImage: const NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsb701kBgGunsYhAzHa2ixfUE2HoDChIa0sg&s'),
                onBackgroundImageError: (x, y) => const Text('No Images'),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                  width: 360.w,
                  child: Text(
                    'https://x.com/${name.split(' ').join('-')}',
                    style: AppTextStyles.poppinsRegular15Blue,
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundImage: const NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/006/057/996/non_2x/tiktok-logo-on-transparent-background-free-vector.jpg'),
                onBackgroundImageError: (x, y) => const Text('No Images'),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                  width: 360.w,
                  child: Text(
                    'https://tiktok.com/${name.split(' ').join('-')}',
                    style: AppTextStyles.poppinsRegular15Blue,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
