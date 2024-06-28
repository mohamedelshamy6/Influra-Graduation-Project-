import 'package:flutter/material.dart';
import 'package:influra/features/influencer_account/view/widgets/links_container.dart';

import '../../../../core/theme/app_text_styles.dart';

class AccountTopBody extends StatelessWidget {
  const AccountTopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: const NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2go3DY4UlFzbibP4SBwU8I10f99YF6d6bYccj-OpLeEj_-9cNqCX-WuTZvFYLDzKmP7M&usqp=CAU'),
          onBackgroundImageError: (x, y) => const Text('No Images'),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Amr Nossohy',
          style: AppTextStyles.poppinsSemiBold20Blue,
        ),
        Text(
          'Football',
          style: AppTextStyles.poppinsRegular14Black,
        ),
        const SizedBox(
          height: 4,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_rounded),
            SizedBox(
              width: 5,
            ),
            Text(
              'Cairo',
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Reviews: 1K',
          style: AppTextStyles.poppinsBold22Black,
        ),
        const SizedBox(
          height: 20,
        ),
        const LinksContainer(name:'Amr Nossohy'),
      ],
    );
  }
}
