import 'package:auto_route/auto_route.dart';
import 'package:davet/core/navigation/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PrayerScreen extends StatelessWidget {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.back(),
        ),
        title: const Text(
          'Dualar',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildCategoryGrid(),
          const SizedBox(height: 24),
          _buildPopularPrayers(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Dua ara...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }

  Widget _buildCategoryGrid() {
    final categories = [
      {'icon': Icons.wb_sunny, 'name': 'Sabah Duaları', 'color': Colors.orange},
      {
        'icon': Icons.nights_stay,
        'name': 'Akşam Duaları',
        'color': Colors.indigo
      },
      {'icon': Icons.food_bank, 'name': 'Yemek Duaları', 'color': Colors.green},
      {'icon': Icons.mosque, 'name': 'Namaz Duaları', 'color': Colors.blue},
      {'icon': Icons.healing, 'name': 'Şifa Duaları', 'color': Colors.red},
      {'icon': Icons.favorite, 'name': 'Sevap Duaları', 'color': Colors.pink},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return _buildCategoryCard(
            icon: categories[index]['icon'] as IconData,
            name: categories[index]['name'] as String,
            color: categories[index]['color'] as Color,
            onTap: () {
              context.router.push(PrayerDetailRoute(
                  title: categories[index]['name'] as String));
            });
      },
    );
  }

  Widget _buildCategoryCard({
    required IconData icon,
    required String name,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: color),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularPrayers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sık Okunan Dualar',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildPrayerCard(
              title: 'Ayetel Kürsi',
              subtitle: 'Bakara Suresi - 255. Ayet',
              onTap: () =>
                  context.router.push(PrayerDetailRoute(title: "dua title")),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPrayerCard({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
