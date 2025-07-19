import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek37DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek37DetailScreen({
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
                                ? "بمبارک ہو،  آپ کا بچہ 9 ماہ کے سنگ میل(milestone) کو پہنچ گیا ہے!\nبچے کی دیکھ بھال سے متعلق رہنمائی"
                                : selectedDay == 3
                                    ? "  بچے کی دیکھ بھال سے متعلق رہنمائی \nوہ کام جو  ہرگز نہ کریں(Don’ts):"
                                    : selectedDay == 5
                                        ? "نویں مہینےکی ویکسینیشن کے بارے میں یاد دہانی !"
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
              "ماشاءاللہ !آپ کا بچہ دسویں مہینے میں داخل ہو چکا ہے ۔امید ہے کہ آپ اسے ماں کا دودھ پلا رہی ہوں گی۔ وہ نئی چیزیں سیکھ رہا ہے اور تیزی سے بڑھ رہا ہے",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
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
              " بچے کو ہمیشہ  اپنی نظروں کے سامنے رکھیں ، خاص طور پر جب وہ کھیل رہا ہو یا کھا رہا ہو۔",
              "ہر مہینے وزن اور قد چیک کروائیں تاکہ اس کی نشوونما کی جانچ ہو سکے۔",
              "دانت نکلنے کے دوران اس کے مسوڑھے صاف کریں تاکہ کوئی انفیکشن نہ ہو۔",
              "محفوظ اور صاف ستھرا ماحول فراہم کریں۔",
            ]),
          ],
        ),
      );
    } else if (day == 3) {
      return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            WrongmarkList(items: [
              " بچے  کو چھوٹے کھلونے یا چیزیں سے دور رکھیں جو وہ آسانی سے منہ میں ڈال کر نگل سکتا ہے ۔",
              " اونچائی  یا پانی کے قریب اکیلا  مت چھوڑیں۔",
              "اسکرین (ٹی وی یا موبائل) کے سامنے زیادہ وقت نہ دیں۔  یہ اس کی نشوونما کو متاثر کر سکتا ہے۔",
            ]),
          ]));
    } else if (day == 5) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "امید کرتے ہیں کہ آج کا دن آپ کے بچے کے لیے خوبصورت ہو۔ آپ کے ننھے منے  بچے کا اگلا حفاظتی  ٹیکہ نو مہینےکی عمر میں لگنا ہے۔ آپ بچے کو اپنا دودھ ویکسینیشن سے 30 منٹ پہلے یا بعد میں پلا سکتی ہیں۔  ویکسینیشن کے بعد کوشش کریں کہ اپنا دودھ زیادہ بار پلائیں۔ اس سے بچے کو سکون ملے گا، پانی کی کمی نہیں ہوگی، اور بچے کی قوتِ مدافعت بہتر ہوگی۔ ",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
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
              "بچے کی صحت کے لیے حفاظتی ٹیکوں کا کورس مکمل کرنا بہت ضروری ہے۔",
              "ویکسین کے بعد کچھ بچوں کو ہلکا بخار، چڑچڑاپن، یا انجکشن کی جگہ پر سوجن ہو سکتی ہے، جو عام بات ہے۔",
              "نویں مہینے کا ویکسین آپ کے بچے کو مندرجہ ذیل خطرناک بیماریوں سے\n بچاتا ہے:خسرہ، ممپس، روبیلا، ٹائیفائیڈ اور پولیو",
            ]),
            BulletList(items: [
              "خسرہ، ممپس، روبیلا، ٹائیفائیڈ اور پولیو",
            ]),
            BulletList(items: [
              "اپنے بچے کو حفاظتی ٹیکوں کے شیڈول کی مقررہ تاریخ پر اپنے ہسپتال کے ویکسینیشن سینٹر لے کر آئیں۔",
              "ویکسینیشن والے دن آپ کے بچے کے وزن اور قد کی پیمائش بھی   کی جاتی ہیں تاکہ معلوم ہو سکے کہ آپ کا بچہ اپنی عمر کے مطابق بڑھ رہا ہے۔اس لیے بہت ضروری ہے کہ آپ بچے کو ویکسینیشن سینٹر میں لے کر آئیں ۔",
              "اگر کسی مصروفیت کی وجہ سے آپ مقررہ تاریخ پر نہیں آ سکتے تو ہمیں ضرور مطلع کریں۔",
              "ہم آپ کو جلد از جلد آپ کی سہولت کے مطابق نئی اپوائنٹمنٹ کی تاریخ دے دیں گے۔",
              "یاد رہے کہ ہم آپ کی مدد اور رہنمائی کے لیے ہر  مقررہ تاریخ پر ویکسینیشن سینٹر میں موجود ہیں جہاں ہم آپ کے سوالات کا تسلی بخش جواب دیں گے۔",
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
