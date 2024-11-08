import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final bool isCircular;
  final double? circular;

  const CustomCachedImageWidget({
    super.key,
    required this.imageUrl,
    this.isCircular = false,
    this.circular = 11,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  isCircular ? (circular ?? 11) : 0,
                ),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        : const Icon(Icons.error);
  }
}
