import 'package:davet/core/extension/screen_size.dart';
import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:flutter/material.dart';

class GameTitleWidget extends StatelessWidget {
  const GameTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 75,
      decoration: BoxDecoration(
        // color: ColorItem.labelColor.str().withOpacity(0.55),
        // color: Colors.purple.withOpacity(0.7),
        color: Colors.black87,
        borderRadius: BorderRadiusItem.medium.str(),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1. KISIM, 1. ÜNİTE",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                ),
                Text(
                  "Kişileri betimle",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: 3,
            height: 75,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.menu_book_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
