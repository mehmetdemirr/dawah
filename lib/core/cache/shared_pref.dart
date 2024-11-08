import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Tüm verileri temizler
    await prefs.clear();
  }

  Future<void> setTheme(bool theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedKeyItem.theme.str(), theme);
  }

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedKeyItem.theme.str()) ?? false;
  }

  Future<void> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedKeyItem.language.str(), language);
  }

  Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedKeyItem.language.str());
  }

  Future<void> setOnesignalId(String onesignalId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedKeyItem.onesignalId.str(), onesignalId);
  }

  Future<String?> getOnesignalId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedKeyItem.onesignalId.str());
  }

  Future<void> setUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedKeyItem.userToken.str(), token);
  }

  Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedKeyItem.userToken.str());
  }

  //auth
  Future<void> setAuth(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedKeyItem.auth.str(), value);
  }

  Future<bool> getAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedKeyItem.auth.str()) ?? false;
  }

  //auth
  Future<void> setUserId(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(SharedKeyItem.userId.str(), value);
  }

  Future<int> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SharedKeyItem.userId.str()) ?? -1;
  }
}

enum SharedKeyItem {
  theme,
  language,
  userToken,
  auth,
  userId,
  onesignalId,
}

extension SharedKeyItems on SharedKeyItem {
  String str() {
    return name;
  }
}
