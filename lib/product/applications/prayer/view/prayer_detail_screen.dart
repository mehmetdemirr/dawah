import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PrayerDetailScreen extends StatelessWidget {
  final String title;

  const PrayerDetailScreen({
    super.key,
    @PathParam('title') required this.title,
  });

  List<Map<String, String>> getDualarByCategory() {
    switch (title) {
      case 'Sabah Duaları':
        return [
          {
            'name': 'Sabah Duası',
            'arabic': 'اللَّهُمَّ بِكَ أَصْبَحْنَا وَبِكَ أَمْسَيْنَا',
            'okunusu': 'Allahümme bike asbahna ve bike emseyna',
            'anlami':
                'Allah\'ım! Senin yardımınla sabahladık, Senin yardımınla akşamladık',
          },
          {
            'name': 'Güne Başlama Duası',
            'arabic': 'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ',
            'okunusu': 'Asbahna ve asbahal mülkü lillah',
            'anlami': 'Biz de mülk de Allah için var olduk',
          },
        ];

      case 'Akşam Duaları':
        return [
          {
            'name': 'Akşam Duası',
            'arabic': 'اللَّهُمَّ بِكَ أَمْسَيْنَا وَبِكَ أَصْبَحْنَا',
            'okunusu': 'Allahümme bike emseyna ve bike asbahna',
            'anlami':
                'Allah\'ım! Senin yardımınla akşamladık, Senin yardımınla sabahladık',
          },
        ];

      case 'Yemek Duaları':
        return [
          {
            'name': 'Yemek Duası',
            'arabic': 'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيمِ',
            'okunusu': 'Bismillahirrahmanirrahim',
            'anlami': 'Rahman ve Rahim olan Allah\'ın adıyla',
          },
        ];

      default:
        return [
          {
            'name': 'Örnek Dua',
            'arabic': 'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيمِ',
            'okunusu': 'Bismillahirrahmanirrahim',
            'anlami': 'Rahman ve Rahim olan Allah\'ın adıyla',
          },
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final dualar = getDualarByCategory();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.back(),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dualar.length,
        itemBuilder: (context, index) {
          final dua = dualar[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              title: Text(
                dua['name']!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        dua['arabic']!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Okunuşu:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        dua['okunusu']!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Anlamı:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        dua['anlami']!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
