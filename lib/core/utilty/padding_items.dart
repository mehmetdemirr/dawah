import 'package:flutter/material.dart';

enum PaddingItem {
  small,
  medium,
  large,
  horizantalSmall,
  horizantalMedium,
  horizantalLarge,
  verticalSmall,
  verticalMedium,
  verticallLarge,
  topSmall,
  topMedium,
  topLarge,
  bottomSmall,
  bottomMedium,
  bottomlLarge,
  leftSmall,
  leftMedium,
  leftLarge,
  rightmSmall,
  rightmMedium,
  rightlLarge,
}

extension PaddingItems on PaddingItem {
  EdgeInsets str() {
    return switch (this) {
      PaddingItem.small => const EdgeInsets.all(10),
      PaddingItem.medium => const EdgeInsets.all(15),
      PaddingItem.large => const EdgeInsets.all(25),
      PaddingItem.horizantalSmall => const EdgeInsets.symmetric(horizontal: 10),
      PaddingItem.horizantalMedium =>
        const EdgeInsets.symmetric(horizontal: 15),
      PaddingItem.horizantalLarge => const EdgeInsets.symmetric(horizontal: 25),
      PaddingItem.verticalSmall => const EdgeInsets.symmetric(vertical: 10),
      PaddingItem.verticalMedium => const EdgeInsets.symmetric(vertical: 15),
      PaddingItem.verticallLarge => const EdgeInsets.symmetric(vertical: 25),
      PaddingItem.topSmall => const EdgeInsets.only(top: 10),
      PaddingItem.topMedium => const EdgeInsets.only(top: 15),
      PaddingItem.topLarge => const EdgeInsets.only(top: 25),
      PaddingItem.bottomSmall => const EdgeInsets.only(bottom: 10),
      PaddingItem.bottomMedium => const EdgeInsets.only(bottom: 15),
      PaddingItem.bottomlLarge => const EdgeInsets.only(bottom: 25),
      PaddingItem.leftSmall => const EdgeInsets.only(left: 10),
      PaddingItem.leftMedium => const EdgeInsets.only(left: 15),
      PaddingItem.leftLarge => const EdgeInsets.only(left: 25),
      PaddingItem.rightmSmall => const EdgeInsets.only(right: 10),
      PaddingItem.rightmMedium => const EdgeInsets.only(right: 15),
      PaddingItem.rightlLarge => const EdgeInsets.only(right: 25),
    };
  }
}
