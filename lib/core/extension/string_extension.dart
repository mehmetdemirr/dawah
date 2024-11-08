import 'package:davet/config.dart';
import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  String get locale => this.tr();
}

extension StringExtensions on String? {
  String get toFullUrl {
    // Eğer değer null değilse, tam URL'yi oluştur
    return this != null
        ? "${AppConfig.BASE_URL_DEFAULT}/storage/$this"
        : "https://via.placeholder.com/150";
  }
}
