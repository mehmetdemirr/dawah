enum PaymentStatusItem {
  odemeBekleniyor,
  odendi,
  odenmez,
  iptal,
}

extension PaymentStatusItems on PaymentStatusItem {
  int str() {
    switch (this) {
      case PaymentStatusItem.odemeBekleniyor:
        return 1;
      case PaymentStatusItem.odendi:
        return 2;
      case PaymentStatusItem.odenmez:
        return 3;
      case PaymentStatusItem.iptal:
        return 4;
    }
  }

  String strString() {
    switch (this) {
      case PaymentStatusItem.odemeBekleniyor:
        return "Bekliyor";
      case PaymentStatusItem.odendi:
        return "Ödendi";
      case PaymentStatusItem.odenmez:
        return "Ödenmez";
      case PaymentStatusItem.iptal:
        return "İptal";
    }
  }
}
