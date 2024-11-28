import 'package:auto_route/auto_route.dart';
import 'package:davet/core/extension/screen_size.dart';
import 'package:davet/core/location/location_model.dart';
import 'package:davet/core/location/location_service.dart';
import 'package:davet/core/log/log.dart';
import 'package:davet/core/navigation/app_router.dart';
import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:davet/core/utilty/color_items.dart';
import 'package:davet/core/utilty/hive_items.dart';
import 'package:davet/core/utilty/images_items.dart';
import 'package:davet/general/widget/custom_dropdown_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';

@RoutePage()
class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});
  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorItem.labelColor.str(),
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: context.width * 0.85,
            height: 215,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadiusItem.medium.str(),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 10),
                  child: Text(
                    "Esselâmu Aleyüm",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 81, 0),
                        ),
                  ),
                ),
                Text(
                  "Davet",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                ),
                Text(
                  "İslam’ın aydınlık yoluna davetlisiniz...",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    child: CustomhDropDownWidget(
                      items: const [
                        "Türkçe",
                        "İngilizce",
                      ],
                      selectedValue: "Türkçe",
                      isSearch: true,
                      selectedColor: ColorItem.suYesili200.str(),
                      onChanged: (value) {},
                    ),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Image.asset(
              ImageItem.startImage.str(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CheckboxListTile(
              selected: false,
              value: true,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {},
              title: Text.rich(
                TextSpan(
                  text: "Uygulamanın ",
                  style: const TextStyle(fontSize: 16),
                  children: [
                    TextSpan(
                      text: "kullanıcı şartları ve gizlilik sözleşmesini ",
                      style: TextStyle(
                        color: ColorItem.suYesili.str(),
                        decoration: TextDecoration.underline, // Altı çizili
                        decorationColor: ColorItem.suYesili.str(),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Log.info(
                              'Kullanıcı şartları ve gizlilik sözleşmesi tıklandı.');
                        },
                    ),
                    const TextSpan(text: "okudum ve kabul ediyorum."),
                  ],
                ),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final locationService = LocationService();

              try {
                Position position = await locationService.determinePosition();
                Log.info(
                    'Current position: ${position.latitude}, ${position.longitude}');
                // ignore: use_build_context_synchronously

                final location = Location(
                  latitude: position.latitude,
                  longitude: position.longitude,
                );
                Box<Location> locationBox =
                    Hive.box<Location>(HiveItem.location.str());
                await locationBox
                    .put(HiveItem.location.str(), location)
                    .then((_) {
                  // ignore: use_build_context_synchronously
                  context.router.replaceAll([
                    const BottomNavigationRoute(),
                  ]);
                });
              } catch (e) {
                Log.error('Error: $e');
                EasyLoading.showError("Konum alınamadı !\nError:$e");
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: ColorItem.suYesili200.str(),
                borderRadius: BorderRadiusItem.small.str(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "KONUMU BUL",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
