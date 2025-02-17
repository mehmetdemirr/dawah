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
/// [EsmaulHusnaScreen]
class EsmaulHusnaRoute extends PageRouteInfo<void> {
  const EsmaulHusnaRoute({List<PageRouteInfo>? children})
      : super(
          EsmaulHusnaRoute.name,
          initialChildren: children,
        );

  static const String name = 'EsmaulHusnaRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EsmaulHusnaScreen();
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
/// [LessonsScreen]
class LessonsRoute extends PageRouteInfo<LessonsRouteArgs> {
  LessonsRoute({
    Key? key,
    required int levelId,
    required String levelTitle,
    List<PageRouteInfo>? children,
  }) : super(
          LessonsRoute.name,
          args: LessonsRouteArgs(
            key: key,
            levelId: levelId,
            levelTitle: levelTitle,
          ),
          initialChildren: children,
        );

  static const String name = 'LessonsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonsRouteArgs>();
      return LessonsScreen(
        key: args.key,
        levelId: args.levelId,
        levelTitle: args.levelTitle,
      );
    },
  );
}

class LessonsRouteArgs {
  const LessonsRouteArgs({
    this.key,
    required this.levelId,
    required this.levelTitle,
  });

  final Key? key;

  final int levelId;

  final String levelTitle;

  @override
  String toString() {
    return 'LessonsRouteArgs{key: $key, levelId: $levelId, levelTitle: $levelTitle}';
  }
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
/// [PrayerDetailScreen]
class PrayerDetailRoute extends PageRouteInfo<PrayerDetailRouteArgs> {
  PrayerDetailRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          PrayerDetailRoute.name,
          args: PrayerDetailRouteArgs(
            key: key,
            title: title,
          ),
          rawPathParams: {'title': title},
          initialChildren: children,
        );

  static const String name = 'PrayerDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PrayerDetailRouteArgs>(
          orElse: () =>
              PrayerDetailRouteArgs(title: pathParams.getString('title')));
      return PrayerDetailScreen(
        key: args.key,
        title: args.title,
      );
    },
  );
}

class PrayerDetailRouteArgs {
  const PrayerDetailRouteArgs({
    this.key,
    required this.title,
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'PrayerDetailRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [PrayerScreen]
class PrayerRoute extends PageRouteInfo<void> {
  const PrayerRoute({List<PageRouteInfo>? children})
      : super(
          PrayerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrayerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PrayerScreen();
    },
  );
}

/// generated route for
/// [ProfileEditScreen]
class ProfileEditRoute extends PageRouteInfo<void> {
  const ProfileEditRoute({List<PageRouteInfo>? children})
      : super(
          ProfileEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileEditRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileEditScreen();
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
/// [QiblaScreen]
class QiblaRoute extends PageRouteInfo<void> {
  const QiblaRoute({List<PageRouteInfo>? children})
      : super(
          QiblaRoute.name,
          initialChildren: children,
        );

  static const String name = 'QiblaRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QiblaScreen();
    },
  );
}

/// generated route for
/// [QuranScreen]
class QuranRoute extends PageRouteInfo<void> {
  const QuranRoute({List<PageRouteInfo>? children})
      : super(
          QuranRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuranRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QuranScreen();
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
/// [SurahDetailScreen]
class SurahDetailRoute extends PageRouteInfo<SurahDetailRouteArgs> {
  SurahDetailRoute({
    Key? key,
    required int surahNumber,
    required String surahName,
    List<PageRouteInfo>? children,
  }) : super(
          SurahDetailRoute.name,
          args: SurahDetailRouteArgs(
            key: key,
            surahNumber: surahNumber,
            surahName: surahName,
          ),
          initialChildren: children,
        );

  static const String name = 'SurahDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SurahDetailRouteArgs>();
      return SurahDetailScreen(
        key: args.key,
        surahNumber: args.surahNumber,
        surahName: args.surahName,
      );
    },
  );
}

class SurahDetailRouteArgs {
  const SurahDetailRouteArgs({
    this.key,
    required this.surahNumber,
    required this.surahName,
  });

  final Key? key;

  final int surahNumber;

  final String surahName;

  @override
  String toString() {
    return 'SurahDetailRouteArgs{key: $key, surahNumber: $surahNumber, surahName: $surahName}';
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

/// generated route for
/// [ZikirmatikScreen]
class ZikirmatikRoute extends PageRouteInfo<void> {
  const ZikirmatikRoute({List<PageRouteInfo>? children})
      : super(
          ZikirmatikRoute.name,
          initialChildren: children,
        );

  static const String name = 'ZikirmatikRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ZikirmatikScreen();
    },
  );
}
