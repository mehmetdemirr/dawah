enum OrderStatusItem {
  tumu,
  sepette,
  siparisVerildi,
  siparisHazirlaniyor,
  siparisYolda,
  siparisTeslimEdildi,
  siparisIptal,
}

extension PaymentStatusItems on OrderStatusItem {
  int strOrderStatus2Int() {
    switch (this) {
      case OrderStatusItem.tumu:
        return 0;
      case OrderStatusItem.sepette:
        return 1;
      case OrderStatusItem.siparisVerildi:
        return 2;
      case OrderStatusItem.siparisHazirlaniyor:
        return 3;
      case OrderStatusItem.siparisYolda:
        return 4;
      case OrderStatusItem.siparisTeslimEdildi:
        return 5;
      case OrderStatusItem.siparisIptal:
        return 6;
    }
  }

  String strOrderStatus2String() {
    switch (this) {
      case OrderStatusItem.tumu:
        return "-";
      case OrderStatusItem.sepette:
        return "Sepette";
      case OrderStatusItem.siparisVerildi:
        return "Bekliyor";
      case OrderStatusItem.siparisHazirlaniyor:
        return "Hazırlanıyor";
      case OrderStatusItem.siparisYolda:
        return "Yolda";
      case OrderStatusItem.siparisTeslimEdildi:
        return "Tamamlandı";
      case OrderStatusItem.siparisIptal:
        return "İptal";
    }
  }
}
