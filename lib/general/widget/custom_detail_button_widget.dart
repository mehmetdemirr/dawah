import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:flutter/material.dart';

class CustomDetailButtonWidget extends StatelessWidget {
  const CustomDetailButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFE4E4E7),
            width: 2,
          ),
          borderRadius: BorderRadiusItem.medium.str(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
