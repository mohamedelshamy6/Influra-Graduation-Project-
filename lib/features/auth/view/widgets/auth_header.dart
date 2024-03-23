import 'package:flutter/material.dart';
import 'package:influra/core/theme/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String authHeader;
  const AuthHeader({super.key, required this.authHeader});

  @override
  Widget build(BuildContext context) {
    return Text(
      authHeader,
      style: AppTextStyles.interBold30Blue,
    );
  }
}
