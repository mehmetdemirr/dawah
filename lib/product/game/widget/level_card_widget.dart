import 'package:davet/core/extension/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LevelCard extends StatelessWidget {
  final String level;
  final String levelTitle;
  final String levelDescription;
  final bool isRight;
  final double rating;
  final int status; // 0: not started, 1: started, 2: completed
  const LevelCard(
      {super.key,
      required this.level,
      required this.isRight,
      required this.status,
      required this.rating,
      required this.levelTitle,
      required this.levelDescription});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: isRight ? TextDirection.rtl : TextDirection.ltr,
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: status == 1
                ? Colors.blue
                : status == 2
                    ? const Color.fromARGB(255, 102, 200, 105)
                    : Colors.black12,
            borderRadius: BorderRadius.circular(200),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5.0,
                offset: const Offset(0, 4),
                spreadRadius: 1.5,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Icon(
                    status == 1
                        ? Icons.play_circle
                        : status == 2
                            ? Icons.check_circle
                            : Icons.lock,
                    color: Colors.white),
              ),
              Text(
                "Seviye",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                width: 80,
                child: Text(
                  level,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              const Spacer(),
              status == 1
                  ? const Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: SizedBox(
                        width: 50,
                        child: LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: Colors.black12,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    )
                  : status == 2
                      ? RatingBar(
                          initialRating: rating,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 3,
                          onRatingUpdate: (rating) {},
                          ignoreGestures: true,
                          itemSize: 15,
                          ratingWidget: RatingWidget(
                            full: const Icon(Icons.star,
                                color: Color(0xFFffd700)),
                            half: const Icon(Icons.star_half,
                                color: Color(0xFFffd700)),
                            empty: const Icon(Icons.star_border,
                                color: Color(0xFFffd700)),
                          ),
                        )
                      : Container(),
            ],
          ),
        ),
        const SizedBox(width: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 50, // Minimum 50 piksel
            maxHeight: double.infinity, // İçeriğe göre artabilir
          ),
          child: Container(
            width: context.width / 2.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5.0,
                  offset: const Offset(0, 4),
                  spreadRadius: 1.5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    levelTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    levelDescription,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF43A047),
                          fontSize: 11,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
