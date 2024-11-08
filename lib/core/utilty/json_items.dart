enum JsonItem {
  deger,
}

extension JsonItems on JsonItem {
  String str() {
    switch (this) {
      case JsonItem.deger:
        return 'deger';
    }
  }
}
