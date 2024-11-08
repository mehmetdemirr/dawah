import 'package:davet/core/extension/date_time.dart';
import 'package:davet/core/utilty/images_items.dart';
import 'package:flutter/material.dart';

class CustomDatetimeTextWidget extends StatelessWidget {
  const CustomDatetimeTextWidget({
    super.key,
    required this.time,
  });

  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(ImageItem.calendar.str()),
        Text(
          " ${time.strWithDayName()}",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: const Color(0xFF7B7B7B)),
        ),
      ],
    );
  }
}
