import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import 'package:pehli_gaza_app/widget/text_bullet_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChildWeek14DetailScreen extends StatefulWidget {
  final int selectedDay;

  const ChildWeek14DetailScreen({
    Key? key,
    required this.selectedDay,
  }) : super(key: key);

  @override
  _ChildWeek14DetailScreenState createState() =>
      _ChildWeek14DetailScreenState();
}

class _ChildWeek14DetailScreenState extends State<ChildWeek14DetailScreen> {
  final Map<int, Map<int, String>> videoURLs = {
    3: {
      1: "https://www.youtube.com/embed/axQi5PqRZ0M?rel=0&modestbranding=1",
      2: "https://www.youtube.com/embed/K0zVCwdJZw0?rel=0&modestbranding=1",
    },
    5: {
      1: "https://www.youtube.com/embed/lcVRbSV-qXc?rel=0&modestbranding=1",
    },
  };
  bool showVideoPlayerDay3Video1 = false;
  bool showVideoPlayerDay3Video2 = false;
  late WebViewController controller;
  late WebViewController _webViewControllerDay3Video1;
  late WebViewController _webViewControllerDay3Video2;
  late WebViewController _webViewControllerDay5Video1;

  @override
  void initState() {
    super.initState();
    _webViewControllerDay3Video1 = _createWebViewController();
    _webViewControllerDay3Video2 = _createWebViewController();
    _webViewControllerDay5Video1 = _createWebViewController();

    // Automatically load video for day 5
    if (widget.selectedDay == 5) {
      _loadVideo(5, 1, _webViewControllerDay5Video1);
    }
  }

