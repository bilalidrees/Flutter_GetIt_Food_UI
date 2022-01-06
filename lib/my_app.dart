import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foody_yo/constants/image_string.dart';

import 'package:foody_yo/route_generator.dart';
import 'package:foody_yo/presentation/theme/app_theme.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'constants/route_string.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      theme: AppTheme.mainTheme,
      initialRoute: RouteString.initial,
      onGenerateRoute: RouteGenerator.generateRoute,
      // navigatorObservers: [
      //   RouteObservers.routeObserver,
      // ],


    );
  }

  @override
  void initState() {
    scheduleMicrotask((){
      precacheImage(ImageString.takeFood, context);
      precacheImage(ImageString.burger, context);
      precacheImage(ImageString.facebook, context);
      precacheImage(ImageString.google, context);
      precacheImage(ImageString.cart, context);
      precacheImage(ImageString.navigation, context);
      precacheImage(ImageString.heart, context);
      precacheImage(ImageString.appBarBackGround, context);
      precacheImage(ImageString.profile, context);
      precacheImage(ImageString.address, context);
      precacheImage(ImageString.reward, context);
      precacheImage(ImageString.voucher, context);
      precacheImage(ImageString.splash, context);


    });
    super.initState();
  }
}
