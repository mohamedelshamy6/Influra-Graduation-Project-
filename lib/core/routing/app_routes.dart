import 'package:flutter/material.dart';
import 'package:influra/core/routing/routes.dart';

import '../../features/on_boarding/view/screens/on_boarding.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
    return null;
  }
}
