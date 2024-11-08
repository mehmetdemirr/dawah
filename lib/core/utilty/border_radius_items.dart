import 'package:flutter/material.dart';

enum BorderRadiusItem {
  small,
  medium,
  large,
}

extension BorderItems on BorderRadiusItem {
  BorderRadius str() {
    return switch (this) {
      BorderRadiusItem.small => const BorderRadius.all(Radius.circular(10)),
      BorderRadiusItem.medium => const BorderRadius.all(Radius.circular(15)),
      BorderRadiusItem.large => const BorderRadius.all(Radius.circular(25))
    };
  }
}
