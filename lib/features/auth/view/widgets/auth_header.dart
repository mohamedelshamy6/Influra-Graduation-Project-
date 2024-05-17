import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String authHeader;
  const AuthHeader({super.key, required this.authHeader});

  @override
  Widget build(BuildContext context) {
    return Text(
      authHeader,
      style: AppTextStyles.poppinsBold30Blue
          .copyWith(decoration: TextDecoration.none),
    );
  }
}
