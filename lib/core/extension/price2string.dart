import 'package:easy_localization/easy_localization.dart';

extension DoubleExtension on double? {
  String toCurrencyFormat({String locale = 'tr_TR'}) {
    if (this == null) {
      return '-';
    }

    final formatlayici = NumberFormat.currency(locale: locale, symbol: '₺');
    return formatlayici.format(this);
  }
}
