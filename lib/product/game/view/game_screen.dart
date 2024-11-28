import 'package:auto_route/auto_route.dart';
import 'package:davet/core/extension/screen_size.dart';
import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:davet/core/utilty/color_items.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    double height = (context.height - 200) / 45;
    double width = (context.width - 212);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "dawah",
          style: TextStyle(
            fontFamily: 'Akasi',
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          Row(
            children: [
              Icon(
                Icons.local_fire_department_outlined,
                color: ColorItem.labelColor.str(),
              ),
              Text(
                " 0",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: ColorItem.labelColor.str(),
                    ),
              )
            ],
          ),
          const SizedBox(width: 20),
          Row(
            children: [
              Icon(
                Icons.token_outlined,
                // color: ColorItem.labelColor.str(),
                color: Colors.blue.shade400,
              ),
              Text(
                " 1220",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      // color: ColorItem.labelColor.str(),
                      color: Colors.blue.shade400,
                    ),
              )
            ],
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const GameTitleWidget(),
            const SizedBox(height: 5),
            CircularPercentIndicator(
              backgroundColor: Colors.grey.shade400,
              radius: 55.0,
              lineWidth: 8.0,
              animation: true,
              animationDuration: 2000,
              percent: 0.4,
              animateFromLastPercent: true,
              center: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    StarLevelWidget(),
                  ],
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
              widgetIndicator: Center(
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(5),
                ),
              ),
            ),
            SizedBox(height: height),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: width / 2 - 40),
                      const StarLevelWidget(),
                    ],
                  ),
                  SizedBox(height: height),
                  Row(
                    children: [
                      SizedBox(width: width / 2 - 80),
                      const StarLevelWidget(),
                    ],
                  ),
                  SizedBox(height: height),
                  const StarLevelWidget(),
                  SizedBox(height: height),
                  const StarLevelWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StarLevelWidget extends StatelessWidget {
  const StarLevelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            top: 9,
            child: Container(
              width: 79,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500, // Gölge rengi
                    blurRadius: 5.0, // Bulanıklık miktarı
                    offset: const Offset(0, 4), // Yatay ve dikey kayma (x, y)
                    spreadRadius: 1.5, // Gölgenin yayılma oranı
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 80,
            height: 70,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 211, 209, 209),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: 55,
                    child: Icon(
                      Icons.star_rounded,
                      color: Colors.grey.shade500,
                      size: 55,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GameTitleWidget extends StatelessWidget {
  const GameTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 75,
      decoration: BoxDecoration(
        // color: ColorItem.labelColor.str().withOpacity(0.55),
        // color: Colors.purple.withOpacity(0.7),
        color: Colors.black87,
        borderRadius: BorderRadiusItem.medium.str(),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1. KISIM, 1. ÜNİTE",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                ),
                Text(
                  "Kişileri betimle",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: 3,
            height: 75,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.menu_book_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
