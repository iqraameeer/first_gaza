import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import 'package:pehli_gaza_app/widget/text_bullet_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChildWeek39DetailScreen extends StatefulWidget {
  final int selectedDay;

  const ChildWeek39DetailScreen({
    Key? key,
    required this.selectedDay,
  }) : super(key: key);

  @override
  _ChildWeek39DetailScreenState createState() =>
      _ChildWeek39DetailScreenState();
}

class _ChildWeek39DetailScreenState extends State<ChildWeek39DetailScreen> {
  final String videoURL =
      "https://www.youtube.com/embed/vp-Ek9mTKgk?autoplay=1&rel=0&controls=0&showinfo=0&modestbranding=1";
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          _webViewController.runJavaScript(
            """
            document.querySelector('iframe').style.borderRadius = '10px';
            document.body.style.margin = '0';
            document.body.style.padding = '0';
            document.body.style.backgroundColor = 'transparent';
            """,
          );
        },
        onWebResourceError: (error) {
          debugPrint("WebView Error: ${error.description}");
        },
        onNavigationRequest: (NavigationRequest request) {
          // Block navigation to any external YouTube pages
          if (request.url.contains('youtube.com') &&
              !request.url.contains('embed')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse(videoURL));
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
                                  ? "بچے کی لمبائی اور وزن کی نگرانی  کیوں ضروری ہے؟"
                                  : widget.selectedDay == 3
                                      ? "غذائی کمی   بچے کے لئے کس طرح نقصان دہ ہیں؟"
                                      : widget.selectedDay == 5
                                          ? " بچے کی لمبائی اور وزن کب چیک کریں؟"
                                          : "",
                              maxLines: 3,
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
            BulletList(items: [
              "تاکہ معلوم ہو سکے کہ آپ کا بچہ اپنی عمر کے مطابق بڑھ رہا ہے۔",
              " بچے  کا کم وزن یا لمبائی اس بات کی نشانی ہوتی ہے کہ بچے کو مناسب غذا نہیں مل رہی ہے اور وہ غذائی کمی کا شکار ہو رہا ہے۔",
            ]),
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
            BulletList(items: [
              "بچے کا وزن یا لمبائی  نہ بڑھنے کے متعلق تشویش ہو تو ڈاکٹر سے مشورہ کریں۔",
            ]),
          ],
        ),
      );
    } else if (day == 3) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),
            const BulletList(items: [
              "ڈغذائی کمی سے بچے کی جسمانی اور ذہنی نشوونما شدید متاثر ہوتی ہے۔",
              "ایسے بچے بیماریوں کا زیادہ شکار ہو تے ہیں اور ان کا مدافعتی نظام کمزور ہو تا ہے۔",
              "آئیں اس چھوٹی سی ویڈیو میں ہم غذائی کمی کے بچوں کی نشوونما پر نقصانات کے بارے میں جانتے ہیں تاکہ آپ اپنے بچے کو ابتدا سے ہی مناسب غذا کھلائیں۔",
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
    } else if (day == 5) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TickmarkList(items: [
              "پہلے سال میں: ہر ماہ بچے کا قد اور وزن چیک کریں۔",
              "پہلے سال کے بعد: ہر تین ماہ بعد بچے کا قد اور وزن  کم از کم دو سال کی عمر تک چیک کریں۔",
              "اسکول کے عمر تک: سالانہ معائنہ کروانا بہتر ہے۔",
            ]),
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
              "بچے کی ویکسینیشن والے دن ہسپتال میں بچے کا قد اور وزن ریکارڈ کیا جاتا ہے۔ اس لئے ضروری ہے کہ آپ بچے کی کسی بھی ویکسینیشن اپوائنٹمنٹ میں ناغہ نہ کریں۔",
            ]),
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
