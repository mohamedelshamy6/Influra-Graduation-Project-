import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_colors.dart';
import 'core/routing/routes.dart';

import 'core/routing/app_routes.dart';

class InfluraApp extends StatelessWidget {
  const InfluraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //* The size of the screen of figma design.
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MaterialApp(
        initialRoute: Routes.splash,
        onGenerateRoute: AppRoutes().generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            scrolledUnderElevation: 0,
            iconTheme: IconThemeData(
              color: AppColors.mainBlue,
              size: 36.r,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          primaryColorLight: AppColors.mainBlue,
          scaffoldBackgroundColor: const Color(0xffFFFFFF),
          useMaterial3: true,
          brightness: Brightness.light,
        ),
      ),
    );
  }
}
