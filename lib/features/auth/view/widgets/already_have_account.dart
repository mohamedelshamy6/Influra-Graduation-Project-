import 'package:flutter/material.dart';
import 'package:influra/core/routing/routes.dart';

import '../../../../core/theme/app_text_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: AppTextStyles.interRegular15Blue,
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () => Navigator.pushNamed(
            context,
            Routes.loginScreen,
          ),
          child: Text(
            'Sign In',
            style: AppTextStyles.interBold15blue,
          ),
        ),
      ],
    );
  }
}
