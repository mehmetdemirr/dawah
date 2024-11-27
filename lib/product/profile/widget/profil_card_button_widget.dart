import 'package:davet/core/extension/screen_size.dart';
import 'package:flutter/material.dart';

class ProfileCardButtonWidget extends StatelessWidget {
  const ProfileCardButtonWidget({
    super.key,
    required this.onTap,
    required this.widget,
    required this.isRightBorder,
    required this.isLeftBorder,
  });

  final VoidCallback onTap;
  final Widget widget;
  final bool isRightBorder;
  final bool isLeftBorder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width / 2,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            top: const BorderSide(width: 2, color: Colors.grey),
            bottom: const BorderSide(width: 2, color: Colors.grey),
            left: BorderSide(width: isLeftBorder ? 2 : 0, color: Colors.grey),
            right: BorderSide(width: isRightBorder ? 2 : 0, color: Colors.grey),
          ),
        ),
        child: widget,
      ),
    );
  }
}
