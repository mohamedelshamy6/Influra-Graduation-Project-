import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_colors.dart';
import 'package:influra/core/routing/routes.dart';

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
      child: MaterialApp(
        initialRoute: Routes.signUpSelection,
        onGenerateRoute: AppRoutes().generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColorLight: AppColors.mainBlue,
          scaffoldBackgroundColor: const Color(0xffFFFFFF),
          useMaterial3: true,
          brightness: Brightness.light,
        ),
      ),
    );
  }
}
