import 'package:davet/generated/locale_keys.g.dart';

extension DayName on int {
  String dayName() {
    switch (this) {
      case 1:
        return LocaleKeys.pazartesi;
      case 2:
        return LocaleKeys.sali;
      case 3:
        return LocaleKeys.carsamba;
      case 4:
        return LocaleKeys.persembe;
      case 5:
        return LocaleKeys.cuma;
      case 6:
        return LocaleKeys.cumartesi;
      case 7:
        return LocaleKeys.pazar;
    }
    return '';
  }
}
