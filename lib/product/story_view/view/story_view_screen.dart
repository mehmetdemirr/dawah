import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

@RoutePage()
class StoryViewScreen extends StatefulWidget {
  const StoryViewScreen({super.key});
  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: [
        StoryItem.text(
          title: "I guess you'd love to see more of our food. That's great.",
          backgroundColor: Colors.blue,
        ),
        StoryItem.text(
          title: "Nice!\n\nTap to continue.",
          backgroundColor: Colors.red,
          textStyle: const TextStyle(
            fontFamily: 'Dancing',
            fontSize: 40,
          ),
        ),
        StoryItem.pageImage(
          url:
              "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
          caption: const Text(
            "Still sampling",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          controller: storyController,
        ),
        StoryItem.pageImage(
            url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
            caption: const Text(
              "Working with gifs",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            controller: storyController),
        StoryItem.pageImage(
          url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
          caption: const Text(
            "Hello, from the other side",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          controller: storyController,
        ),
        // StoryItem.pageImage(
        //   url: "https://www.youtube.com/watch?v=7ZT8Sgi335Q",
        //   caption: const Text(
        //     "Hello, from the other side2",
        //     style: TextStyle(
        //       fontSize: 15,
        //       color: Colors.white,
        //     ),
        //     textAlign: TextAlign.center,
        //   ),
        //   controller: storyController,
        // ),
      ],
      onStoryShow: (storyItem, index) {
        print("Showing a story");
      },
      onComplete: () {
        print("Completed a cycle");
        context.router.popForced();
      },
      progressPosition: ProgressPosition.top,
      repeat: false,
      controller: storyController,
    );
  }
}
