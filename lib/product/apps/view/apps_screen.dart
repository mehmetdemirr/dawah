import 'package:auto_route/auto_route.dart';
import 'package:davet/core/extension/screen_size.dart';
import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:davet/core/utilty/images_items.dart';
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
    AppsModel(id: 1, name: "Vaktinde Kıl", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Kuran-ı Kerim", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Kıble", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Yakın Camiler", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Kütüphane", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Kuran Radyo", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Tesbihat", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Hatimler", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "İmsakiye", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Zikirmatik", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Kazalar", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Kazalar", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "MultiMedya", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Tebrik Kartı", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Amel Defteri", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Dualar", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Canlı Yayınlar", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Zikir Dünyası", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Hikmetname", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Hatırlatıcılar", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Dini Günler", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Miladi-Hicri", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Esmaül Hüsna", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Vaktin Hadisi", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Zekatmatik", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Destek", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Kuran Ezberle", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Haftanın Hutbesi", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Okunan Ayeti Bul", imageUrl: ImageItem.adressIcon),
    AppsModel(id: 1, name: "Dua Kardeşliği", imageUrl: ImageItem.adressIcon),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Uygulamalar")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 2 sütunlu grid
            crossAxisSpacing: 8, // Sütunlar arasındaki boşluk
            mainAxisSpacing: 8, // Satırlar arasındaki boşluk
            childAspectRatio: 1 / 1, // Kartların boy/en oranı
          ),
          itemCount: apps.length,
          itemBuilder: (BuildContext context, int index) {
            double width = context.width;
            return InkWell(
              onTap: () {},
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade100,
                            borderRadius: BorderRadiusItem.small.str(),
                          ),
                          child: Image.asset(apps[index].imageUrl.str()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          textAlign: TextAlign.center,
                          apps[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(),
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
