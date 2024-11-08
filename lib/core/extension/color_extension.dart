import 'package:flutter/material.dart';

extension ColorExtension on String {
  Color toColor() {
    // HEX kodunu kontrol et ve uygun şekilde renge çevir
    if (startsWith('#')) {
      // Eğer kodda '#' varsa, kodu 1. karakter hariç al
      return Color(int.parse('0xff${substring(1)}'));
    } else {
      // '#' yoksa, direkt 0xff ile başla
      return Color(int.parse('0xff$this'));
    }
  }
}
