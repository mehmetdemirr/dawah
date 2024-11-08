import 'package:flutter/material.dart';

Color getPopupColor(int type) {
  switch (type) {
    case 1:
      return const Color(0XFF28a745);
    case 2:
      return const Color(0XFFdc3545);
    case 3:
      return const Color(0XFFffc107);
    case 4:
      return const Color(0XFF17a2b8);
    default:
      return const Color(0XFF28a745);
  }
}

IconData getPopupIcon(int type) {
  switch (type) {
    case 1:
      return Icons.check_circle;
    case 2:
      return Icons.error_rounded;
    case 3:
      return Icons.warning;
    case 4:
      return Icons.info_rounded;
    default:
      return Icons.info_rounded;
  }
}
