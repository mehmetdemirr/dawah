import 'package:auto_route/auto_route.dart';
import 'package:davet/core/extension/screen_size.dart';
import 'package:davet/core/log/log.dart';
import 'package:davet/product/story_view/viewmodel/story_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

@RoutePage()
class StoryViewScreen extends StatefulWidget {
  const StoryViewScreen({super.key, required this.imageList});
  final List<String> imageList;
  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  final storyController = StoryController();
  late List<StoryItem> storyItems;
  late List<String> imageUrls;

  @override
  void initState() {
    super.initState();
    imageUrls = widget.imageList;
    // `storyItems` yalnızca bir kez oluşturulur
    storyItems = imageUrls
        .map(
          (url) => StoryItem.pageImage(
            url: url,
            controller: storyController,
          ),
        )
        .toList();
    context.read<StoryViewViewModel>().reset();
    storyController.play();
  }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  int currentIndex = 0; // Aktif hikaye indeksi

  Future<void> shareImage(String url) async {
    try {
      // Dio nesnesi oluştur
      Dio dio = Dio();

      // URL'den uzantıyı al
      //TODO sonunda .png .svg gibi olan uzantıları olan url için iyi çalışır
      final uri = Uri.parse(url);
      String extension = uri.pathSegments.last.split('.').last;

      // Geçici dosya yolu al
      final tempDir = await getTemporaryDirectory();
      final String filePath = '${tempDir.path}/image_to_share.$extension';

      context.read<StoryViewViewModel>().changeLoadingShow();
      // URL'den dosyayı indir
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (count, total) {
          context
              .read<StoryViewViewModel>()
              .changeDownload((count / total * 100).toStringAsFixed(0));
          debugPrint('İndirme: ${(count / total * 100).toStringAsFixed(0)}%');
        },
      ).then((_) {
        context.read<StoryViewViewModel>().changeLoadingShow();
        // Dosyayı paylaş
        Share.shareXFiles([XFile(filePath)]);
      });
    } catch (e) {
      debugPrint('Bir hata oluştu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var state = context.watch<StoryViewViewModel>();
    return Stack(
      children: [
        StoryView(
          storyItems: storyItems,
          onStoryShow: (storyItem, index) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<StoryViewViewModel>().changeImageUrl(index);
              print("Showing a story");
            });
          },
          onComplete: () {
            print("Completed a cycle");
            context.router.popForced();
          },
          progressPosition: ProgressPosition.top,
          repeat: false,
          controller: storyController,
        ),
        Visibility(
          visible: state.isLoadingShow,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: context.width / 2,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Loading : ${state.download}%",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: InkWell(
            onTap: () {
              storyController.pause();
              Log.info("Tıklandı");
              shareImage(imageUrls[state.index]);
            },
            child: SizedBox(
              width: context.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "PAYLAŞ",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_up_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
