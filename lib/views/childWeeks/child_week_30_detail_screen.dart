import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import 'package:pehli_gaza_app/widget/text_bullet_widget.dart';

class ChildWeek30DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek30DetailScreen({
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
                                ? "میرا بچہ کھانے سے کھیلتا زیادہ ہے اور کھاتا کم ہے ۔ کیا یہ پریشان ہونے کی بات ہے؟"
                                : selectedDay == 3
                                    ? "بچے کی نشونما میں کھانے سے کھیلنے کی کیا اہمیت ہے؟"
                                    : selectedDay == 5
                                        ? "بچے کو فنگر فوڈز کھلانے کے کیا فائدے ہیں؟"
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
              "یہ عام طور پر پریشانی کی بات نہیں ہے کیونکہ سات ماہ میں بچے اپنے ہاتھوں اور انگلیوں سے کھانے کو پکڑنے اور منہ میں ڈالنے کی کوشش شروع کر دیتے ہیں۔ یہ کھیلنا نشوونما کا ایک فطری حصہ ہے۔",
              style: TextStyle(
                  fontSize: 20,
                  // color: Colors.red,
                  // fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
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
            TickmarkList(items: [
              "انہیں خود سے کھانا کھانے کی کوشش کرنے دیں۔",
              "البتہ، یہ یقینی بنانا ضروری ہے کہ بچہ مناسب مقدار میں غذائی اجزاء حاصل کر رہا ہے۔",
              "اگر آپ کو یہ محسوس ہو کہ بچے کا وزن نہیں بڑھ رہا ہے تو ڈاکٹر سے مشورہ لیں۔",
            ])
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
              'بچے کی نشونما میں کھانے سے کھیلنے کا عمل بہت اہم ہے۔ یہ عمل بچے کے لئے:',
              style: TextStyle(
                  fontSize: 20,
                  // color: Colors.red,
                  // fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "مختلف غذاؤں کی بناوٹوں، اور رنگوں سے متعارف کرواتا ہے ، جس سے بچے کی چھونے، چکھنے اور دیکھنے کی صلاحیت    (sensory skills)کی  نشونما ہوتی ہے۔",
              "کھانے کو پکڑنے اور منہ تک لانے سے بچے کی ہاتھ اور آنکھ کی ہم آہنگی میں بہتری آتی ہے۔",
              "بچے کو خود سے کھانے کی عادت ڈالتی ہے ۔"
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
              "نرم روٹی یا چپاتی کے چھوٹے ٹکڑے۔",
              "اچھی طرح پکا ہوا pasta یا چاول۔",
              "بغیر ہڈی کے نرم پکا ہوا مرغی کا گوشت۔",
              "نرم اسکرامبلڈ انڈے یا آملیٹ کی پتلی سلائسز۔",
              "نرم پنیر یا پینیر کے چھوٹے ٹکڑے۔",
              "بھاپ یا ابلی ہوئی سبزیاں جیسے گاجر، میٹھے آلو، یا گوبھی کے پھول۔",
              "نرم پھل جیسے کیلا، پکے ہوئے یا بھاپ میں پکائے ہوئے سیب کے ٹکڑے۔"
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
              "کھانے کو چھوٹے اور آسان ٹکڑوں میں تقسیم کریں تاکہ بچہ آسانی سے پکڑ سکے۔",
              "بچے کی دلچسپی برقرار رکھنے کے لیے کھانے کی اشیاء کی مختلف ساخت اور ذائقے پیش کریں۔"
            ])
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
