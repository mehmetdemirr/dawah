import 'package:auto_route/auto_route.dart';
import 'package:davet/core/utilty/color_items.dart';
import 'package:davet/product/game/model/level_model.dart';
import 'package:davet/product/game/widget/game_title_widget.dart';
import 'package:davet/product/game/widget/level_card_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<LevelModel> islamicLevels = [
    LevelModel(
      id: 1,
      level: 'Başlangıç',
      status: 2,
      rating: 2,
      levelTitle: 'İslam’a Giriş',
      levelDescription:
          'İslam’ın temel prensiplerini öğrenin, beş şartı keşfedin.',
    ),
    LevelModel(
      id: 2,
      level: 'Başlangıç-Orta',
      status: 2,
      rating: 2,
      levelTitle: 'Peygamber Efendimiz (sav)',
      levelDescription:
          'Peygamber Efendimiz (sav)’in hayatını ve öğretilerini öğrenin.',
    ),
    LevelModel(
      id: 3,
      level: 'Başlangıç - Orta',
      status: 1,
      rating: 3,
      levelTitle: 'İslam’ın Beş Şartı',
      levelDescription:
          'İslam’ın Beş Şartı hakkında derinlemesine bilgi edinin.',
    ),
    LevelModel(
      id: 4,
      level: 'Orta-İleri',
      status: 0,
      rating: 4,
      levelTitle: 'Kur’an ve Hadis',
      levelDescription:
          'Kur’an ve Peygamber Efendimiz (sav)’in hadisleri hakkında bilgi sahibi olun.',
    ),
    LevelModel(
      id: 5,
      level: 'İleri',
      status: 0,
      rating: 5,
      levelTitle: 'Fıkıh (İslam Hukuku)',
      levelDescription:
          'İslam hukuku ve temel dini hükümler hakkında bilgi edinin.',
    ),
    LevelModel(
      id: 6,
      level: 'İleri',
      status: 0,
      rating: 0,
      levelTitle: 'İslam Tarihi',
      levelDescription:
          'İslam’ın tarihsel süreci ve önemli olaylarını keşfedin.',
    ),
    LevelModel(
      id: 7,
      level: 'İleri',
      status: 0,
      rating: 5,
      levelTitle: 'İslam Felsefesi',
      levelDescription:
          'İslam düşüncesinde temel felsefi kavramları inceleyin.',
    ),
    LevelModel(
      id: 8,
      level: 'Uzman',
      status: 0,
      rating: 6,
      levelTitle: 'Sahabe Hayatı',
      levelDescription:
          'Peygamber Efendimiz (sav)’in sahabelerinin hayatlarını ve katkılarını inceleyin.',
    ),
    LevelModel(
      id: 9,
      level: 'Uzman',
      status: 0,
      rating: 6,
      levelTitle: 'Tefsir (Kur’an Yorumları)',
      levelDescription:
          'Kur’an ayetlerinin derinlemesine yorumlarını ve anlamlarını öğrenin.',
    ),
    LevelModel(
      id: 10,
      level: 'Uzman',
      status: 0,
      rating: 7,
      levelTitle: 'İslam İtikadı (Akaid)',
      levelDescription:
          'İslam’ın temel inanç esaslarını ve teolojik görüşlerini öğrenin.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: const GameTitleWidget(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: islamicLevels.length,
              itemBuilder: (context, index) {
                bool isLeft = index % 2 == 0;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: LevelCard(
                    level: islamicLevels[index].level,
                    isRight: !isLeft,
                    status: islamicLevels[index].status,
                    rating: 3,
                    levelTitle: islamicLevels[index].levelTitle,
                    levelDescription: islamicLevels[index].levelDescription,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
