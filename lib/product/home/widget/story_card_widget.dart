import 'package:davet/core/utilty/images_items.dart';
import 'package:flutter/material.dart';

class StoryCardWidget extends StatefulWidget {
  const StoryCardWidget({
    super.key,
    required this.story,
    required this.onTap,
  });

  final StoryModel story;
  final VoidCallback onTap;

  @override
  State<StoryCardWidget> createState() => _StoryCardWidgetState();
}

class _StoryCardWidgetState extends State<StoryCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    // Animasyon kontrolcüsü tanımlanıyor
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _controller.repeat(); // Animasyonu sürekli döndür
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      isTapped = true;
    });

    // Tıklama sonrası aksiyon
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isTapped = false;
      });
      widget.onTap();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Dönen Progress Indicator
                RotationTransition(
                  turns: _controller,
                  child: Container(
                    height: 84,
                    width: 84,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF8B4CFC),
                        width: 3,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      widget.story.imageItem.str(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Tıklandığında gelen dönen Circular Indicator
                if (isTapped)
                  Container(
                    height: 84,
                    width: 84,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                    ),
                    child: const CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 79, 6, 248),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              widget.story.text,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class StoryModel {
  final ImageItem imageItem;
  final String text;
  final int id;

  StoryModel({
    required this.imageItem,
    required this.text,
    required this.id,
  });
}
