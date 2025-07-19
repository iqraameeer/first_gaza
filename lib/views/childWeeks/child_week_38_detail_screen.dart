import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import 'package:pehli_gaza_app/widget/text_bullet_widget.dart';

class ChildWeek38DetailScreen extends StatefulWidget {
  final int selectedDay;

  const ChildWeek38DetailScreen({
    Key? key,
    required this.selectedDay,
  }) : super(key: key);

  @override
  _ChildWeek38DetailScreenState createState() =>
      _ChildWeek38DetailScreenState();
}

class _ChildWeek38DetailScreenState extends State<ChildWeek38DetailScreen> {
  // final String videoURL =
  //     "https://www.youtube.com/embed/dQw4w9WgXcQ?rel=0&controls=1&modestbranding=1&fs=0&showinfo=0";
  // late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    // Initialize WebView controller
    // _webViewController = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(Colors.transparent)
    //   ..setNavigationDelegate(NavigationDelegate(
    //     onPageFinished: (String url) {
    //       _webViewController.runJavaScript(
    //         """
    //         document.querySelector('iframe').style.borderRadius = '10px';
    //         document.body.style.margin = '0';
    //         document.body.style.padding = '0';
    //         document.body.style.backgroundColor = 'transparent';
    //         """,
    //       );
    //     },
    //     onWebResourceError: (error) {
    //       debugPrint("WebView Error: ${error.description}");
    //     },
    //     onNavigationRequest: (NavigationRequest request) {
    //       // Block navigation to any URL outside the embedded video
    //       if (!request.url.contains('youtube.com/embed')) {
    //         return NavigationDecision.prevent;
    //       }
    //       return NavigationDecision.navigate;
    //     },
    //   ))
    //   ..loadRequest(Uri.parse(videoURL));
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
                                  ? "بچے کی غذا سے متعلق رہنمائی"
                                  : widget.selectedDay == 3
                                      ? "کیا بچے کو ڈبے کا جوس  دینا چاہیے؟"
                                      : widget.selectedDay == 5
                                          ? "بچے  کو میٹھے کھانے یا اشیاء دینے کے کیا نقصانات ہیں؟"
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
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const BulletList(items: [
              " بچے کے کھانے میں مختلف فوڈ گروپس شامل کریں تاکہ وہ تمام ضروری غذائیت حاصل کرے۔",
              "آئیں،  اس چھوٹی سی ویڈیو میں ہم ماہر ڈاکٹر سے بچے کی اچھی غذا کے بارے میں مزید معلومات حاصل کرتے ہیں۔",
            ]),
            const SizedBox(height: 10),
            // Container(
            //   height: 220,
            //   margin: const EdgeInsets.symmetric(horizontal: 10),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.2),
            //         spreadRadius: 1,
            //         blurRadius: 5,
            //         offset: const Offset(0, 3),
            //       ),
            //     ],
            //   ),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(10),
            //     child: WebViewWidget(
            //       controller: _webViewController,
            //     ),
            //   ),
            // ),
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
              "ڈبے کے جوس میں زیادہ چینی ہوتی ہے، جو بچوں کے لئے  ذیابیطس کی بیماری کا سبب بن سکتی  ہیں ۔",
              " ڈبے کے جوس میں مختلف preservatives شامل ہوتے ہیں، جو  بچے  کی صحت پر منفی اثر ڈال سکتے ہیں۔",
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
            BulletList(items: [
              "یہ بچے کے دانتوں میں کیڑا لگنے اور مسوڑھوں کے مسائل پیدا کرتے ہیں۔",
              "بچے کی کھانے کی بھوک کو کم کر دیتی ہے ۔",
              "موٹاپا، ذیابیطس اور دل کی بیماری کا سبب بن سکتے ہیں۔",
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
              "بچے کی صحت کے لیے ضروری ہے کہ اسے پھل، سبزیاں اور گھر کا پکا ہوا کھانا دیں۔",
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