  WebViewController _createWebViewController() {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          controller.runJavaScript(
            """
            document.querySelector('iframe').style.borderRadius = '10px';
            document.body.style.margin = '0';
            document.body.style.padding = '0';
            document.body.style.backgroundColor = 'transparent';
            """,
          );
        },
        onNavigationRequest: (NavigationRequest request) {
          // Block any navigation that would take the user away from the embedded video
          if (request.url.contains('youtube.com/embed')) {
            return NavigationDecision.navigate;
          }
          return NavigationDecision.prevent;
        },
        onWebResourceError: (error) {
          debugPrint("WebView Error: ${error.description}");
        },
      ));
  }

  void _toggleVideoPlayer(int day, int videoIndex) {
    setState(() {
      if (day == 3) {
        if (videoIndex == 1) {
          showVideoPlayerDay3Video1 = !showVideoPlayerDay3Video1;
          if (showVideoPlayerDay3Video1) {
            _loadVideo(3, 1, _webViewControllerDay3Video1);
          }
        } else if (videoIndex == 2) {
          showVideoPlayerDay3Video2 = !showVideoPlayerDay3Video2;
          if (showVideoPlayerDay3Video2) {
            _loadVideo(3, 2, _webViewControllerDay3Video2);
          }
        }
      }
    });
  }

  void _loadVideo(int day, int videoIndex, WebViewController controller) {
    String? videoURL = videoURLs[day]?[videoIndex];
    if (videoURL != null) {
      String autoPlayUrl = "$videoURL&autoplay=1&controls=1&showinfo=0";
      controller.loadRequest(Uri.parse(autoPlayUrl));
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
                                  ? "چودہ ہفتے کی ویکسینیشن کے بارے میں یاد دہانی !"
                                  : widget.selectedDay == 3
                                      ? "ہاتھ سے دودھ نکالنے کا طریقہ"
                                      : widget.selectedDay == 5
                                          ? "کپ  کے ذریعے ماں کا  دودھ پلانے  کا طریقہ"
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
    String text_day_1 = "مسئلہ: بچے کا ماں کا دودھ پینے سے انکار";

    String text_day_5 =
        "اگر اس کا علاج نہ کیا جائے تو چھاتیوں کی سوجن کا خطرہ پیدا ہو جاتا ہے ۔";

    if (day == 1) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'امید کرتے ہیں کہ آج کا دن آپ کے بچے کے لیے خوبصورت ہو۔ آپ کے ننھے منے  بچے کا اگلا حفاظتی  ٹیکہ چودہ ہفتے کی عمر میں لگنا ہے۔ آپ بچے کو اپنا دودھ ویکسین لگوانے کے بعد پلا سکتی ہیں۔ کوشش کریں کہ اپنا دودھ زیادہ بار پلائیں۔ اس سے بچے کو سکون ملے گا، پانی کی کمی نہیں ہوگی، اور بچے کی قوتِ مدافعت بہتر ہوگی۔  ',
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),
            const Text(
              'یاد رکھیں!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const BulletList(items: [
              'بچے کی صحت کے لیے حفاظتی ٹیکوں کا کورس مکمل کرنا بہت ضروری ہے۔',
              'ویکسین کے بعد کچھ بچوں کو ہلکا بخار، چڑچڑاپن، یا انجکشن کی جگہ پر سوجن ہو سکتی ہے، جو عام بات ہے۔ ',
              'چودہ ہفتے کا ویکسین آپ کے بچے کو مندرجہ ذیل خطرناک بیماریوں سے بچاتا ہے:'
            ]),
            _buildTickmarkList(
                ['پولیو، ڈفتھیریا، پرٹیوسس، ٹیٹنس ، اور نیوموکوکل']),
            const BulletList(items: [
              "اپنے بچے کو حفاظتی ٹیکوں کے شیڈول کی مقررہ تاریخ پر اپنے ہسپتال کے ویکسینیشن سینٹر لے کر آئیں۔",
              "ویکسینیشن والے دن آپ کے بچے کے وزن اور قد کی پیمائش بھی کی جاتی ہیں تاکہ معلوم ہو سکے کہ آپ کا بچہ اپنی عمر کے مطابق بڑھ رہا ہے۔ اس لیے بہت ضروری ہے کہ آپ بچے کو ویکسینیشن سینٹر میں لے کر آئیں۔",
              "اگر کسی مصروفیت کی وجہ سے آپ مقررہ تاریخ پر نہیں آ سکتے تو ہمیں ضرور مطلع کریں۔",
              "ہم آپ کو جلد از جلد آپ کی سہولت کے مطابق نئی اپوائنٹمنٹ کی تاریخ دے دیں گے۔",
              "یاد رہے کہ ہم آپ کی مدد اور رہنمائی کے لیے ہر مقررہ تاریخ پر ویکسینیشن سینٹر میں موجود ہیں جہاں ہم آپ کے سوالات کا تسلی بخش جواب دیں گے۔",
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
              'ہاتھ کی مدد سے چھاتی سے دودھ نکال کر پلانا آسان اور فائدہ مند ہے  کیونکہ اس طریقے سے  کام کرنے والی مائیں دودھ پلانے کا سلسلہ جاری رکھ سکتی ہیں۔ ',
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),
            const Text(
              'یاد رکھیں!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const BulletList(items: [
              'چھاتی سے دودھ نکالنے سے پہلے اپنے ہاتھ اچھی طرح دھوئیں۔',
              'ہاتھ کی مدد سے چھاتی سے دودھ  نکالنے  کا طریقہ سیکھنے کے لیے یہ ویڈیو دیکھیں۔',
              'دودھ پلانے کے عمومی رہنما اصول سیکھنے کے لیے یہ ویڈیو دیکھیں۔',
            ]),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _toggleVideoPlayer(3, 1),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsConstant.btnlogin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: Text(
                showVideoPlayerDay3Video1
                    ? 'ویڈیو بند کریں'
                    : 'ویڈیو دیکھیں (چھاتی سے دودھ  نکالنے  کا طریقہ)',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'JameelNoori',
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (showVideoPlayerDay3Video1)
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
                    controller: _webViewControllerDay3Video1,
                  ),
                ),
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _toggleVideoPlayer(3, 2),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsConstant.btnlogin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: Text(
                showVideoPlayerDay3Video2
                    ? 'ویڈیو بند کریں'
                    : 'ویڈیو دیکھیں (دودھ پلانے کی رہنمائی)',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'JameelNoori',
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (showVideoPlayerDay3Video2)
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
                    controller: _webViewControllerDay3Video2,
                  ),
                ),
              ),
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
              'اگر کبھی آپ کا بچہ براہِ راست دودھ نہ پی سکے، تو آپ کے دودھ کو صاف کپ کے ذریعے دینا ایک بہترین آپشن ہے۔ کپ کے ذریعے دودھ دینا خاص طور پر ان حالات میں مفید ہے جب بچہ کمزور ہو، بیمار ہو، یا آپ کام پر ہوں۔ یہ بوتل کے استعمال سے بچنے اور بچے کی صحت برقرار رکھنے کا محفوظ طریقہ ہے۔',
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),
            const Text(
              'یاد رکھیں!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const BulletList(items: [
              "ہمیشہ کپ کے ذریعے دودھ پلانے سے پہلے کپ اور اپنے ہاتھ دھوئیں۔",
              "اس بات کو یقینی بنائیں کہ آپ کا بچہ جاگ رہا ہو اور دودھ پینے کے لیے تیار ہو۔",
              "کپ کو نکالے گئے ماں کے دودھ سے دو تہائی تک بھریں۔",
              "اگر ضرورت ہو، تو اپنے بچے کو کپڑے میں لپیٹ لیں تاکہ بچے کے ہاتھ کپ سے نہ ٹکرائیں۔",
              "بچے کو کپ کے ذریعے دودھ پلانے کا طریقہ سیکھنے کے لیے یہ ویڈیو دیکھیں۔",
            ]),
            const SizedBox(height: 20),
            // Video will automatically show here for day 5 (no button needed)
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
                  controller: _webViewControllerDay5Video1,
                ),
              ),
            ),
            const SizedBox(height: 20),
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

  Widget _buildTickmarkList(List<String> items) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: items.map((item) {
          List<String> parts = item.split(':');
          String keyword = parts.first;
          String remainingText =
              parts.length > 1 ? parts.sublist(1).join(':') : '';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, // Ensures RTL alignment
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$keyword ', // Highlighted keyword
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'JameelNoori',
                          ),
                        ),
                        TextSpan(
                          text: remainingText, // Remaining text
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'JameelNoori',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.check,
                    size: 20, color: Colors.black), // Tickmark
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
