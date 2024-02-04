import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
        ),
      ),
    );
  }
}
