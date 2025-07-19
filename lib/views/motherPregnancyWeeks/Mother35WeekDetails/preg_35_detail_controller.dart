import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class PregWeek35Controller extends GetxController {
  final Map<int, String> videoUrls = {
    1: "https://www.youtube-nocookie.com/embed/9VtxCxtsMAI?autoplay=1&rel=0&modestbranding=1&controls=0&showinfo=0&fs=0&disablekb=1&iv_load_policy=3&playsinline=1&enablejsapi=1",
    3: "https://www.youtube-nocookie.com/embed/mpyD19SIiaw?autoplay=1&rel=0&modestbranding=1&controls=0&showinfo=0&fs=0&disablekb=1&iv_load_policy=3&playsinline=1&enablejsapi=1",
    5: "https://www.facebook.com/watch/?v=1130434325391121",
  };

  late WebViewController _webViewController;
  final int selectedDay = Get.arguments['selectedDay'] ?? 1;
  var isLoading = true.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();

    if (Platform.isAndroid) {
      WebViewPlatform.instance = AndroidWebViewPlatform();
    } else if (Platform.isIOS) {
      WebViewPlatform.instance = WebKitWebViewPlatform();
    }

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..enableZoom(false)
      ..setUserAgent(
          'Mozilla/5.0 (Linux; Android 10; Mobile) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Mobile Safari/537.36')
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) {
          isLoading.value = true;
          hasError.value = false;
          print('Page started: $url');
        },
        onPageFinished: (String url) {
          isLoading.value = false;
          print('Page finished: $url');
          _webViewController.runJavaScript("""
            document.querySelectorAll('video').forEach(video => {
              video.setAttribute('autoplay', '');
              video.setAttribute('playsinline', '');
              video.muted = true;
              video.play().catch(e => console.log('Play error: ' + e));
            });
            const selectors = [
              '.fb-video-popup-container',
              'button[aria-label*="Log in"]',
              'button[aria-label*="Sign up"]',
              'div[role="dialog"]',
              'div[class*="login"]'
            ];
            selectors.forEach(selector => {
              document.querySelectorAll(selector).forEach(el => el.remove());
            });
            document.addEventListener('contextmenu', e => e.preventDefault());
            document.body.style.overflow = 'hidden';
            console.log('Video elements: ' + document.querySelectorAll('video').length);
          """);
        },
        onWebResourceError: (error) {
          isLoading.value = false;
          hasError.value = true;
          errorMessage.value = error.description;
          print('WebView Error: ${error.description}');
          Get.snackbar('Error', 'Failed to load video: ${error.description}');
        },
      ));

    _loadVideo(selectedDay);
  }

  void _loadVideo(int day) {
    String? url = videoUrls[day];
    if (url != null) {
      if (day == 5) {
        String html = '''
          <!DOCTYPE html>
          <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
              body { margin: 0; padding: 0; overflow: hidden; }
              iframe { width: 100%; height: 100%; border: none; }
            </style>
          </head>
          <body>
            <iframe
              width="100%"
              height="100%"
              src="https://www.facebook.com/plugins/video.php?href=${Uri.encodeComponent(url)}&show_text=false&width=560&height=315&autoplay=true&mute=1"
              frameborder="0"
              allow="autoplay; encrypted-media"
              allowfullscreen="false"
              playsinline
            ></iframe>
          </body>
          </html>
        ''';
        _webViewController.loadHtmlString(html);
      } else {
        _webViewController.loadRequest(Uri.parse(url));
      }
    } else {
      hasError.value = true;
      errorMessage.value = 'No video URL available';
      Get.snackbar('Error', 'No video URL available for day $day');
    }
  }

  WebViewController get webViewController => _webViewController;
}
