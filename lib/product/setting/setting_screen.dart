import 'package:auto_route/auto_route.dart';
import 'package:davet/core/cache/shared_pref.dart';
import 'package:davet/core/theme/dark_theme.dart';
import 'package:davet/core/theme/light_theme.dart';
import 'package:davet/core/theme/theme_view_model.dart';
import 'package:davet/core/utilty/images_items.dart';
import 'package:davet/product/setting/widget/setting_card_widget.dart';
import 'package:davet/product/setting/widget/setting_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingTitleWidget(
                title: 'Kişisel',
              ),
              SettingCardWidget(
                text: "Profilini Düzenle",
                imageItem: ImageItem.profileIcon,
                onTap: () {
                  // context.router.pushNamed(RouterItem.profileEdit.str());
                },
              ),
              SettingCardWidget(
                // text: "Ödeme Yöntemi",
                text: "Favorilerim",
                imageItem: ImageItem.paymentIcon,
                onTap: () {
                  // context.router.pushNamed(RouterItem.favorite.str());
                },
              ),
              SettingCardWidget(
                text: "Konumum",
                imageItem: ImageItem.adressIcon,
                onTap: () {
                  // context.router.pushNamed(RouterItem.location.str());
                },
              ),
              const SettingTitleWidget(
                title: 'Güvenlik',
              ),
              SettingCardWidget(
                text: "Parolamı Güncelle",
                imageItem: ImageItem.passwordIcon,
                onTap: () {
                  // context.router.pushNamed(RouterItem.passwordEdit.str());
                },
              ),
              const SettingTitleWidget(
                title: 'Genel',
              ),
              SettingCardWidget(
                text: "Bildirimler",
                imageItem: ImageItem.notificationIcon,
                onTap: () {
                  // context.router.pushNamed(RouterItem.notification.str());
                },
              ),
              SettingCardWidget(
                text: "Karanlık Mod",
                imageItem: ImageItem.themeIcon,
                onTap: () {},
                widget: _switchTheme(
                    context, context.watch<ThemeNotifier>().getTheme()),
              ),
              SettingCardWidget(
                text: "Yardım ve Destek",
                imageItem: ImageItem.supportIcon,
                onTap: () {
                  // context.router.pushNamed(RouterItem.support.str());
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: TextButton(
                    onPressed: () async {
                      await SharedPref().clearAll().then((_) {
                        // ignore: use_build_context_synchronously
                        // context.router.replaceAll([
                        //   const LoginRoute(),
                        // ]);
                      });
                    },
                    child: Text(
                      "Çıkış Yap",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: const Color(0xFFEB5757),
                          ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Switch _switchTheme(BuildContext context, bool result) {
    return Switch(
      value: result,
      onChanged: (value) {
        context.read<ThemeNotifier>().setTheme(value ? darkTheme : lightTheme);
      },
    );
  }
}
