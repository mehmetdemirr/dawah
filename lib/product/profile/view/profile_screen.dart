import 'package:auto_route/auto_route.dart';
import 'package:davet/core/extension/screen_size.dart';
import 'package:davet/core/function/show_dialog.dart';
import 'package:davet/core/navigation/app_router.dart';
import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:davet/core/utilty/color_items.dart';
import 'package:davet/product/profile/widget/profil_card_button_widget.dart';
import 'package:davet/product/profile/widget/profil_personal_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
              padding: const EdgeInsets.all(16.0) +
                  const EdgeInsets.only(bottom: 100),
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
                        "İlerlemen",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                      ),
                      Container(
                        width: context.width,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusItem.large.str(),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: buildRangePointerExampleGauge(),
                              ),
                              const SizedBox(width: 5),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "İlerleme Durumun",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: ColorItem.labelColor.str(),
                                          ),
                                    ),
                                    SizedBox(
                                      width: context.width - 200,
                                      child: Text(
                                        "Hedefe adım adım yaklaşıyorsun!",
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: ColorItem.labelColor.str(),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
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

  /// Returns the range pointer gauge
  SfRadialGauge buildRangePointerExampleGauge() {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          showLabels: false,
          showTicks: false,
          startAngle: 270,
          endAngle: 270,
          radiusFactor: 0.8,
          axisLineStyle: const AxisLineStyle(
            thicknessUnit: GaugeSizeUnit.factor,
            thickness: 0.15,
          ),
          annotations: const <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 180,
              widget: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    ' 58 % ',
                    style: TextStyle(
                      fontFamily: 'Times',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
          pointers: const <GaugePointer>[
            RangePointer(
              value: 50,
              cornerStyle: CornerStyle.bothCurve,
              enableAnimation: true,
              animationDuration: 1200,
              sizeUnit: GaugeSizeUnit.factor,
              gradient: SweepGradient(
                colors: <Color>[Color(0xFF6A6EF6), Color(0xFFDB82F5)],
                stops: <double>[0.25, 0.75],
              ),
              color: Color(0xFF00A8B5),
              width: 0.15,
            ),
          ],
        ),
      ],
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
