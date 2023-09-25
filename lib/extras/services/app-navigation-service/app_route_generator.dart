import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled05/core/presentation/pages/on-boarding-page/on_boarding_page_view.dart';
import 'package:untitled05/core/presentation/pages/splash-page/splash_page_view.dart';

class AppRouteNames{
  const AppRouteNames._();
  /////////////////////////
  static const String SPLASH_PAGE = "/splash-page";
  static const String ON_BOARDING_PAGE = "/on-boarding-page";
}

class AppRouter{
  const AppRouter._();
  /////////////////////////
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings,) {
    switch (routeSettings.name){
      case AppRouteNames.SPLASH_PAGE: {
        return _adaptiveRoute<dynamic>(
          routeSettings: routeSettings,
          builder: (BuildContext buildContext,) {
            return const SplashPageView();
          },
        );
      }
      case AppRouteNames.ON_BOARDING_PAGE: {
        return _adaptiveRoute<dynamic>(
          routeSettings: routeSettings,
          builder: (BuildContext buildContext,) {
            return const OnBoardingPageView();
          },
        );
      }
      default:
      return _adaptiveRoute(
        routeSettings: routeSettings,
        builder: (BuildContext buildContext,) {
          return Scaffold(
            body: SizedBox.expand(
              child: Center(
                child: ErrorWidget("unknown-route",),
              ),
            ),
          );
        },
      );
    }
  }
  /////////////////////////
  static Route<T> _adaptiveRoute<T>({
    required RouteSettings routeSettings,
    required WidgetBuilder builder,
  }){
    if(Platform.isAndroid) {
      return MaterialPageRoute<T>(
        settings: routeSettings,
        builder: builder,
      );
    }
    else if(Platform.isIOS) {
      return CupertinoPageRoute<T>(
        settings: routeSettings,
        builder: builder,
      );
    }
    else {
      return PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (BuildContext buildContext, _, __,) => builder(buildContext,),
      );
    }
  }
}
