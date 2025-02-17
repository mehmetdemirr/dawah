import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:davet/product/applications/quran/service/quran_service.dart';

@RoutePage()
class SurahDetailScreen extends StatefulWidget {
  const SurahDetailScreen({
    super.key,
    required this.surahNumber,
    required this.surahName,
  });

  final int surahNumber;
  final String surahName;

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  final QuranService _quranService = QuranService();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isLoading = true;
  bool isPlaying = false;
  Map<String, dynamic>? surahData;
  Map<String, dynamic>? translation;

  @override
  void initState() {
    super.initState();
    _loadSurahData();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _loadSurahData() async {
    try {
      setState(() => isLoading = true);
      final translationData =
          await _quranService.getSurahTranslation(widget.surahNumber);
      setState(() {
        translation = translationData;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      // TODO: Hata göster
    }
  }

  Future<void> _playAudio() async {
    try {
      if (isPlaying) {
        await _audioPlayer.pause();
      } else {
        final audioUrl = await _quranService.getAudioUrl(widget.surahNumber);
        await _audioPlayer.setUrl(audioUrl);
        await _audioPlayer.play();
      }
      setState(() => isPlaying = !isPlaying);
    } catch (e) {
      // TODO: Hata göster
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            if (isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else
              Expanded(
                child: _buildSurahContent(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.surahName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (translation != null)
                      Text(
                        "${translation!['numberOfAyahs']} Ayet • ${translation!['revelationType']}",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: _playAudio,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSurahContent() {
    if (translation == null) {
      return const Center(child: Text('Sure bilgileri yüklenemedi'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildBismillah(),
          const SizedBox(height: 20),
          ...List.generate(
            translation!['ayahs'].length,
            (index) => _buildVerse(
              translation!['ayahs'][index],
              index + 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBismillah() {
    if (widget.surahNumber == 1 || widget.surahNumber == 9) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Arabic',
          height: 2,
        ),
      ),
    );
  }

  Widget _buildVerse(Map<String, dynamic> verse, int number) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  number.toString(),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.bookmark_border),
                onPressed: () {
                  // TODO: Yer imi ekle
                },
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  // TODO: Paylaş
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            verse['text'],
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 24,
              fontFamily: 'Arabic',
              height: 2,
            ),
          ),
          const Divider(height: 32),
          const Text(
            "----", //verse['translation'],
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
