import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:influra/features/forget_password/logic/cubit/forget_password_cubit.dart';
import 'package:influra/features/forget_password/view/screens/forget_password_screen.dart';
import 'package:influra/features/forget_password/view/screens/new_password_screen.dart';
import 'package:influra/features/forget_password/view/screens/reset_password_screen.dart';
import 'package:influra/features/forget_password/view/screens/verification_code_screen.dart';
import 'routes.dart';
import '../../features/auth/view/screens/login/login.dart';
import '../../features/auth/view/screens/sign_up/continue_signup_influencer.dart';
import '../../features/auth/view/screens/sign_up/signup_business_owner.dart';
import '../../features/auth/view/screens/sign_up/signup_influencer.dart';
import '../../features/auth/view/screens/sign_up/signup_selection.dart';

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 750);

  CustomPageRoute({builder}) : super(builder: builder);
}

class AppRoutes {
  Route? generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
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
      case Routes.continueSignUpInfluencer:
        return CustomPageRoute(
          builder: (context) => const ContinueSignUpInfluencer(),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ForgetPasswordCubit>(
            create: (context) => ForgetPasswordCubit(),
            child: ResetPasswordScreen(
              value: args as int,
            ),
          ),
        );
      case Routes.verificationCode:
        return MaterialPageRoute(
          builder: (context) => const VerificationCodeScreen(),
        );
      case Routes.newPassword:
        return MaterialPageRoute(
          builder: (context) => const NewPasswordScreen(),
        );
    }
    return null;
  }
}
