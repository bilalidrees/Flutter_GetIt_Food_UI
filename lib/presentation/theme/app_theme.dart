import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTheme{
  static  ThemeData  mainTheme = _mainTheme;
}
ThemeData _mainTheme = ThemeData(
  brightness: Brightness.light,
  textTheme:  GoogleFonts.openSansTextTheme(),
  appBarTheme: const AppBarTheme(color: AppColor.transparent),
  scaffoldBackgroundColor: AppColor.whiteColor
);

