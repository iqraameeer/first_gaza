import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek28DetailScreen extends StatelessWidget {
  final int selectedDay;

  ChildWeek28DetailScreen({
    Key? key,
    required this.selectedDay,
  }) : super(key: key);

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
                          padding: const EdgeInsets.only(right: 10.0, top: 10),
                          child: Text(
                            selectedDay == 1
                                ? "بچے کی جسمانی نشونما"
                                : selectedDay == 3
                                    ? "بچے کی  زبان سیکھنے کی صلاحیت"
                                    : selectedDay == 5
                                        ? "بچے کی ذہنی ، جذباتی اور  سماجی نشونما"
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
                const SizedBox(height: 10), // Adding space after the AppBar
                Expanded(
                  child: SingleChildScrollView(
                    child: _buildContentForSelectedDay(selectedDay),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  // Function to build content based on selected week and day
  Widget _buildContentForSelectedDay(int day) {
    if (day == 1) {
      return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              'آپ کا بچہ اب کوشش کر رہا ہے کہ خود سے بیٹھنے کی صلاحیت حاصل کرے۔',
              'وہ اب اپنی انگلیوں اور انگوٹھے کی مدد سے چیزیں پکڑنے کی کوشش کر رہا ہے۔ ',
              'یہ اس کی عمدہ موٹر مہارتوں کی نشوونما کا حصہ ہے۔'
            ]),
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
              'اپنے بچے کی حوصلہ افزائی کریں اور اسے محفوظ جگہ پر بیٹھنے میں مدد کریں ۔',
              'اسے محفوظ اور رنگ برنگے کھلونے دیں تاکہ وہ ان کے ساتھ کھیل کر اپنی صلاحیتیں مزید بہتر بنا سکے۔',
              'اس کے لئے آپ کا ساتھ بہت اہم ہے۔',
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_28_91.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    } else if (day == 3) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              'آپ کا بچہ آپ کے پکارنے پر ردعمل دینا شروع کر رہا ہے۔ ',
              'یہ اس بات کا اشارہ ہے کہ وہ اپنی زبان کی مہارت کو بہتر بنا رہا ہے۔ '
            ]),
            Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              'بچے سے بات کریں، اس کا نام پکاریں، اور دیکھیں کہ وہ کیسے خوشی سے جواب دیتا ہے۔',
              ' آپ کا یہ وقت دینا اس کی زبان کی نشوونما میں بہت مددگار ہوگا۔'
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_28_92.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    } else if (day == 5) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "آپ کا بچہ اب ایک وقت میں ایک کھلونے یا چیز کے ساتھ کھیلنے کی عادت ڈال رہا ہے۔ ",
              "یہ اس کی توجہ اور ذہنی نشوونما کے لیے اہم ہے۔ ",
              "وہ آپ کے بازو بڑھانے پر اپنے بازو اٹھا کر آپ کے قریب آنے کی کوشش کرتا ہے۔ ",
              "یہ اس کے جذباتی تعلق اور آپ کے ساتھ محبت بھرے رشتے کی نشوونما کی نشانی ہے۔"
            ]),
            SizedBox(
              height: 10,
            ),
            Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              "اسے مختلف قسم کے محفوظ کھلونے فراہم کریں اور اس کے ساتھ وقت گزاریں تاکہ وہ مزید دریافت کر سکے۔",
              "بچے کو گلے لگائیں، پیار کریں، اور اس لمحے کا بھرپور لطف اٹھائیں۔"
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_28_93.png',
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

  Widget _buildTickmarkList(List<String> items) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: items.map((item) {
          // Split at first colon to separate the keyword from the rest of the text
          List<String> parts = item.split(':');
          String keyword = parts.first; // First part (keyword)
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

  Widget _buildWrongmarkList(List<String> items) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: items.map((item) {
          // Split at first colon to separate the keyword from the rest of the text
          List<String> parts = item.split(':');
          String keyword = parts.first; // First part (keyword)
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
                const Icon(Icons.close,
                    size: 20, color: Colors.red), // Tickmark
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
