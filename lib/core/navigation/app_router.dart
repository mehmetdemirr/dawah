import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:davet/product/apps/view/apps_screen.dart';
import 'package:davet/product/bottom_navigation/view/bottom_navigation_screen.dart';
import 'package:davet/product/home/view/home_screen.dart';
import 'package:davet/product/profile/view/profile_screen.dart';
import 'package:davet/product/setting/setting_screen.dart';
import 'package:davet/product/splash/view/splash_screen.dart';
import 'package:davet/product/starting/view/starting_screen.dart';
import 'package:davet/product/story_view/view/story_view_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen|Page,Route',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => Platform.isAndroid
      ? const RouteType.material()
      : const RouteType.cupertino();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: RouterItem.splash.str(),
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: RouterItem.starting.str(),
          page: StartingRoute.page,
        ),
        AutoRoute(
          path: RouterItem.bottomNavigation.str(),
          page: BottomNavigationRoute.page,
        ),
        AutoRoute(
          path: RouterItem.storyView.str(),
          page: StoryViewRoute.page,
        ),
      ];
}

enum RouterItem {
  splash,
  starting,
  storyView,
  login,
  register,
  resetPassword,
  forgotPassword,
  bottomNavigation,
  home,
}

extension RouterItems on RouterItem {
  String str() {
    return "/$name";
  }
}
