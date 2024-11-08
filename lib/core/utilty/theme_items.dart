enum ThemeItem {
  light,
  dark,
}

extension ThemeItems on ThemeItem {
  bool str() {
    return switch (this) {
      ThemeItem.light => false,
      ThemeItem.dark => true,
    };
  }
}
