import 'package:flutter/material.dart';

class SettingTitleWidget extends StatelessWidget {
  const SettingTitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: const Color(0xFF78828A),
            ),
      ),
    );
  }
}
