import 'package:auto_route/auto_route.dart';
import 'package:davet/core/extension/screen_size.dart';
import 'package:davet/core/location/location_model.dart';
import 'package:davet/core/navigation/app_router.dart';
import 'package:davet/core/utilty/color_items.dart';
import 'package:davet/core/utilty/hive_items.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  late Location? location;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) async {
      Box<Location> locationBox = Hive.box<Location>(HiveItem.location.str());
      location = locationBox.get(HiveItem.location.str());
      if (location == null) {
        context.router.replaceNamed(RouterItem.starting.str());
      } else {
        context.router.replaceNamed(RouterItem.bottomNavigation.str());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorItem.labelColor.str(),
      body: Stack(
        children: [
          const Center(
            child: Text(
              "dawah",
              style: TextStyle(
                fontFamily: 'Akasi',
                fontSize: 100,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: SizedBox(
              width: context.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "powerd by mehmet",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
