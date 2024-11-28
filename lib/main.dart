import 'package:davet/core/cache/shared_pref.dart';
import 'package:davet/core/location/location_model.dart';
import 'package:davet/core/log/auto_route_observer.dart';
import 'package:davet/core/log/log.dart';
import 'package:davet/core/navigation/app_router.dart';
import 'package:davet/core/network_control/no_network_widget.dart';
import 'package:davet/core/theme/dark_theme.dart';
import 'package:davet/core/theme/light_theme.dart';
import 'package:davet/core/theme/theme_view_model.dart';
import 'package:davet/core/utilty/hive_items.dart';
import 'package:davet/product/bottom_navigation/viewmodel/bottom_navigation_viewmodel.dart';
import 'package:davet/product/story_view/viewmodel/story_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.request();
  //Remove this method to stop OneSignal Debugging
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("a7b121bf-aa74-4dc2-9ea8-6a35ac2515d5");
  final id = OneSignal.User.pushSubscription.id;
  if (id != null) {
    await SharedPref().setOnesignalId(id);
    Log.info("Onseignal id: $id");
  } else {
    Log.error("onesignal id yok");
  }
  // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission(true);
  await EasyLocalization.ensureInitialized();
  final darkModeOn = await SharedPref().getTheme();
  getIt.registerSingleton<AppRouter>(AppRouter());
  await Hive.initFlutter();
  Hive.openBox<Location>(HiveItem.location.str());
  Hive.registerAdapter(LocationAdapter());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
        ),
        ChangeNotifierProvider<BottomNavigationViewModel>(
          create: (_) => BottomNavigationViewModel(),
        ),
        ChangeNotifierProvider<StoryViewViewModel>(
          create: (_) => StoryViewViewModel(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('tr', 'TR'),
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('tr', 'TR'),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //local language change example: date picker , time picker
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.deviceLocale,

      debugShowCheckedModeBanner: false,
      title: 'Fıtı Fıtı',
      //theme
      theme: context.watch<ThemeNotifier>().getTheme() ? darkTheme : lightTheme,
      //router
      routerConfig: appRouter.config(
        navigatorObservers: () => [
          MyObserver(),
        ],
      ),
      //network control
      builder: EasyLoading.init(
        builder: (context, child) {
          return Column(
            children: [
              Expanded(
                child: child ?? const SizedBox(),
              ),
              const NoNetworkWidget(),
            ],
          );
        },
      ),
    );
  }
}
