import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DenemeScreen extends StatefulWidget {
  const DenemeScreen({super.key});
  @override
  State<DenemeScreen> createState() => _DenemeScreenState();
}

class _DenemeScreenState extends State<DenemeScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // JS desteğini aç
      ..setNavigationDelegate(
        NavigationDelegate(
            // onPageFinished: (String url) async {
            //   // Sayfa yüklendikten sonra resizer.js'i çalıştır
            //   await _controller.runJavaScript("""
            //     (function() {
            //       var script = document.createElement('script');
            //       script.src = "https://insanisi.online/wp-content/plugins/h5p/h5p-php-library/js/h5p-resizer.js";
            //       script.type = "text/javascript";
            //       document.head.appendChild(script);
            //     })();
            //   """);
            // },
            ),
      )
      ..loadRequest(
          Uri.parse("file:///Users/mehmetdemir/Desktop/web%20/index.html"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
