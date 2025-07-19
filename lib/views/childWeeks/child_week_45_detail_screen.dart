import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek45DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek45DetailScreen({
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
                                ? "مبارک  ہو،  آپ کا بچہ 11ماہ کے سنگ میل(milestone) کو پہنچ گیا ہے!\n بچے کی  غذا کے متعلق رہنمائی "
                                : selectedDay == 3
                                    ? 'بچے کی غذائیت کے لیے "Eat the Rainbow" کا اصول اپنائیں'
                                    : selectedDay == 5
                                        ? "بچے کو  خود سے کھانا سکھائیں"
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
              " ماشاءاللہ !آپ کا بچہ بارھویں مہینے میں داخل ہو چکا ہے یہ ایک اہم سنگ میل ہے۔  آپ کی محبت اور محنت کی بدولت، آپ کا بچہ صحت مند نشوونما کی طرف گامزن ہے۔",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
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
            TickmarkList(items: [
              'بچے کو ماں کا دودھ پلانا جاری رکھیں۔ ',
              'کوشش کریں کہ دو سال تک بچے کو ماں کا دودھ پلائیں۔',
              'بچے کو مختلف غذائی گروپوں سے متوازن غذا دیں جیسے اناج، سبزیاں، پھل، دالیں اور پروٹین کے ذرائع۔',
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
              "غذائی کمی سے بچے کی جسمانی اور ذہنی نشوونما شدید متاثر ہوتی ہے۔",
              "ایسے بچے بیماریوں کا زیادہ شکار ہو تے ہیں اور ان کا مدافعتی نظام کمزور ہو تا ہے۔",
            ]),
          ],
        ),
      );
    } else if (day == 3) {
      return Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            BulletList(items: [
              'آپ بچے کو مختلف رنگوں والی غذائیں شامل کر کے تمام ضروری غذائی اجزاء فراہم کر سکتی ہیں۔',
              'اسے "Eat the Rainbow" کا اصول کہتے ہیں۔',
              'مثال کے طور پر:',
            ]),
            SizedBox(
              height: 10,
            ),
            RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  WidgetSpan(
                      child: Icon(Icons.check, color: Colors.green, size: 20)),
                  TextSpan(
                    text: ' سبز: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  TextSpan(text: 'سبز پتیاں، پالک۔\n'),
                  WidgetSpan(
                      child: Icon(Icons.check, color: Colors.orange, size: 20)),
                  TextSpan(
                    text: ' نارنجی: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                  TextSpan(text: 'میٹھے آلو، گاجر۔\n'),
                  WidgetSpan(
                      child: Icon(Icons.check, color: Colors.yellow, size: 20)),
                  TextSpan(
                    text: ' پیلا: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.yellow[700]),
                  ),
                  TextSpan(text: 'کیلا یا انناس۔\n'),
                  WidgetSpan(
                      child: Icon(Icons.check, color: Colors.purple, size: 20)),
                  TextSpan(
                    text: ' جامنی: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                  TextSpan(text: 'بینگن، یا ارغوانی پیاز۔\n'),
                  WidgetSpan(
                      child: Icon(Icons.check, color: Colors.red, size: 20)),
                  TextSpan(
                    text: ' سرخ: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  TextSpan(text: 'ٹماٹر، سرخ سیب یا شملہ مرچ، اسٹرابیریز۔\n'),
                ],
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/week_45.png",
              ),
            ),
          ]));
    } else if (day == 5) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
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
              "بچے کو ایسے کھانے  دیں جو پکڑنے میں آسان ہوں۔",
              "بچے کو نرم اور چھوٹے حصوں میں کٹے پھل، سبزیاں یا بریڈ جیسے finger foods دیں۔",
              "بچے کو خود کھانے دیں۔",
              "بچے کو کھانے کے لیے وقت دیں اور ان پر زور نہ دیں۔",
              " زیادہ  روک ٹوک نہ کریں ۔",
              "بچے کو  زیادہ کھانے پر مجبور نہ کریں۔",
              "بچے کے ساتھ کھائیں تاکہ وہ آپ کے رویے کو دیکھ کر سیکھ سکے۔",
              "بچے  کی کوششوں کی تعریف کریں، چاہے وہ کھانے کے دوران گندگی کریں۔",
              "کھانے کے دوران ہمیشہ بچے کو  نگرانی میں رکھیں تاکہ  کھانے کے سانس کی نالی کے خطرے سے بچا جا سکے۔",
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
