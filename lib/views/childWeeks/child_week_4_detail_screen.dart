import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import 'package:pehli_gaza_app/widget/text_bullet_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChildWeek04DetailScreen extends StatefulWidget {
  final int selectedDay;

  const ChildWeek04DetailScreen({
    Key? key,
    required this.selectedDay,
  }) : super(key: key);

  @override
  _ChildWeek04DetailScreenState createState() =>
      _ChildWeek04DetailScreenState();
}

class _ChildWeek04DetailScreenState extends State<ChildWeek04DetailScreen> {
  final Map<int, String> videoURLs = {
    1: "https://www.youtube.com/embed/axQi5PqRZ0M?rel=0&modestbranding=1",
    2: "https://www.youtube.com/embed/K0zVCwdJZw0?rel=0&modestbranding=1",
    3: "https://www.youtube.com/embed/lcVRbSV-qXc?rel=0&modestbranding=1",
  };

  late WebViewController _webViewController;
  bool showVideoPlayer1 = false;
  bool showVideoPlayer2 = false;
  bool showVideoPlayer3 = false;
  bool showVideoPlayer4 = false;
  late WebViewController _webViewController1;
  late WebViewController _webViewController2;
  late WebViewController _webViewController3;
  late WebViewController _webViewController4;

  @override
  void initState() {
    super.initState();
    _webViewController1 = _createWebViewController();
    _webViewController2 = _createWebViewController();
    _webViewController3 = _createWebViewController();
    _webViewController4 = _createWebViewController();
  }

