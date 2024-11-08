// ignore_for_file: lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:davet/core/log/log.dart';
import 'package:flutter/material.dart';

class MyObserver extends AutoRouterObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.navigate(
      'New route pushed: ${route.settings.name}, path: ${route.data?.path}',
    );
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    Log.navigate('Tab route visited: ${route.name}, path: ${route.path}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    Log.navigate('Tab route re-visited: ${route.name}, path: ${route.path}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.navigate(
      'Poped route: ${route.data?.name}}, path: ${route.data?.path}',
    );
  }
}
