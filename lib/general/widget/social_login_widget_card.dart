import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:davet/core/utilty/images_items.dart';
import 'package:flutter/material.dart';

class SocialLoginCardWidget extends StatelessWidget {
  const SocialLoginCardWidget({
    super.key,
    required this.image,
    required this.onTap,
  });

  final ImageItem image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusItem.large.str(),
          color: const Color.fromRGBO(214, 217, 224, 0.2),
        ),
        child: Image.asset(
          image.str(),
        ),
      ),
    );
  }
}
