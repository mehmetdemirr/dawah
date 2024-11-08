import 'dart:io';

class AppConfig {
  // ignore: constant_identifier_names
  static String BASE_URL_DEFAULT =
      Platform.isAndroid ? "http://10.0.2.2" : "http://localhost";
  static String BASE_URL_DEFAULT_IMAGE = Platform.isAndroid
      ? "http://10.0.2.2/storage"
      : "http://127.0.0.1/storage";
  static String BASE_URL_API =
      Platform.isAndroid ? "http://10.0.2.2/api" : "http://127.0.0.1/api";
  static const bool debug = true;
  static const bool demo = false;
}
