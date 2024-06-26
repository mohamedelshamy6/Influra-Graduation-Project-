import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:influra/core/networking/dio_handler.dart';
import 'package:influra/core/widgets/influencer_nav_screen.dart';
import 'package:influra/features/auth/data/repositories/auth_repo.dart';
import 'package:influra/features/auth/logic/cubit/cubit/auth_cubit.dart';
import 'package:influra/features/chat_bot/data/repository/answer_repo.dart';
import 'package:influra/features/chat_bot/logic/cubit/chatbot_cubit.dart';
import 'package:influra/features/chat_bot/views/screens/chat_screen.dart';
import 'package:influra/features/chat_bot/views/screens/start_chat_bot.dart';
import 'package:influra/features/influencer_account/influencer_account.dart';
import 'package:influra/features/search/data/models/search_model.dart';
import 'package:influra/features/settings/view/screens/language.dart';
import 'package:influra/features/settings/view/screens/notification.dart';
import 'package:influra/features/settings/view/screens/owner_profile.dart';
import 'package:influra/features/settings/view/screens/privacy_policy.dart';
import 'package:influra/features/settings/view/screens/requests.dart';
import 'package:influra/features/settings/view/screens/terms.dart';
import 'package:influra/features/spalsh/view/screens/splash_screen.dart';
import '../../features/forget_password/logic/cubit/forget_password_cubit.dart';
import '../../features/forget_password/view/screens/forget_password_screen.dart';
import '../../features/forget_password/view/screens/new_password_screen.dart';
import '../../features/forget_password/view/screens/reset_password_screen.dart';
import '../../features/forget_password/view/screens/verification_code_screen.dart';
import '../widgets/bot_nav_bar.dart';
import '../../features/home/view/screens/categories_screen.dart';
import '../../features/home/view/screens/influencers_screen.dart';
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
          builder: (context) => BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(AuthRepo(DioHandler())),
            child: const SignUpInfluencer(),
          ),
        );
      case Routes.signUpBusinessOwner:
        return CustomPageRoute(
          builder: (context) => BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(AuthRepo(DioHandler())),
            child: const SignUpBusinessOwner(),
          ),
        );
      case Routes.loginScreen:
        return CustomPageRoute(
          builder: (context) => BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(AuthRepo(DioHandler())),
            child: LoginScreen(
              toGo: args as String,
            ),
          ),
        );
      case Routes.continueSignUpInfluencer:
        return CustomPageRoute(
          builder: (context) => BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(AuthRepo(DioHandler())),
            child: ContinueSignUpInfluencer(
              email: (args as List<String>)[0],
              password: args[1],
              name: args[2],
              passwordConfirmation: args[3],
            ),
          ),
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
      case Routes.botNavbar:
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
      case Routes.newPassword:
        return MaterialPageRoute(
          builder: (context) => const NewPasswordScreen(),
        );
      case Routes.language:
        return MaterialPageRoute(
          builder: (context) => const Language(),
        );
      case Routes.terms:
        return MaterialPageRoute(
          builder: (context) => const Terms(),
        );
      case Routes.startChatBot:
        return MaterialPageRoute(
          builder: (context) => const StartChatBot(),
        );
      case Routes.chatBot:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ChatbotCubit>(
            create: (context) => ChatbotCubit(AnswerRepo(DioHandler())),
            child: const ChatScreen(),
          ),
        );
      case Routes.influencerAccount:
        return MaterialPageRoute(
          builder: (context) => const InfluencerAccount(),
        );
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.requests:
        return MaterialPageRoute(
          builder: (context) => const Requests(),
        );
      case Routes.ownerProfile:
        return MaterialPageRoute(
          builder: (context) => const OwnerProfile(),
        );
      case Routes.influencerNavbar:
        return MaterialPageRoute(
          builder: (context) => const InfluencerNavScreen(),
        );
      case Routes.privacyPolicy:
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicy(),
        );
      case Routes.notifications:
        return MaterialPageRoute(
          builder: (context) => const Notifications(),
        );
      case Routes.categories:
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(
            categories: (args as List<List<String>>)[0],
            categoriesImages: (args)[1],
          ),
        );
      case Routes.influencers:
        return MaterialPageRoute(
          builder: (context) => InfluencersScreen(
            search: (args as List<SearchModel>),
          ),
        );
    }
    return null;
  }
}
