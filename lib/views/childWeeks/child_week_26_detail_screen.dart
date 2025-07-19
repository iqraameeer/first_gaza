import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import 'package:pehli_gaza_app/widget/text_bullet_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChildWeek26DetailScreen extends StatefulWidget {
  final int selectedDay;

  const ChildWeek26DetailScreen({
    Key? key,
    required this.selectedDay,
  }) : super(key: key);

  @override
  _ChildWeek26DetailScreenState createState() =>
      _ChildWeek26DetailScreenState();
}

class _ChildWeek26DetailScreenState extends State<ChildWeek26DetailScreen> {
  final String videoID = "TnDVrLpMHn8"; // Embed video ID
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          // Hide YouTube elements
          _webViewController.runJavaScript("""
            // Hide YouTube suggestions and UI elements
            const style = document.createElement('style');
            style.innerHTML = `
              .ytp-pause-overlay,
              .ytp-suggestion-set,
              .ytp-title-link,
              .ytp-title-channel,
              .ytp-chrome-top-buttons,
              .ytp-share-button,
              .ytp-overflow-button,
              .ytp-prev-button,
              .ytp-next-button,
              .ytp-related-on-error-overlay {
                display: none !important;
              }
              iframe {
                border-radius: 10px !important;
              }
              body {
                margin: 0 !important;
                padding: 0 !important;
                background-color: transparent !important;
              }
            `;
            document.head.appendChild(style);
          """);
        },
        onWebResourceError: (error) {
          debugPrint("WebView Error: ${error.description}");
        },
        onNavigationRequest: (NavigationRequest request) {
          // Block any navigation outside our embed
          if (!request.url.contains("youtube.com/embed/")) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ));

    if (widget.selectedDay == 5) {
      final embedUrl =
          "https://www.youtube.com/embed/$videoID?autoplay=1&rel=0&modestbranding=1&controls=1&showinfo=0&disablekb=1&fs=0";
      _webViewController.loadRequest(Uri.parse(embedUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RadialBackground(),
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: ColorsConstant.btnlogin,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Flexible(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 10),
                            child: Text(
                              widget.selectedDay == 1
                                  ? "بچے کو نئی غذا شروع کرنے کے بارے میں ہدایات"
                                  : widget.selectedDay == 3
                                      ? "بچے کی متوازن خوراک کا کیا مطلب ہے؟"
                                      : widget.selectedDay == 5
                                          ? "بچے کی متوازن خوراک کن چیزوں سے بنتی ہے؟"
                                          : "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20,
                                  height: 2,
                                  color: ColorsConstant.textColor,
                                  fontFamily: 'NotoNastaliqUrdu',
                                  fontWeight: FontWeight.w600),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: _buildContentForSelectedDay(widget.selectedDay),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentForSelectedDay(int day) {
    if (day == 1) {
      return const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 10),
            BulletList(items: [
              'بچے کو کوئی بھی نئی غذا دو سے تین دن تک دیں پھر دوسری غذا متعارف کرائیں  تاکہ: '
            ]),
            TickmarkList(items: [
              "بچے نئی غذا کے ذائقے سے واقف ہو جائیں۔",
              "بچے کا ہاضمہ نئی غذا سے عادی ہو سکے۔",
              "بچے میں نئی غذا سے پیدا ہونے والے ممکنہ الرجی کے اثرات دیکھے جا سکیں۔",
            ]),
          ],
        ),
      );
    } else if (day == 3) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "بچے کی متوازن خوراک کا مطلب ہےوہ خوراک جس میں مختلف غذائی اجزاء مناسب مقدار میں شامل ہوں تاکہ بچے کی جسمانی اور ذہنی نشونما بہترین ہو سکے۔",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 10),
            Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 10),
            BulletList(items: [
              'بچے کو ابتدا سے ہی متوازن خوراک دیں، کیونکہ یہ بچے کی توانائی کی ضروریات پوری کرتی ہے اور انہیں بیماریوں سے بچاتی ہے۔'
            ]),
          ],
        ),
      );
    } else if (day == 5) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "آج ہم آپ کو بتاتے ہیں کہ بچوں کی متوازن خوراک میں کن چیزوں کا شامل ہونا ضروری ہے۔",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),
            const BulletList(items: [
              "پروٹین: گوشت، مچھلی، انڈے، دالیں، اور لوبیا۔",
              "کاربوہائیڈریٹس: روٹی، پاستا، اور آلو۔",
              "پھل اور سبزیاں: مختلف قسم کے پھل (سیب، کیلا) اور سبزیاں (گاجر، پالک)۔",
              "ڈیری مصنوعات: انڈے، مکھن، دہی، اور پنیر۔",
              "چربی: زیتون کا تیل۔",
              "بچے کی متوازن خوراک تیار کرنے کے طریقے سیکھنے کے لیے یہ ویڈیو دیکھیں۔",
            ]),
            const SizedBox(height: 10),
            Container(
              height: 220,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: WebViewWidget(
                  controller: _webViewController,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const Center(
        child: Text(
          'No content available',
          style: TextStyle(fontSize: 18, color: Colors.red),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
