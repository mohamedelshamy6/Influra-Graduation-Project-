import 'package:flutter/material.dart';
import 'package:influra/core/routing/routes.dart';
import 'package:influra/features/auth/view/screens/login/login.dart';
import 'package:influra/features/auth/view/screens/sign_up/signup_business_owner.dart';
import 'package:influra/features/auth/view/screens/sign_up/signup_influencer.dart';
import 'package:influra/features/auth/view/screens/sign_up/signup_selection.dart';

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 750);

  CustomPageRoute({builder}) : super(builder: builder);
}

class AppRoutes {
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.signUpSelection:
        return MaterialPageRoute(
          builder: (context) => const SignUpSelection(),
        );
      case Routes.signUpInfluencer:
        return CustomPageRoute(
          builder: (context) => const SignUpInfluencer(),
        );
      case Routes.signUpBusinessOwner:
        return CustomPageRoute(
          builder: (context) => const SignUpBusinessOwner(),
        );
      case Routes.loginScreen:
        return CustomPageRoute(
          builder: (context) => const LoginScreen(),
        );
    }
    return null;
  }
}
