import 'package:auto_route/auto_route.dart';
import 'package:davet/core/location/location_model.dart';
import 'package:davet/core/utilty/hive_items.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          const Text("HomeScreen"),
          Text("latidude: ${location?.latitude ?? "-"}"),
          Text("long: ${location?.longitude ?? "-"}"),
        ],
      ),
    );
  }
}
