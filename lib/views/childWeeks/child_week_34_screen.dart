import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek34DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek34DetailScreen({
    Key? key,
    //required this.selectedWeek,
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
                                ? "بچے کی ناک صاف رکھے!"
                                : selectedDay == 3
                                    ? "بچے کو سگریٹ کے دھوئیں سے محفوظ رکھے !"
                                    : selectedDay == 5
                                        ? "بچے کو ملیریا سے محفوظ رکھے !"
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

  // Function to build content based on selected week and day
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
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              "آپ کے بچے کی ذاتی صفائی اور آرام کے لیے بہت اہم ہے کہ آپ باقاعدگی سے اپنے بچے کی ناک صاف رکھیں تاکہ بچہ دودھ پینے کے دوران بہتر سانس لے سکے ۔",
            ]),
          ],
        ),
      );
    } else if (day == 3) {
      return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              "آپ کی صحت اور آپ کے بچے کی خوشحالی ہمارے لیے بہت اہم ہیں ۔ سگریٹ نوشی نہ صرف آپ کے لیے بلکہ آپ کے بچے کے لیے بھی نقصان دہ ہو سکتی ہے، خاص طور پر اگر یہ آپ کے بچے کے قریب ہو۔",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "بچوں پر سگریٹ کے دھوئیں کے اثرات:",
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
              "سگریٹ کے دھوئیں سے بچوں میں سانس کی بیماریاں جیسے دمہ، برونکائٹس اور نمونیا کا خطرہ بڑھ جاتا ہے۔",
              "دھواں بچے کے مدافعتی نظام کو کمزور کر دیتا ہے، جس سے وہ بار بار بیمار ہو سکتے ہیں۔",
              "دھوئیں کے قریب رہنے سے بچوں میں کان اور گلے کے انفیکشنز زیادہ ہو سکتے ہیں۔",
              "مستقل دھوئیں کا سامنا بچوں کی صحت پر منفی اثر ڈال سکتا ہے، جیسا کہ دل کی بیماریاں اور سانس کی مشکلات۔",
            ]),
            SizedBox(
              height: 10,
            ),
            Text(
              "کرنے والے کام (Do’s):",
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
            TickmarkList(
              items: [
                "سگریٹ نوشی نہ کریں۔"
                    "بچے کے کمرے، گھر یا گاڑی میں سگریٹ نہ پئیں ۔",
                "کبھی بھی بچے کے قریب دھواں نہ کریں۔",
                "اپنے بچے کو ایسے ماحول میں رکھیں جہاں تازہ ہوا اور صاف ماحول ہو۔",
              ],
            ),
          ]));
    } else if (day == 5) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "ملیریا مچھروں کے کاٹنے سے پھیلتا ہے اور بچوں کے لیے یہ بہت نقصان دہ ہے۔  آپ کی توجہ سے آپ کا بچہ محفوظ اور صحت مند رہے گا۔",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            Text(
              "ملیریا سے محفوظ رکھنے کے اقدامات:",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            Text(
              "کرنے والے کام (Do’s):",
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
            TickmarkList(items: [
              "ہمیشہ سونے کے دوران بچے کے لیے مچھر دانی استعمال کریں، خاص طور پر شام اور رات کے وقت_",
              "کھڑکیوں اور دروازوں پر جالی لگوائیں۔",
              "مچھر بھگانے والے لوشنز یا اسپرے استعمال کریں، لیکن بچوں کی جلد پر براہ راست نہ لگائیں۔",
              "بچے کو شام اور رات کے وقت ایسے کپڑے پہنائیں جو پورے جسم کو ڈھانپیں۔",
              "اگر بچے کو تیز بخار، کپکپی، یا کمزوری محسوس ہو تو فوراً ڈاکٹر سے رجوع کریں۔",
              "گھر کے ارد گرد پانی کھڑا نہ ہونے دیں کیونکہ یہ مچھروں کی افزائش کی جگہ بن سکتا ہے۔",
              "شام کے وقت دروازے اور کھڑکیاں بند رکھیں۔",
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
