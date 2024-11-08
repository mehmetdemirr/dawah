import 'package:davet/core/utilty/day_name.dart';
import 'package:davet/core/utilty/month_name.dart';
import 'package:easy_localization/easy_localization.dart';

extension DateTimeStr on DateTime? {
  String str() {
    final time = this ?? DateTime.now();
    return '${time.day} ${time.month.montName()} ${time.year}';
  }

  String strMessageTime() {
    final now = DateTime.now();
    if (this == null) {
      return "";
    }
    final time = this ?? now; // Eğer null ise şu anki zamanı kullan

    // Bugünün tarihi ise saat ve dakikayı döndür
    if (time.year == now.year &&
        time.month == now.month &&
        time.day == now.day) {
      return "${time.hour.toString().padLeft(2, '0')} : ${time.minute.toString().padLeft(2, '0')}";
    }

    // Dün tarihi ise "Dün" döndür
    final yesterday = now.subtract(const Duration(days: 1));
    if (time.year == yesterday.year &&
        time.month == yesterday.month &&
        time.day == yesterday.day) {
      return "Dün";
    }

    // Daha önceki tarihler için gün, ay ve yıl döndür
    return '${time.day} ${time.month.montName()} ${time.year}';
  }

  String strWithDayName() {
    final time = this ?? DateTime.now();
    return '${time.weekday.dayName().tr()}, ${time.day} ${time.month.montName()} ${time.year}';
  }
}
