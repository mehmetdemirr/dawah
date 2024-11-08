enum ApiItem {
  posts,
}

extension ApiItems on ApiItem {
  String str() {
    switch (this) {
      case ApiItem.posts:
        return '/posts';
    }
  }
}
