import 'package:auto_route/auto_route.dart';
import 'package:davet/core/extension/screen_size.dart';
import 'package:davet/core/location/location_model.dart';
import 'package:davet/core/navigation/app_router.dart';
import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:davet/core/utilty/color_items.dart';
import 'package:davet/core/utilty/hive_items.dart';
import 'package:davet/core/utilty/images_items.dart';
import 'package:davet/product/apps/view/apps_screen.dart';
import 'package:davet/product/bottom_navigation/viewmodel/bottom_navigation_viewmodel.dart';
import 'package:davet/product/home/widget/story_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StoryModel> storyList = [
    StoryModel(imageItem: ImageItem.profileIcon, text: 'Cuma', id: 1),
    StoryModel(imageItem: ImageItem.profileIcon, text: 'Ayet', id: 1),
    StoryModel(imageItem: ImageItem.profileIcon, text: 'Hadis', id: 1),
    StoryModel(imageItem: ImageItem.profileIcon, text: 'Dua', id: 1),
    StoryModel(imageItem: ImageItem.profileIcon, text: 'Özlü Sözler', id: 1),
  ];
  @override
  late Location? location;

  @override
  void initState() {
    super.initState();
    Box<Location> locationBox = Hive.box<Location>(HiveItem.location.str());
    location = locationBox.get(HiveItem.location.str());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.pushNamed(RouterItem.setting.str());
          },
          icon: Image.asset(ImageItem.setting.str()),
        ),
        title: Text(
          "Ana Sayfa",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // context.router.pushNamed(RouterItem.notification.str());
            },
            icon: Image.asset(ImageItem.notification.str()),
          ),
          IconButton(
            onPressed: () {
              context.read<BottomNavigationViewModel>().changeSelectedIndex(4);
            },
            icon: const Icon(
              Icons.person,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                height: 117,
                child: ListView.builder(
                  itemCount: storyList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return StoryCardWidget(
                      story: storyList[index],
                      onTap: () {
                        context.router.push(StoryViewRoute(
                          imageList: const [
                            "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
                            "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                            "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
                            "https://insanisi.com/assets/frontend/img/logo/logo.png",
                          ],
                        ));
                      },
                    );
                  },
                ),
              ),
            ),
            Text(
              "Merhaba Mehmet,",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PrayerTimeWidget(
                  timeName: 'İmsak',
                  time: '06:00',
                ),
                PrayerTimeWidget(
                  timeName: 'Sabah',
                  time: '06:22',
                ),
                PrayerTimeWidget(
                  timeName: 'Güneş',
                  time: '07:22',
                ),
                PrayerTimeWidget(
                  timeName: 'Öğle',
                  time: '12:45',
                ),
                PrayerTimeWidget(
                  timeName: 'İkindi',
                  time: '15:33',
                ),
                PrayerTimeWidget(
                  timeName: 'Akşam',
                  time: '17:57',
                  isActive: true,
                ),
                PrayerTimeWidget(
                  timeName: 'Yatsı',
                  time: '19:14',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "İlerlemen",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
            ),
            Container(
              width: context.width,
              height: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusItem.large.str(),
                color: ColorItem.labelColor.str().withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Konular",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      GradientButtonWidget(
                        gradientColors: [
                          Color(0xFF548AD8),
                          Color(0xFF8A4BD3),
                        ],
                        text: "İman",
                      ),
                      SizedBox(width: 16),
                      GradientButtonWidget(
                        gradientColors: [
                          Color(0xFFF33E62),
                          Color(0xFFF79334),
                        ],
                        text: "İbadetler",
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      GradientButtonWidget(
                        gradientColors: [
                          Color(0xFF893E9C),
                          Color(0xFFF82B73),
                        ],
                        text: "Ahlak",
                      ),
                      SizedBox(width: 16),
                      GradientButtonWidget(
                        gradientColors: [
                          Color(0xFFD39646),
                          Color(0xFFCCCCCD),
                        ],
                        text: "Kuran",
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "İlerlemen",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: context.width,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusItem.large.str(),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: buildRangePointerExampleGauge(),
                      ),
                      const SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "İlerleme Durumun",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: ColorItem.labelColor.str(),
                                  ),
                            ),
                            SizedBox(
                              width: context.width - 200,
                              child: Text(
                                "Hedefe adım adım yaklaşıyorsun!",
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: ColorItem.labelColor.str(),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Returns the range pointer gauge
  SfRadialGauge buildRangePointerExampleGauge() {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          showLabels: false,
          showTicks: false,
          startAngle: 270,
          endAngle: 270,
          radiusFactor: 0.8,
          axisLineStyle: const AxisLineStyle(
            thicknessUnit: GaugeSizeUnit.factor,
            thickness: 0.15,
          ),
          annotations: const <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 180,
              widget: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    ' 58 % ',
                    style: TextStyle(
                      fontFamily: 'Times',
                      fontSize: true ? 18 : 22,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
          pointers: const <GaugePointer>[
            RangePointer(
              value: 50,
              cornerStyle: CornerStyle.bothCurve,
              enableAnimation: true,
              animationDuration: 1200,
              sizeUnit: GaugeSizeUnit.factor,
              gradient: SweepGradient(
                colors: <Color>[Color(0xFF6A6EF6), Color(0xFFDB82F5)],
                stops: <double>[0.25, 0.75],
              ),
              color: Color(0xFF00A8B5),
              width: 0.15,
            ),
          ],
        ),
      ],
    );
  }
}

class GradientButtonWidget extends StatelessWidget {
  const GradientButtonWidget({
    super.key,
    required this.gradientColors,
    required this.text,
  });

  final List<Color> gradientColors;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 2 - 32,
      height: 62,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusItem.large.str(),
        gradient: LinearGradient(
          colors: gradientColors,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
          ),
        ),
      ),
    );
  }
}

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({
    super.key,
    required this.timeName,
    required this.time,
    this.isActive = false,
  });
  final String timeName;
  final String time;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          timeName,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isActive
                    ? Colors.deepOrangeAccent
                    : ColorItem.labelColor.str().withOpacity(0.8),
              ),
        ),
        Text(
          time,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isActive
                    ? Colors.deepOrangeAccent
                    : ColorItem.labelColor.str(),
              ),
        ),
      ],
    );
  }
}
