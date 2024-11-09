import 'package:auto_route/auto_route.dart';
import 'package:davet/core/extension/screen_size.dart';
import 'package:davet/core/location/location_model.dart';
import 'package:davet/core/navigation/app_router.dart';
import 'package:davet/core/utilty/hive_items.dart';
import 'package:davet/core/utilty/images_items.dart';
import 'package:davet/product/apps/view/apps_screen.dart';
import 'package:davet/product/home/widget/story_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
            // context.router.pushNamed(RouterItem.setting.str());
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
              // context.read<BottomNavigationViewModel>().changeSelectedIndex(4);
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
                        context.router.pushNamed(RouterItem.storyView.str());
                      },
                    );
                  },
                ),
              ),
            ),
            Text(
              "Merhaba,Mehmet !",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
            ),
            const Text("HomeScreen"),
            Text("latidude: ${location?.latitude ?? "-"}"),
            Text("long: ${location?.longitude ?? "-"}"),
          ],
        ),
      ),
    );
  }
}
