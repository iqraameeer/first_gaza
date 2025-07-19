import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import 'package:pehli_gaza_app/widget/text_bullet_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChildWeek05DetailScreen extends StatefulWidget {
  final int selectedDay;

  const ChildWeek05DetailScreen({
    Key? key,
    required this.selectedDay,
  }) : super(key: key);

  @override
  _ChildWeek05DetailScreenState createState() =>
      _ChildWeek05DetailScreenState();
}

class _ChildWeek05DetailScreenState extends State<ChildWeek05DetailScreen> {
  // Video URL for day 5 (using embed URL with parameters)
  final String videoURL =
      "https://www.youtube.com/embed/mpyD19SIiaw?rel=0&modestbranding=1";

  // WebView controller
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    // Initialize WebView controller
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          // Apply styling to the iframe
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

    // Load the video automatically if day 5 is selected
    if (widget.selectedDay == 5) {
      _webViewController
          .loadRequest(Uri.parse("$videoURL&autoplay=1&controls=1&showinfo=0"));
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
                                  ? "آپ کا بچہ 1 ماہ کے سنگ میل (milestone) کو پہنچ گیا! ہے\nفارمولہ دودھ ماں کے دودھ کا متبادل نہیں ہوتا"
                                  : widget.selectedDay == 3
                                      ? "ماں کے لیے اپنا دودھ پلانے کے فوائد"
                                      : widget.selectedDay == 5
                                          ? "بچوں کی چوسنی  یعنی پیسفائیر اور   بوتل  سے دودھ پلانے کے نقصانات"
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
    String text_day_1 =
        "آپ کے پیارے بچے کو ایک مہینہ مکمل ہونے پر دل سے مبارکباد! یہ آپ کے لیے ایک خاص سنگ میل ہے، اور آپ نے زبردست محنت کی ہے۔ آپ کا بچہ بڑھ رہا ہے اور دن بدن مضبوط ہو رہا ہے۔ یہ سفر خوبصورت ہے، اور ہم آپ کے ساتھ ہیں!";

    String text_day_5 =
        "اگر بچہ درست انداز میں چھاتی کو منہ نہیں ڈالتا تو اس سے نپل کو نقصان ہو سکتاہےاور درد بھی ہو سکتا ہے یہ بھی ممکن ہے کہ بچہ صحیح طریقے سے چھاتی کو خالی نہ کر سکے جس کی وجہ سے چھاتیوں کے بھر جانے کا مسئلہ پیدا ہو جائے یا بچہ دودھ پینے کے بعد مطمئن نہ ہو اور بار بار دودھ پینا چاہے یا زیادہ دیر تک دودھ پینا چاہے بچے کو بہت کم دودھ ملنے کی وجہ سے اس کا وزن کم رہ جائے گا اور زیادہ دودھ نہ پینے کے سبب چھاتیوں سے دودھ خشک ہو جائے گا ان تمام مسائل کا حل یہ کہ بچے کو درست انداز میں چھاتیوں سے لگا یا جائے ۔";

    if (day == 1) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "مبارک ہو!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            Text(
              text_day_1,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
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
              "ماں کا دودھ بچے کے لیے سب سے قیمتی اور مکمل غذا ہے۔ یہ نہ صرف بچے کی جسمانی نشوونما کے لیے بہترین ہے بلکہ اس کی قوت مدافعت کو بھی مضبوط کرتا ہے۔",
              "تحقیق سے ثابت ہوا ہے کہ وہ بچے جو لمبے عرصے تک ماں کا دودھ پیتے ہیں، وہ ذہین ہوتے ہیں اور اسکول میں اچھی کارکردگی کا مظاہرہ کرتے ہیں۔",
              "فارمولہ دودھ ماں کے دودھ کا متبادل نہیں ہو سکتا، اور اس کے غیر ضروری استعمال سے بچے کی صحت متاثر ہو سکتی ہے۔",
              "اگر آپ کو لگتا ہے کہ آپ کا دودھ کافی نہیں ہے، تو پہلے کسی ڈاکٹر سے مشورہ کریں۔ زیادہ تر ماؤں کا دودھ بچے کی ضروریات کے لیے کافی ہوتا ہے۔",
              "صرف خاص طبی حالات میں ہی فارمولہ دودھ استعمال کریں، جب ڈاکٹر تجویز کرے۔ ماں کا دودھ آپ کے بچے کے لیے محبت اور صحت کا انمول تحفہ ہے۔"
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
              "اگر ماں لمبے عرصے تک اپنا دودھ پلاتی ہیں تو چھاتی (breast) اور انڈے دانی (ovary) کا کینسر، ٹائپ 2 Diabetes، اور Blood Pressure کی بیماری کا امکان کم ہو جاتا ہے۔",
              "دودھ پلانے سے ماؤں کو وزن کم کرنے میں مدد ملتی ہے۔",
              "اگر ورزش بھی ساتھ کی جائے تو ماں اپنے جسم کو دوبارہ معمول پر لا سکتی ہے۔"
            ]),
          ],
        ),
      );
    } else if (day == 5) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text_day_5,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 20),
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
              "اپنے بچے کو بوتل یا پیسفائر یعنی بچوں کی چوسنی نہ دیں۔",
              "بوتل یا پیسفائر کی صفائی مشکل ہوتی ہے اور یہ بچوں میں دست کا باعث بن سکتی ہے۔",
              "پیسفائر کا لمبے عرصے تک استعمال دانتوں اور مسوڑھوں کی ساخت کو نقصان پہنچا سکتا ہے اور بچے کی دودھ پینے کی عادت کو متاثر کر سکتا ہے۔",
              "اگر کبھی ضرورت پڑے تو اپنے بچے کو کپ کے ذریعے دودھ پلائیں، یہ زیادہ محفوظ اور صاف ستھرا طریقہ ہے۔",
              "پچھلے پیغام کی ویڈیو میں آپ کو کپ سے بچے کو ماں کا دودھ پلانے کا طریقہ بتایا گیا ہے۔ اس ویڈیو کو بار بار دیکھیں تاکہ آپ اپنے بچے کو کپ سے دودھ پلا سکیں۔"
            ]),
            const SizedBox(height: 20),
            // Video will automatically show here for day 5
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
}
