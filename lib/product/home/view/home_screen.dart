import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:davet/core/extension/screen_size.dart';
import 'package:davet/core/location/location_model.dart';
import 'package:davet/core/log/log.dart';
import 'package:davet/core/navigation/app_router.dart';
import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:davet/core/utilty/color_items.dart';
import 'package:davet/core/utilty/hive_items.dart';
import 'package:davet/core/utilty/images_items.dart';
import 'package:davet/product/bottom_navigation/viewmodel/bottom_navigation_viewmodel.dart';
import 'package:davet/product/home/widget/story_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

  late Location? location;

  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  final List<String> _items = [
    "Hadis: İnsanların hayırlısı insanlara faydalı olandır.",
    "Dua: Rabbim, bizi doğru yoldan ayırma.",
    "Günün Sözü: Hayat, ne kadar güzel baktığınla ilgilidir.",
    "İlham: Başarı, sabır ve çalışkanlıkla gelir.",
  ];

  @override
  void initState() {
    super.initState();
    //konum işlemleri
    Box<Location> locationBox = Hive.box<Location>(HiveItem.location.str());
    location = locationBox.get(HiveItem.location.str());
    Log.info("enlem : ${location?.latitude} | boylam : ${location?.longitude}");
    // Otomatik sayfa geçişi //Günün Rehberinde
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentIndex < _items.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0; // Baştan başla
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
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
              context.router.pushNamed(RouterItem.notification.str());
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
              "Günün Rehberi",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: context.width,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusItem.large.str(),
                  color: ColorItem.labelColor.str().withOpacity(0.6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                _items[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: _items.length,
                      effect: WormEffect(
                        dotHeight: 12,
                        dotWidth: 12,
                        activeDotColor: Colors.blueGrey.shade50,
                        dotColor: Colors.black26,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
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
          ],
        ),
      ),
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
