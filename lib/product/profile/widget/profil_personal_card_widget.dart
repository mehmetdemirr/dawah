import 'package:auto_route/auto_route.dart';
import 'package:davet/core/navigation/app_router.dart';
import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:davet/general/widget/custom_cached_image.dart';
import 'package:flutter/material.dart';

class ProfilPersonalCardWidget extends StatelessWidget {
  const ProfilPersonalCardWidget({
    super.key,
    this.imageUrl,
    required this.name,
    required this.location,
  });

  final String? imageUrl;
  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: imageUrl != null
              ? CustomCachedImageWidget(
                  isCircular: true,
                  circular: 100,
                  imageUrl: imageUrl!,
                )
              : Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: Icon(
                    Icons.account_circle_outlined,
                    size: 70,
                    color: Colors.grey.shade200,
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 5),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
              ),
              const SizedBox(height: 3),
              Text(
                location,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
              )
            ],
          ),
        ),
        const Spacer(),
        Column(
          children: [
            InkWell(
              onTap: () {
                context.router.pushNamed(RouterItem.profileEdit.str());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade400,
                  borderRadius: BorderRadiusItem.large.str(),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Icon(
                    Icons.edit_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
