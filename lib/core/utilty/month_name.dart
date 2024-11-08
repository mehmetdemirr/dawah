import 'package:davet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

extension MonthName on int {
  String montName() {
    switch (this) {
      case 1:
        return LocaleKeys.ocak.tr();
      case 2:
        return LocaleKeys.subat.tr();
      case 3:
        return LocaleKeys.mart.tr();
      case 4:
        return LocaleKeys.nisan.tr();
      case 5:
        return LocaleKeys.mayis.tr();
      case 6:
        return LocaleKeys.haziran.tr();
      case 7:
        return LocaleKeys.temmuz.tr();
      case 8:
        return LocaleKeys.agustos.tr();
      case 9:
        return LocaleKeys.eylul.tr();
      case 10:
        return LocaleKeys.ekim.tr();
      case 11:
        return LocaleKeys.kasim.tr();
      case 12:
        return LocaleKeys.aralik.tr();
    }
    return '';
  }
}