  WebViewController _createWebViewController() {
    return WebViewController()
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
        onNavigationRequest: (NavigationRequest request) {
          // Allow only YouTube embed URLs
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

  void _toggleVideoPlayer(int videoIndex) {
    setState(() {
      switch (videoIndex) {
        case 1:
          showVideoPlayer1 = !showVideoPlayer1;
          if (showVideoPlayer1) _loadVideo(1, _webViewController1);
          break;
        case 2:
          showVideoPlayer2 = !showVideoPlayer2;
          if (showVideoPlayer2) _loadVideo(2, _webViewController2);
          break;
        case 3:
          showVideoPlayer3 = !showVideoPlayer3;
          if (showVideoPlayer3) _loadVideo(3, _webViewController3);
          break;
        case 4:
          showVideoPlayer4 = !showVideoPlayer4;
          if (showVideoPlayer4) _loadVideo(4, _webViewController4);
          break;
      }
    });
  }

  void _loadVideo(int videoIndex, WebViewController controller) {
    String? videoURL = videoURLs[videoIndex];
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
                                  ? "بیمار بچے کو دودھ پلانے سے متعلق چند ہدایات"
                                  : widget.selectedDay == 3
                                      ? "سماعت اور بصارت کی نشونما"
                                      : widget.selectedDay == 5
                                          ? "بچے کی جسمانی نشونما"
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
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              'بیماری کے دوران بچے کو دودھ پلانا جاری  رکھیں بلکہ اس میں اضافہ کرنا چاہیےکیونکہ:۔ ',
            ]),
            TickmarkList(items: [
              "ماں کے دودھ میں پانی، معدنیات (electrolytes) اور غذائیت موجود ہوتی ہے جو بچے کو پانی کی کمی (dehydration) سے بچاتی ہے، خاص طور پر دست (diarrhea) یا بخار کے دوران۔",
              "ماں کے دودھ میں اینٹی باڈیز (antibodies) اور قوت مدافعت (immunity) بڑھانے والے اجزاء شامل ہوتے ہیں، جو انفیکشن کے خلاف لڑنے اور جلد صحتیابی میں مدد دیتے ہیں۔"
            ]),
            BulletList(items: [
              "بچے کو بار بار اور مختصر وقفوں میں ماں کا دودھ پلائیں، کیونکہ بیمار بچے تھکن یا تکلیف کی وجہ سے طویل وقت تک دودھ نہیں پی سکتے۔",
              "اگر بچہ بیماری کی وجہ سے ماں کی چھاتی سے دودھ پینے کے لیے کمزور ہو تو ماں کے دودھ کو نکال کر چمچ یا کپ کے ذریعے پلائیں۔"
            ]),
            const SizedBox(height: 20),
            const Text(
              "خطرے کی علامات:",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            Text(
              "بچے میں مندرجہ ذیل علامات ہونے کی صورت میں فوری طور پر ڈاکٹر سے رجوع کریں۔ ",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            TickmarkList(items: [
              "اگر بچہ انتہائی کم دودھ پی رہا ہے یا دودھ پینے سے انکار کر رہا ہے۔",
              "مسلسل یا بار بار قے یا دست آنا۔",
              "پانی کی کمی کی علامات ہونا مثلاً ڈائپرز کا کم گیلا یا خشک رہنا یا بچے کا خشک منہ ہونا۔",
              "بچے کا مسلسل رونا یا بے چینی۔",
              "بیماری کی علامات کا بڑھنا مثلاً بخار جو کم نہیں ہو رہا، سانس لینے میں دشواری، جلد کا رنگ پیلا یا نیلا ہونا۔"
            ]),
            const SizedBox(height: 20),
            const Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "آپ کی رہنمائی کے لیے یہ ویڈیو شیئر کی جارہی ہے تاکہ آپ اپنے بچے کو اپنا دودھ بیماری میں بھی پلا سکیں۔",
              "ہاتھ کی مدد سے چھاتی سے دودھ نکالنے کا طریقہ سیکھنے کے لیے یہ ویڈیو دیکھیں۔",
            ]),
            ElevatedButton(
              onPressed: () => _toggleVideoPlayer(1),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsConstant.btnlogin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: Text(
                showVideoPlayer1
                    ? 'ویڈیو بند کریں'
                    : 'ویڈیو دیکھیں (دودھ پلانے کی رہنمائی)',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'JameelNoori',
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (showVideoPlayer1)
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
                    controller: _webViewController1,
                  ),
                ),
              ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => _toggleVideoPlayer(2),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsConstant.btnlogin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: Text(
                showVideoPlayer2
                    ? 'ویڈیو بند کریں'
                    : 'ویڈیو دیکھیں (ہاتھ کی مدد سے چھاتی سے دودھ نکالنے)',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'JameelNoori',
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (showVideoPlayer2)
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
                    controller: _webViewController2,
                  ),
                ),
              ),
            BulletList(items: [
              "بچے کو کپ کے ذریعے دودھ پلانے کا طریقہ سیکھنے کے لیے یہ ویڈیو دیکھیں۔",
            ]),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _toggleVideoPlayer(3),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsConstant.btnlogin,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: Text(
                showVideoPlayer3
                    ? 'ویڈیو بند کریں'
                    : 'ویڈیو دیکھیں ( بچے کو کپ سے دودھ پلانا)',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'JameelNoori',
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (showVideoPlayer3)
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
                    controller: _webViewController3,
                  ),
                ),
              ),
          ],
        ),
      );
    } else if (day == 3) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "آپ کا یہ جاننا بہت ضروری ہے کہ بچے کی نشوونما کے مختلف مراحل کیا ہوتے ہیں تاکہ آپ اپنے بچے کی بہترین دیکھ بھال کر سکیں۔ ",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "پہلے مہینے کے آخر تک بچے کو مکمل سنائی دیتا ہے۔",
              "آنکھیں ابھی مکمل فوکس نہیں کرتیں، کبھی ماں پر نظریں جماتا ہے اور کبھی کبھار بھینگی نظر آ سکتی ہیں۔",
              "گلے سے آوازیں نکالتا ہے اور ماں کی توجہ پر ردعمل دیتا ہے۔ یہ بچے کی نارمل نشوونما کا حصہ ہے، فکر نہ کریں!"
            ]),
            const SizedBox(height: 20),
            const Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "اپنے بچے سے محبت کا اظہار کریں۔",
              "اس سے بات کرتے وقت آنکھوں میں آنکھیں ملا کر جواب دیں۔",
              "اپنے کام کرتے وقت بچے سے بات کریں تاکہ وہ آپ کی آواز سن سکے۔"
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_20.png',
              fit: BoxFit.cover,
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
            Text(
              "پچھلے پیغام میں آپ کو بچے کی  دیکھنے اور سننے کی نشونما کے کچھ مراحل بتائے گئے تھے۔ آج  جسمانی نشوونما   کے بارے میںباتیں آپ سے شیئر کرتے ہیں۔",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "پہلے مہینے کے آخر تک آپ کا نوزائیدہ بازو اور ٹانگوں کو زور زور سے حرکت دیتا ہے۔",
              "زیادہ تر وقت ہاتھوں کو مٹھی میں بند رکھتا ہے۔",
              "اس کے سر کو سہارے کی ضرورت رہتی ہے۔"
            ]),
            const SizedBox(height: 20),
            const Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "بچے کو ہلکے سے جھولیں، کبھی بھی جھنجھوڑیں نہیں۔",
              "سر اور گردن کو خاص طور پر اٹھاتے وقت محفوظ رکھیں۔",
              "بچے کے سر کے لیے گول نرم تکیہ استعمال کریں اور بچے کے سر کو شکل دینے کی کوشش نہ کریں۔",
              "بچے کو آزادانہ حرکت کرنے دیں۔ بچے کے جسم کو کپڑوں میں کس کر نہ باندھیں۔"
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_1_21.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
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
