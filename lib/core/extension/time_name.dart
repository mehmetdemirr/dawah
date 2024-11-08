extension TimeStr on DateTime {
  String str() {
    final time = this;
    return "${time.hour.toString().padLeft(2, '0')} :"
        " ${time.minute.toString().padLeft(2, '0')}";
  }
}
