import 'package:auto_route/auto_route.dart';
import 'package:davet/core/navigation/app_router.dart';
import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:davet/product/apps/model/apps_model.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppsScreen extends StatefulWidget {
  const AppsScreen({super.key});
  @override
  State<AppsScreen> createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  List<AppsModel> apps = [
    AppsModel(
      id: 1,
      name: "Zikir Sayacı",
      description: "Günlük zikirlerinizi sayın",
      icon: Icons.repeat_one,
      color: const Color.fromRGBO(76, 175, 80, 1),
    ),
    AppsModel(
      id: 2,
      name: "Kıble Bulucu",
      description: "Kıble yönünü bulun",
      icon: Icons.explore,
      color: const Color.fromRGBO(33, 150, 243, 1),
    ),
    AppsModel(
      id: 3,
      name: "Dualar",
      description: "Günlük duaları öğrenin",
      icon: Icons.menu_book,
      color: const Color.fromRGBO(156, 39, 176, 1),
    ),
    AppsModel(
      id: 4,
      name: "Kuran-ı Kerim",
      description: "Kuran okuyun ve dinleyin",
      icon: Icons.auto_stories_outlined,
      color: const Color.fromRGBO(255, 152, 0, 1),
    ),
    AppsModel(
      id: 5,
      name: "Namaz Vakitleri",
      description: "Namaz vakitlerini takip edin",
      icon: Icons.schedule,
      color: const Color.fromRGBO(233, 30, 99, 1),
    ),
    AppsModel(
      id: 6,
      name: "Esma-ül Hüsna",
      description: "Allahın 99 ismini öğrenin",
      icon: Icons.star,
      color: const Color.fromRGBO(0, 150, 136, 1),
    ),
    // AppsModel(id: 1, name: "Kuran-ı Kerim", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Kıble", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Yakın Camiler", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Kütüphane", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Kuran Radyo", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Tesbihat", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Hatimler", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "İmsakiye", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Zikirmatik", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Kazalar", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Kazalar", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "MultiMedya", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Tebrik Kartı", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Amel Defteri", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Dualar", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Canlı Yayınlar", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Zikir Dünyası", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Hikmetname", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Hatırlatıcılar", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Dini Günler", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Miladi-Hicri", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Esmaül Hüsna", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Vaktin Hadisi", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Zekatmatik", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Destek", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Kuran Ezberle", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Haftanın Hutbesi", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Okunan Ayeti Bul", imageUrl: ImageItem.adressIcon),
    // AppsModel(id: 1, name: "Dua Kardeşliği", imageUrl: ImageItem.adressIcon),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Uygulamalar",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 24,
                    ),
              ),
              Text(
                "Dini görevlerinizi kolayca yerine getirin",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                    ),
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 sütunlu grid
            crossAxisSpacing: 8, // Sütunlar arasındaki boşluk
            mainAxisSpacing: 8, // Satırlar arasındaki boşluk
            childAspectRatio: 1 / 1, // Kartların boy/en oranı
          ),
          itemCount: apps.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                if (apps[index].id == 1) {
                  context.router.pushNamed(RouterItem.zikirmatik.str());
                } else if (apps[index].id == 2) {
                  context.router.pushNamed(RouterItem.qibla.str());
                } else if (apps[index].id == 3) {
                  context.router.pushNamed(RouterItem.prayer.str());
                } else if (apps[index].id == 4) {
                  context.router.pushNamed(RouterItem.quran.str());
                } else if (apps[index].id == 5) {
                  //context.router.pushNamed(RouterItem.prayer.str());
                } else if (apps[index].id == 6) {
                  context.router.pushNamed(RouterItem.esmaulHusna.str());
                }
              },
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: apps[index].color,
                          borderRadius: BorderRadiusItem.medium.str(),
                        ),
                        child: Icon(
                          apps[index].icon,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          textAlign: TextAlign.center,
                          apps[index].name,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        apps[index].description,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
