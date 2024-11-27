import 'package:auto_route/auto_route.dart';
import 'package:davet/core/extension/screen_size.dart';
import 'package:davet/core/function/show_dialog.dart';
import 'package:davet/core/navigation/app_router.dart';
import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:davet/product/profile/widget/profil_card_button_widget.dart';
import 'package:davet/product/profile/widget/profil_personal_card_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Padding(
                padding: EdgeInsets.only(top: context.topPadding),
                child: Column(
                  children: [
                    SizedBox(
                      height: 180,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: ProfilPersonalCardWidget(
                              imageUrl: null,
                              name: "Mehmet",
                              location: "@mehmet27",
                            ),
                          ),
                          Row(
                            children: [
                              ProfileCardButtonWidget(
                                onTap: () {
                                  context.router
                                      .pushNamed(RouterItem.profileEdit.str());
                                },
                                widget: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade300,
                                        borderRadius:
                                            BorderRadiusItem.large.str(),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.star_outline,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Profil Düzenle",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                                isRightBorder: false,
                                isLeftBorder: false,
                              ),
                              ProfileCardButtonWidget(
                                onTap: () {
                                  context.router
                                      .pushNamed(RouterItem.setting.str());
                                },
                                widget: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade300,
                                        borderRadius:
                                            BorderRadiusItem.large.str(),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.settings_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Ayarlar",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                                isRightBorder: false,
                                isLeftBorder: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      customShowAlertDialog(
                        context: context,
                        title: const Text("Yakında"),
                        text: const Text("Her şey daha güzel olacak !"),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: context.width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black87,
                            Color(0xFF7265E3),
                            Color(0xFF7265E3),
                            Color(0xFF7265E3),
                            Colors.black87,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "BAĞIŞ YAP",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 130,
                    width: context.width,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: const Center(
                      child: Text("buraya bir şeyler koyarız"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "İstatistikler",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const StaticCardWidget(
                            icon: Icon(
                              Icons.star_border_purple500_rounded,
                              color: Colors.grey,
                              size: 35,
                            ),
                            score: '0',
                            description: 'Günlük Seri',
                          ),
                          const SizedBox(width: 16),
                          StaticCardWidget(
                            icon: Icon(
                              Icons.bolt,
                              color: Colors.yellow.shade700,
                              size: 35,
                            ),
                            score: '0',
                            description: 'Günlük Seri',
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      const Row(
                        children: [
                          StaticCardWidget(
                            icon: Icon(
                              Icons.emoji_events_outlined,
                              color: Colors.grey,
                              size: 35,
                            ),
                            score: '0',
                            description: 'Günlük Seri',
                          ),
                          SizedBox(width: 16),
                          StaticCardWidget(
                            icon: Icon(
                              Icons.workspace_premium_outlined,
                              color: Colors.grey,
                              size: 35,
                            ),
                            score: '0',
                            description: 'Günlük Seri',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StaticCardWidget extends StatelessWidget {
  const StaticCardWidget({
    super.key,
    required this.icon,
    required this.score,
    required this.description,
  });

  final Widget icon;
  final String score;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 2 - 24,
      height: 75,
      decoration: BoxDecoration(
          borderRadius: BorderRadiusItem.large.str(),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  score,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
