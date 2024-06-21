import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/widgets/custom_button.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../influencer_account/view/widgets/links_container.dart';

class InfluencerDetails extends StatelessWidget {
  final String name, image, category;
  const InfluencerDetails({
    super.key,
    required this.name,
    required this.image,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(image),
              onBackgroundImageError: (x, y) => const Text('No Images'),
            ),
            const SizedBox(height: 20),
            Text(
              name,
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
              'Reviews: 1K',
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
            const LinksContainer(),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 15,
                itemBuilder: (context, index) => Image(
                  image: AssetImage(image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
