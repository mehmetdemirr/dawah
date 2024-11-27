import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:davet/product/apps/view/apps_screen.dart';
import 'package:davet/product/bottom_navigation/view/bottom_navigation_screen.dart';
import 'package:davet/product/game/view/game_screen.dart';
import 'package:davet/product/home/view/home_screen.dart';
import 'package:davet/product/notification/view/notification_screen.dart';
import 'package:davet/product/profile/view/profile_screen.dart';
import 'package:davet/product/profile_edit/view/profile_edit_screen.dart';
import 'package:davet/product/setting/setting_screen.dart';
import 'package:davet/product/splash/view/splash_screen.dart';
import 'package:davet/product/starting/view/starting_screen.dart';
import 'package:davet/product/story_view/view/story_view_screen.dart';
import 'package:davet/product/task/view/task_screen.dart';
import 'package:flutter/material.dart';

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
        AutoRoute(
          path: RouterItem.game.str(),
          page: GameRoute.page,
        ),
        AutoRoute(
          path: RouterItem.setting.str(),
          page: SettingRoute.page,
        ),
        AutoRoute(
          path: RouterItem.notification.str(),
          page: NotificationRoute.page,
        ),
        AutoRoute(
          path: RouterItem.task.str(),
          page: TaskRoute.page,
        ),
        AutoRoute(
          path: RouterItem.profileEdit.str(),
          page: ProfileEditRoute.page,
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
  game,
  setting,
  notification,
  task,
  profileEdit,
}

extension RouterItems on RouterItem {
  String str() {
    return "/$name";
  }
}
