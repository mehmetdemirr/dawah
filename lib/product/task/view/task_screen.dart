import 'package:auto_route/auto_route.dart';
import 'package:davet/core/extension/screen_size.dart';
import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:davet/core/utilty/color_items.dart';
import 'package:davet/core/utilty/images_items.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

@RoutePage()
class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Görevler",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        backgroundColor: ColorItem.labelColor.str().withOpacity(0.6),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.width,
            height: 140,
            decoration: BoxDecoration(
              color: ColorItem.labelColor.str().withOpacity(0.6),
            ),
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: context.width,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusItem.medium.str(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "25 görev tamamla",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusItem.small.str(),
                              color: Colors.amber.shade100,
                            ),
                            child: _buildProgressBar(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Günlük Görevler",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                ),
                const SizedBox(height: 10),
                //Bilgi Sandığı
                const TaskWidget(
                  icon: '📦',
                  taskTitle: 'İlim hazinelerini keşfet!',
                  taskSuccess: false,
                  currentTask: 1,
                  totalTasks: 3,
                  isFirst: true,
                  giftBox: ImageItem.copper,
                ),
                // Hikmet Hazinesi
                const TaskWidget(
                  icon: '🏆',
                  taskTitle: 'Derin anlayışların kapısını aç',
                  taskSuccess: false,
                  currentTask: 1,
                  totalTasks: 2,
                  giftBox: ImageItem.bronz,
                ),
                // Marifet Cevheri
                const TaskWidget(
                  icon: '💎',
                  taskTitle: 'Nadir bilgileri topla, aydınlan',
                  taskSuccess: false,
                  currentTask: 0,
                  totalTasks: 2,
                  giftBox: ImageItem.gold,
                ),
                // Kutsal Emanet
                const TaskWidget(
                  icon: '🕋',
                  taskTitle: 'En değerli öğretilere ulaş',
                  taskSuccess: false,
                  currentTask: 1,
                  totalTasks: 10,
                  isLast: true,
                  giftBox: ImageItem.copper,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Returns the progress bar.
  Widget _buildProgressBar(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    const int progressvalue = 2;

    return SizedBox(
      height: 75,
      child: Stack(children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                        height: 30,
                        child: SfLinearGauge(
                          showTicks: false,
                          showLabels: false,
                          animateAxis: true,
                          axisTrackStyle: LinearAxisTrackStyle(
                            thickness: 30,
                            edgeStyle: LinearEdgeStyle.bothCurve,
                            borderWidth: 1,
                            borderColor: brightness == Brightness.dark
                                ? const Color(0xff898989)
                                : Colors.grey[350],
                            color: brightness == Brightness.dark
                                ? Colors.transparent
                                : Colors.grey[350],
                          ),
                          barPointers: const <LinearBarPointer>[
                            LinearBarPointer(
                              value: progressvalue * 10,
                              thickness: 30,
                              edgeStyle: LinearEdgeStyle.bothCurve,
                              color: Colors.blue,
                            ),
                          ],
                        ))))),
        Align(
            alignment: Alignment.center,
            child: Text(
              '$progressvalue/25',
              style: TextStyle(
                fontSize: 19,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.bold,
              ),
            )),
      ]),
    );
  }
}

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.icon,
    required this.taskTitle,
    required this.taskSuccess,
    required this.currentTask,
    required this.totalTasks,
    this.isFirst = false,
    this.isLast = false,
    required this.giftBox,
  });

  final String icon;
  final String taskTitle;
  final bool taskSuccess;
  final int currentTask;
  final int totalTasks;
  final bool isFirst;
  final bool isLast;
  final ImageItem giftBox;

  @override
  Widget build(BuildContext context) {
    double progressPercentage = (currentTask / totalTasks);
    return Container(
      width: context.width,
      height: 107,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: isFirst ? const Radius.circular(16) : Radius.zero,
          topRight: isFirst ? const Radius.circular(16) : Radius.zero,
          bottomLeft: isLast ? const Radius.circular(16) : Radius.zero,
          bottomRight: isLast ? const Radius.circular(16) : Radius.zero,
        ),
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 2,
          ),
          right: BorderSide(
            color: Colors.grey.shade300,
            width: 2,
          ),
          left: BorderSide(
            color: Colors.grey.shade300,
            width: 2,
          ),
          bottom: isLast
              ? BorderSide(
                  color: Colors.grey.shade300,
                  width: 2,
                )
              : BorderSide.none,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Text(
            icon,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 50,
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    taskTitle,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: const Color.fromARGB(221, 25, 25, 25),
                        ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 130,
                  child: Row(
                    children: [
                      LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        width: MediaQuery.of(context).size.width - 176,
                        animation: true,
                        lineHeight: 25.0,
                        animationDuration: 1000,
                        percent: progressPercentage,
                        center: Text(
                          "$currentTask / $totalTasks",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        barRadius: const Radius.circular(7),
                        progressColor: Colors.blue,
                        backgroundColor: Colors.grey[350],
                      ),
                      const Spacer(),
                      Image.asset(
                        width: 45,
                        giftBox.str(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
