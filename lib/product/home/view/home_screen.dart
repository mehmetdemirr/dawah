import 'package:auto_route/auto_route.dart';
import 'package:davet/core/location/location_model.dart';
import 'package:davet/core/utilty/hive_items.dart';
import 'package:davet/core/utilty/images_items.dart';
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
      appBar: AppBar(title: const Text("Anasayfa")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: storyList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return StoryCardWidget(
                    story: storyList[index],
                    onTap: () => _showStory(context, storyList[index]),
                  );
                },
              ),
            ),
          ),
          const Text("HomeScreen"),
          Text("latidude: ${location?.latitude ?? "-"}"),
          Text("long: ${location?.longitude ?? "-"}"),
        ],
      ),
    );
  }

  void _showStory(BuildContext context, StoryModel story) async {
    // // Hikaye açılmadan önce kısa bir loading animasyonu göstermek için
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (BuildContext context) {
    //     return const Center(
    //       child: CircularProgressIndicator(
    //         color: Colors.purple,
    //       ),
    //     );
    //   },
    // );

    // // Hikaye yükleniyormuş gibi küçük bir gecikme ekleyelim
    // await Future.delayed(const Duration(seconds: 1));

    // // Loading ekranını kapatıyoruz
    // Navigator.pop(context);

    // Hikaye görüntüleyiciyi açalım
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  story.imageItem.str(),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                story.text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        );
      },
    );
  }
}
