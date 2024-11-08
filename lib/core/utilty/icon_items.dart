import 'package:flutter/material.dart';

enum IconItem {
  home,
  setting,
}

extension IconItems on IconItem {
  Widget str() {
    return switch (this) {
      IconItem.home => const Icon(Icons.home),
      IconItem.setting => const Icon(Icons.settings),
    };
  }
}
