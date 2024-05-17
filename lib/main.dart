import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/helpers/cache_helper.dart';
import 'core/helpers/helper_methods.dart';

import 'influra.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await GoogleFonts.pendingFonts([
    GoogleFonts.poppins(),
  ]);
  await CacheHelper().init();
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  HelperMethods.svgPrecacheImage();

  LicenseRegistry.addLicense(
    () async* {
      final license = await rootBundle.loadString('assets/fonts/poppins/OFL.txt');
      yield LicenseEntryWithLineBreaks(
        ['assets/fonts/poppins'],
        license,
      );
    },
  );
  runApp(const InfluraApp());
  //
}
