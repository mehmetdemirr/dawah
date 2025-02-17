import 'package:auto_route/auto_route.dart';
import 'package:davet/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:davet/product/applications/quran/service/quran_service.dart';

@RoutePage()
class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final QuranService _quranService = QuranService();
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool isLoading = true;
  List<Map<String, dynamic>> surahs = [];
  Map<String, dynamic>? currentSurah;
  String? currentAudioUrl;
  bool isPlaying = false;
  String currentSurahName = "Fatiha Suresi";
  String currentReader = "Mishary Rashid Al-Afasy";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadSurahs();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _loadSurahs() async {
    try {
      setState(() => isLoading = true);
      final surahList = await _quranService.getSurahs();
      setState(() {
        surahs = surahList;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      // Hata göster
    }
  }

  Future<void> _playSurah(int surahNumber) async {
    try {
      setState(() => isLoading = true);
      final audioUrl = await _quranService.getAudioUrl(surahNumber);
      await _audioPlayer.setUrl(audioUrl);
      await _audioPlayer.play();
      setState(() {
        isPlaying = true;
        currentAudioUrl = audioUrl;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      // Hata göster
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildAudioPlayer(),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildSurahList(),
                  _buildJuzList(),
                  _buildBookmarksList(),
                  _buildDownloadsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => context.router.back(),
              ),
              const Expanded(
                child: Text(
                  "Kuran-ı Kerim",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  // TODO: Arama sayfasını aç
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAudioPlayer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.menu_book, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentSurahName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      currentReader,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  currentAudioUrl != null && isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                  size: 40,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () => _playSurah(currentSurah!['number']),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: 0.3,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Theme.of(context).primaryColor,
      tabs: const [
        Tab(text: "Sureler"),
        Tab(text: "Cüzler"),
        Tab(text: "Yer İmleri"),
        Tab(text: "İndirilenler"),
      ],
    );
  }

  Widget _buildSurahList() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: surahs.length,
      itemBuilder: (context, index) {
        final surah = surahs[index];
        return _buildSurahTile(surah);
      },
    );
  }

  Widget _buildSurahTile(Map<String, dynamic> surah) {
    return ListTile(
      onTap: () {
        context.router.push(
          SurahDetailRoute(
            surahNumber: surah['number'],
            surahName: surah['name'],
          ),
        );
      },
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            surah['number'].toString(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      title: Text(
        surah['name'],
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "${surah['numberOfAyahs']} Ayet • ${surah['revelationType']}",
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              currentAudioUrl != null && isPlaying
                  ? Icons.pause_circle_outline
                  : Icons.play_circle_outline,
            ),
            onPressed: () => _playSurah(surah['number']),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              // TODO: Yer imi ekle
            },
          ),
        ],
      ),
    );
  }

  Widget _buildJuzList() {
    return const Center(child: Text("Cüzler Listesi"));
  }

  Widget _buildBookmarksList() {
    return const Center(child: Text("Yer İmleri"));
  }

  Widget _buildDownloadsList() {
    return const Center(child: Text("İndirilenler"));
  }
}
