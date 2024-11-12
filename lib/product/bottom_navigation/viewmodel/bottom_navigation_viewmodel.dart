import 'package:flutter/material.dart';

class BottomNavigationViewModel extends ChangeNotifier {
  int selectedIndex = 1;

  void changeSelectedIndex(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}
