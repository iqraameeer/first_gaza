import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import 'package:pehli_gaza_app/widget/text_bullet_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChildWeek27DetailScreen extends StatefulWidget {
  final int selectedDay;

  const ChildWeek27DetailScreen({
    Key? key,
    required this.selectedDay,
  }) : super(key: key);

  @override
  _ChildWeek27DetailScreenState createState() =>
      _ChildWeek27DetailScreenState();
}

class _ChildWeek27DetailScreenState extends State<ChildWeek27DetailScreen> {
  final String videoURL =
      "https://www.youtube.com/embed/vp-Ek9mTKgk?rel=0&controls=1&showinfo=0&modestbranding=1&iv_load_policy=3";
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          // Apply styling to the iframe and hide unwanted UI elements
          _webViewController.runJavaScript(
            """
            document.querySelector('iframe').style.borderRadius = '10px';
            document.body.style.margin = '0';
            document.body.style.padding = '0';
            document.body.style.backgroundColor = 'transparent';
            // Hide share button and other UI elements if present
            var shareButton = document.querySelector('.ytp-share-button');
            if (shareButton) shareButton.style.display = 'none';
            var title = document.querySelector('.ytp-title');
            if (title) title.style.display = 'none';
            """,
          );
        },
        onNavigationRequest: (NavigationRequest request) {
          // Block navigation to any URL other than the embedded video
          if (!request.url.contains('youtube.com/embed/vp-Ek9mTKgk')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onWebResourceError: (error) {
          debugPrint("WebView Error: ${error.description}");
        },
      ));

    // Load video automatically for day 1
    if (widget.selectedDay == 1) {
      _webViewController.loadRequest(Uri.parse("$videoURL&autoplay=1"));
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
                                  ? "کیا بچہ کا موٹا ہونا صحت کی نشانی ہے؟"
                                  : widget.selectedDay == 3
                                      ? "بچے کی اضافی غذا میں آئرن (iron)کیوں ضروری ہے؟"
                                      : widget.selectedDay == 5
                                          ? "دست (diarrhea) کے دوران بچے کی اضافی خوراک کے بارے میں کچھ اصول\nکرنے والے کام (Do’s)"
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
            const BulletList(items: [
              'بچے کا عمر سے زیادہ وزن ہونا اس کیلئے موٹاپا، ذیابیطس اور بلڈ پریشر کا سبب بن سکتا ہے۔',
              'آئیں اس چھوٹی سی ویڈیو میں ہم اس کے بارے میں مزید جانتے ہیں۔',
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
            const SizedBox(height: 10),
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
              'بچے کا وزن اور قد باقاعدگی سے چیک کروائیں تاکہ معلوم ہو سکے کہ آپ کا بچہ اپنی عمر کے مطابق بڑھ رہا ہے۔',
              'بچے کی ویکسینیشن والے دن ہسپتال میں بچے کا قد اور وزن ریکارڈ کیا جاتا ہے۔ اس لئے ضروری ہے کہ آپ بچے کی کسی بھی ویکسینیشن اپوائنٹمنٹ میں ناغہ نہ کریں۔',
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
            BulletList(items: [
              'آئرن بچے کو خون کی کمی (anemia) سے بچاتا  ہیں اور  بچے کی قوت مدافعت کو بڑھاتا ہے۔',
              'بچے کو مختلف قسم کی  آئرن سے بھرپور غذائیں دیں جیسے کہ اچھی طرح پکا ہوا نرم چکن کا گوشت(کچل کر یا پیس کر)، اچھی طرح پکا ہوا انڈا ) ماں کے دودھ یا پانی میں ملا کر( ۔',
            ]),
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
              "بچے کو ماں کا دودھ پلانا جاری رکھیں۔",
              "بچے کو پانی وقفے وقفے سے پلاتے رہیں تاکہ پانی کی کمی نہ ہو۔",
              "پانی کے علاوہ بچے کو ORS بھی دیں۔",
              "آسانی سے ہضم ہونے والی غذا جیسے چاول کا دلیہ، دہی یا میش کیے ہوئے کیلے دیں۔",
              "بچہ ٹھوس غذا کھانے سے انکار کرے تو بھی کوشش کریں کہ اسے دن بھر میں وقفے وقفے سے تھوڑی سی نرم غذا آفر کرتے رہیں مگر زبردستی نہ کریں۔",
              "تلی ہوئی اشیاء، پنیر اور چینی والے مشروبات سے پرہیز کریں۔",
              "تمام کھانے کے برتن اور بچے کے ہاتھ صاف رکھیں تاکہ مزید بیماری سے بچا جا سکے۔",
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
              'زنک  کے سیرپ  کے استعمال  سے بچے میں دست کے دورانیے اور شدت میں کمی آتی ہے ۔',
              'صحت یاب ہونے کے بعد بچے کو معمول کے مطابق کھانا کھلائیں ۔',
              'ہمیشہ ڈاکٹر سے مشورہ کریں تاکہ آپ کے بچے کی صحت کو بہتر طور پر مانیٹر کیا جا سکے۔',
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
