import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';

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
          style: AppTextStyles.poppinsRegular15Blue,
        ),
        TextButton(
          style: const ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
          ),
          onPressed: () => Navigator.pushNamed(
            context,
            Routes.loginScreen,
          ),
          child: Text(
            'Sign In',
            style: AppTextStyles.poppinsBold15blue,
          ),
        ),
      ],
    );
  }
}
