import 'dart:convert';
import 'package:http/http.dart' as http;

class QuranService {
  static const String baseUrl = 'http://api.alquran.cloud/v1';

  // Tüm sureleri getir
  Future<List<Map<String, dynamic>>> getSurahs() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/surah'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data['data']);
      }
      throw Exception('Sureler yüklenemedi');
    } catch (e) {
      throw Exception('API hatası: $e');
    }
  }

  // Belirli bir surenin sesli versiyonunu getir
  Future<String> getAudioUrl(int surahNumber,
      {String reciter = 'ar.alafasy'}) async {
    try {
      return 'https://cdn.islamic.network/quran/audio/128/$reciter/$surahNumber.mp3';
    } catch (e) {
      throw Exception('API hatası: $e');
    }
  }

  // Belirli bir surenin mealini getir
  Future<Map<String, dynamic>> getSurahTranslation(
    int surahNumber, {
    String edition = 'tr.diyanet',
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/surah/$surahNumber/$edition'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final surahData = data['data'];
        return {
          'number': surahData['number'],
          'name': surahData['name'],
          'englishName': surahData['englishName'],
          'englishNameTranslation': surahData['englishNameTranslation'],
          'revelationType': surahData['revelationType'],
          'numberOfAyahs': surahData['numberOfAyahs'],
          'ayahs':
              List<Map<String, dynamic>>.from(surahData['ayahs'].map((ayah) => {
                    'number': ayah['number'],
                    'text': ayah['text'],
                    'numberInSurah': ayah['numberInSurah'],
                    'juz': ayah['juz'],
                    'manzil': ayah['manzil'],
                    'page': ayah['page'],
                    'ruku': ayah['ruku'],
                    'hizbQuarter': ayah['hizbQuarter'],
                    'sajda': ayah['sajda'],
                  })),
          'edition': surahData['edition']
        };
      }
      throw Exception('Meal yüklenemedi');
    } catch (e) {
      throw Exception('API hatası: $e');
    }
  }

  // Ayet arama
  Future<List<Map<String, dynamic>>> searchAyah(
    String query, {
    String language = 'tr',
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/search/$query/all/$language'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data['data']['matches']);
      }
      throw Exception('Arama sonuçları yüklenemedi');
    } catch (e) {
      throw Exception('API hatası: $e');
    }
  }
}
