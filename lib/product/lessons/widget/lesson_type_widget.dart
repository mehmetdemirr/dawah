import 'package:flutter/material.dart';

class LessonTypeButton extends StatelessWidget {
  const LessonTypeButton({
    super.key,
    required this.title,
    required this.onPress,
    required this.isSelected,
  });

  final String title;
  final VoidCallback onPress;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.black12,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isSelected ? Colors.white : Colors.black45,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
