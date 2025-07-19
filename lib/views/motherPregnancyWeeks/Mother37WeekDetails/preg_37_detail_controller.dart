import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PregWeek37Controller extends GetxController {
  final Map<int, String> videoIds = {
    1: "9VtxCxtsMAI",
    3: "mpyD19SIiaw",
    5: "mpyD19SIiaw",
  };
  late WebViewController _webViewController;
  final int selectedDay = Get.arguments['selectedDay'] ?? 1;

  @override
  void onInit() {
    super.onInit();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          _webViewController.runJavaScript("""
            // Function to remove elements
            function cleanUI() {
              const selectors = [
                '.ytp-share-button',
                '.ytp-copylink-button',
                '.ytp-overflow-button',
                '.ytp-watch-later-button',
                '.ytp-share-panel',
                '.ytp-contextmenu',
                '.ytp-popup',
                '.ytp-chrome-top',
                '.ytp-title-link',
                '.ytp-title-channel',
                '.ytp-pause-overlay',
                '.ytp-more-videos-view',
                '.ytp-related-on-error-overlay',
                '.ytp-endscreen-content',
                '.ytp-ce-element'
              ];
              
              selectors.forEach(selector => {
                document.querySelectorAll(selector).forEach(el => el.remove());
              });
              
              // Hide any remaining share buttons
              const buttons = document.querySelectorAll('button');
              buttons.forEach(btn => {
                if (btn.innerText.includes('Share') || 
                    btn.innerText.includes('Copy') ||
                    (btn.getAttribute('aria-label') && 
                     (btn.getAttribute('aria-label').includes('Share') ||
                      btn.getAttribute('aria-label').includes('Copy')))) {
                  btn.remove();
                }
              });
            }
            
            // Create style to permanently hide elements
            const style = document.createElement('style');
            style.innerHTML = `
              .ytp-share-button,
              .ytp-copylink-button,
              .ytp-overflow-button,
              .ytp-watch-later-button,
              .ytp-share-panel,
              .ytp-contextmenu,
              .ytp-popup,
              .ytp-chrome-top,
              .ytp-title-link,
              .ytp-title-channel,
              .ytp-pause-overlay,
              .ytp-more-videos-view,
              .ytp-related-on-error-overlay,
              .ytp-endscreen-content,
              .ytp-ce-element {
                display: none !important;
              }
              
              html, body, #player {
                margin: 0 !important;
                padding: 0 !important;
                width: 100% !important;
                height: 100% !important;
                overflow: hidden !important;
              }
            `;
            document.head.appendChild(style);
            
            // Disable right-click context menu
            document.addEventListener('contextmenu', e => e.preventDefault());
            
            // Run cleaner immediately and every 500ms
            cleanUI();
            setInterval(cleanUI, 500);
            
            // Disable player controls if API is available
            if (typeof player !== 'undefined') {
              player.setOptions({
                'modestbranding': 1,
                'controls': 0,
                'rel': 0,
                'showinfo': 0,
                'fs': 0,
                'disablekb': 1
              });
            }
          """);
        },
        onWebResourceError: (error) {
          print("WebView Error: ${error.description}");
        },
      ));

    // Load video automatically based on selectedDay
    _loadVideo(selectedDay);
  }

  String _getEmbedUrl(int day) {
    String? videoId = videoIds[day];
    if (videoId != null) {
      return "https://www.youtube-nocookie.com/embed/$videoId?" +
          "autoplay=1&" +
          "rel=0&" +
          "modestbranding=1&" +
          "controls=0&" +
          "showinfo=0&" +
          "fs=0&" +
          "disablekb=1&" +
          "iv_load_policy=3&" +
          "playsinline=1&" +
          "enablejsapi=1";
    }
    return "";
  }

  WebViewController get webViewController => _webViewController;

  void _loadVideo(int day) {
    String embedUrl = _getEmbedUrl(day);
    if (embedUrl.isNotEmpty) {
      _webViewController.loadRequest(Uri.parse(embedUrl));
    }
  }
}
