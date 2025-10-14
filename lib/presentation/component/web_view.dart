import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends StatelessWidget {
  const WebView({super.key, this.data = ''});

  final String data;

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialData: InAppWebViewInitialData(data: data),
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          javaScriptEnabled: true,
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false,
          allowUniversalAccessFromFileURLs: true,
          allowFileAccessFromFileURLs: true,
        ),
        android: AndroidInAppWebViewOptions(
          useHybridComposition: true,
          builtInZoomControls: false,
          displayZoomControls: false,
        ),
        ios: IOSInAppWebViewOptions(
          allowsInlineMediaPlayback: true,
          disallowOverScroll: true,
          allowsBackForwardNavigationGestures: true,
        ),
      ),
      onWebViewCreated: (controller) {},
      onLoadStop: (controller, url) {
        debugPrint("Loaded: $url");
      },
      onConsoleMessage: (controller, consoleMessage) {
        debugPrint("Console: ${consoleMessage.message}");
      },
    );
  }
}
