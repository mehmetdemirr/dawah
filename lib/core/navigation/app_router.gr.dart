// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AppsScreen]
class AppsRoute extends PageRouteInfo<void> {
  const AppsRoute({List<PageRouteInfo>? children})
      : super(
          AppsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppsScreen();
    },
  );
}

/// generated route for
/// [BottomNavigationScreen]
class BottomNavigationRoute extends PageRouteInfo<void> {
  const BottomNavigationRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BottomNavigationScreen();
    },
  );
}

/// generated route for
/// [GameScreen]
class GameRoute extends PageRouteInfo<void> {
  const GameRoute({List<PageRouteInfo>? children})
      : super(
          GameRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GameScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationScreen();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [SettingScreen]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [StartingScreen]
class StartingRoute extends PageRouteInfo<void> {
  const StartingRoute({List<PageRouteInfo>? children})
      : super(
          StartingRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StartingScreen();
    },
  );
}

/// generated route for
/// [StoryViewScreen]
class StoryViewRoute extends PageRouteInfo<StoryViewRouteArgs> {
  StoryViewRoute({
    Key? key,
    required List<String> imageList,
    List<PageRouteInfo>? children,
  }) : super(
          StoryViewRoute.name,
          args: StoryViewRouteArgs(
            key: key,
            imageList: imageList,
          ),
          initialChildren: children,
        );

  static const String name = 'StoryViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StoryViewRouteArgs>();
      return StoryViewScreen(
        key: args.key,
        imageList: args.imageList,
      );
    },
  );
}

class StoryViewRouteArgs {
  const StoryViewRouteArgs({
    this.key,
    required this.imageList,
  });

  final Key? key;

  final List<String> imageList;

  @override
  String toString() {
    return 'StoryViewRouteArgs{key: $key, imageList: $imageList}';
  }
}

/// generated route for
/// [TaskScreen]
class TaskRoute extends PageRouteInfo<void> {
  const TaskRoute({List<PageRouteInfo>? children})
      : super(
          TaskRoute.name,
          initialChildren: children,
        );

  static const String name = 'TaskRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TaskScreen();
    },
  );
}
