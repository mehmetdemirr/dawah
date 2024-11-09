import 'package:davet/core/utilty/images_items.dart';
import 'package:flutter/material.dart';

class SettingCardWidget extends StatefulWidget {
  const SettingCardWidget({
    super.key,
    required this.text,
    required this.imageItem,
    this.widget,
    required this.onTap,
  });

  final String text;
  final ImageItem imageItem;
  final Widget? widget;
  final VoidCallback onTap;

  @override
  State<SettingCardWidget> createState() => _SettingCardWidgetState();
}

class _SettingCardWidgetState extends State<SettingCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(widget.imageItem.str()),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    widget.text,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: const Color(0xFF272B3B),
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                const Spacer(),
                widget.widget ?? const SizedBox(),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40.0, top: 15),
              child: Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
