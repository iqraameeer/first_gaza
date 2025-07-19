import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek40DetailScreen extends StatelessWidget {
  final int selectedDay;

  ChildWeek40DetailScreen({
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
                                    ? "بچے کی  زبان سیکھنے اور سمجھنے کی صلاحیت"
                                    : selectedDay == 5
                                        ? " بچے کی جذباتی اور  سماجی نشونما"
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

  Widget _buildContentForSelectedDay(int day) {
    if (day == 1) {
      return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "آپ کا بچہ اب چلنے کی کوشش کر رہا ہے ۔",
              "آپ کا بچہ اب اپنی انگلیوں اور انگوٹھے کا استعمال کرکے چیزوں کو پکڑ سکتا ہے۔",
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
              "اپنے بچے کی مدد کریں اور اسے محفوظ ماحول دیں تاکہ وہ اپنی نئی مہارت کو آزمائے۔",
              "اپنے بچے کی مدد کریں اور اسے محفوظ ماحول دیں تاکہ وہ اپنی نئی مہارت کو آزمائے۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_40_1.png',
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            BulletList(items: [
              "آپ کا بچہ اب ایاسے مختلف قسم کے چھوٹے، محفوظ کھلونے دیں تاکہ وہ ان کو پکڑنے اور سمجھنے کی مشق کر سکے۔",
              'آپ کا بچہ اب ایک بامعنی لفظ بولنے لگا ہے، جیسے "ماں" یا "بابا"۔',
              " آپ کا بچہ اب اپنے قریبی افراد، جیسے دادا، دادی یا خالہ کے نام پہچاننے لگا ہے ۔",
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
              "جب بچہ کوئی نیا لفظ بولے تو خوشی کا اظہار کریں اور اس سے مزید بات چیت کریں تاکہ وہ زیادہ سیکھ سکے۔",
              'بچہ کا گھر کے دوسرے افراد کے ساتھ وقت گزارنا اس کے لیے فائدہ مند ہوگا۔',
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_40_2.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
          ]));
    } else if (day == 5) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "آپ کا بچہ آپ کے ساتھ کھیلنے سے بہت لطف اندوز ہوتا ہے۔",
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
              "اس کے ساتھ کھیل کے لمحات کو انجوائے کریں، جیسے چھپا چھپی یا کوئی آسان کھیل، کیونکہ یہ آپ کے رشتے کو مضبوط بناتے ہیں اور بچے کی سماجی اور جذباتی نشوونما کو بہتر کرتے ہیں۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_40_3.png',
                fit: BoxFit.cover,
              ),
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
