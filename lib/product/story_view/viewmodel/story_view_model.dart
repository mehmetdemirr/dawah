import 'package:flutter/material.dart';

class StoryViewViewModel extends ChangeNotifier {
  int index = 0;
  bool isLoadingShow = false;
  String download = "";

  void changeImageUrl(int value) {
    index = value;
    notifyListeners();
  }

  void changeDownload(String value) {
    download = value;
    notifyListeners();
  }

  void changeLoadingShow() {
    isLoadingShow = !isLoadingShow;
    notifyListeners();
  }

  void reset() {
    index = 0;
    isLoadingShow = false;
    download = "";
  }
}
