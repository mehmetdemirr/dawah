enum ImageItem {
  startImage,
  logo,
  profileIcon,
  paymentIcon,
  adressIcon,
  passwordIcon,
  notificationIcon,
  themeIcon,
  supportIcon,
  notification,
  setting,
  google,
  apple,
  calendar,
  filter,
  add,
  search,
  gold,
  bronz,
  copper,
}

String defaultValue = 'assets/images';

extension ImageItems on ImageItem {
  String str() {
    return switch (this) {
      ImageItem.gold => '$defaultValue/gold.png',
      ImageItem.copper => '$defaultValue/copper.png',
      ImageItem.bronz => '$defaultValue/bronz.png',
      ImageItem.startImage => '$defaultValue/start_image.png',
      //
      ImageItem.logo => '$defaultValue/cafe.png',
      ImageItem.calendar => '$defaultValue/calendar.png',
      ImageItem.filter => '$defaultValue/filter.png',
      ImageItem.add => '$defaultValue/add.png',
      ImageItem.search => '$defaultValue/search.png',
      //setting
      ImageItem.profileIcon => '$defaultValue/setting/profile.png',
      ImageItem.paymentIcon => '$defaultValue/setting/payment.png',
      ImageItem.adressIcon => '$defaultValue/setting/location.png',
      ImageItem.passwordIcon => '$defaultValue/setting/password.png',
      ImageItem.notificationIcon => '$defaultValue/setting/notification.png',
      ImageItem.themeIcon => '$defaultValue/setting/theme.png',
      ImageItem.supportIcon => '$defaultValue/setting/support.png',
      ImageItem.notification => '$defaultValue/notification.png',
      ImageItem.setting => '$defaultValue/setting.png',
      //auth
      ImageItem.google => '$defaultValue/google.png',
      ImageItem.apple => '$defaultValue/apple.png',
    };
  }
}
