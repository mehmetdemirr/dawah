enum DurationItem {
  small,
  medium,
  large,
}

extension DurationItems on DurationItem {
  Duration str() {
    switch (this) {
      case DurationItem.small:
        return const Duration(seconds: 1);
      case DurationItem.medium:
        return const Duration(seconds: 2);
      case DurationItem.large:
        return const Duration(seconds: 3);
    }
  }
}
