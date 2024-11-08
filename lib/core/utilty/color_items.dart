import 'package:flutter/material.dart';

enum ColorItem {
  white,
  black,
  labelColor,
  suYesili,
  suYesili200,
}

extension ColorItems on ColorItem {
  Color str() {
    return switch (this) {
      ColorItem.white => Colors.white,
      ColorItem.black => Colors.black,
      ColorItem.labelColor => const Color(0xFF4C5980),
      ColorItem.suYesili => const Color.fromARGB(255, 107, 231, 217),
      ColorItem.suYesili200 => const Color.fromARGB(255, 35, 195, 177),
    };
  }
}
