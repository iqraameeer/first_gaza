import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek15DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek15DetailScreen({
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
                                ? "ماں کے  دودھ  کو   اسٹور کرنے کا طریقہ"
                                : selectedDay == 3
                                    ? "ماں کے  اسٹورڈ دودھ کو پگھلانے (defrost)کا طریقہ"
                                    : selectedDay == 5
                                        ? "ماں کے دودھ کو  پگھلانے کے بعد  پلانے کی تیاری"
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
    String text_day_1 = "مسئلہ: بچے کا ماں کا دودھ پینے سے انکار";

    String text_day_5 =
        "اگر اس کا علاج نہ کیا جائے تو چھاتیوں کی سوجن کا خطرہ پیدا ہو جاتا ہے ۔";

    if (day == 1) {
      return const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'ماں ہونا آسان نہیں، خاص طور پر کام کے دوران، لیکن ہم آپ کی حوصلہ افزائی کرتے ہیں کہ آپ اپنا دودھ پلانے کو جاری رکھنا چاہتی ہیں۔ اس ہفتے ہم آپ کو اس بارے میں بہتر رہنمائی اور معلومات فراہم کریں گے۔\n\n'
              'مائیں اپنے ہاتھ یا پمپ سے دودھ نکال کر اسے محفوظ طریقے سے اسٹور کر سکتی ہیں۔ دودھ کو رکھنے کے لیے مضبوط ڈھکن والے شیشے یا پلاسٹک سے بنے برتن استعمال کریں۔ تازہ نکالا ہوا دودھ مندرجہ ذیل عرصے تک محفوظ رکھاجا سکتا ہے:',
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              "کمرے کے درجہ حرارت 25°C یا اس سے کم پر 4 گھنٹے تک۔",
              "فریج میں 4 دن تک۔",
              "فریزر میں تقریباً 6 ماہ تک۔",
            ]),
          ],
        ),
      );
    } else if (day == 3) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'پ کا کام اور ماں ہونے کی ذمہ داری دونوں اہم ہیں، اور ہم جانتے ہیں کہ آپ اپنے بچے کی بہترین دیکھ بھال کرنا چاہتی ہیں۔ کام کی جگہ پر دودھ پلانے کا منصوبہ بنانا آپ کے بچے کی صحت کے لیے بہت اہم ہے۔آپ کی رہنمائی کے لئے ہم آج ماں کے اسٹورڈ  expressed  دودھ کو پگھلانے کا صحیح اور محفوظ طریقہ بتاتے ہیں۔ ',
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              "ماں کے فریزر میں جمے ہوئے دودھ کے برتن کو تاریخ کے ساتھ واضح لیبل لگائیں۔",
              "ہمیشہ سب سے پہلے سب سے پرانا expressed دودھ پگھلائیں۔",
              "آپ expressed دودھ کے برتن کو رات بھر فریج میں، گرم یا نیم گرم پانی کے پیالے میں، یا نیم گرم بہتے ہوئے پانی کے نیچے رکھ کر پگھلا سکتے ہیں۔",
              "کبھی بھی ماں کے دودھ کو microwave یا چولہے پر نہ پگھلائیں یا گرم کریں۔",
              "اگر آپ فریج میں expressed دودھ کو پگھلاتے ہیں، تو اسے 24 گھنٹوں کے اندر استعمال کریں۔",
              "ایک بار جب expressed دودھ کمرے کے درجہ حرارت پر آ جائے، تو اسے 2 گھنٹوں کے اندر استعمال کریں۔",
              "کبھی بھی expressed دودھ کو پگھلانے کے بعد دوبارہ نہ جمائیں۔",
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
            Text(
              'ماں کے دودھ کو گرم کرنے کی ضرورت نہیں  ہوتی ہیں۔ یہ کمرے کے درجہ حرارت پر  دیا جا سکتا ہے ۔ اگر آپ ماں کے دودھ کو گرم کرنے کا ارادہ رکھتے ہیں، تو مندرجہ ذیل نکات کا دھیان رکھے:۔ ',
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              "سیل کیے ہوئے برتن کو گرم پانی کے پیالے میں رکھیں یا چند منٹ تک نیم گرم بہتے ہوئے پانی کے نیچے رکھیں۔",
              "ماں کے دودھ کو چولہے یا microwave میں گرم ہرگز نہ کریں۔",
              "بچے کو دودھ پلانے سے پہلے، دودھ کے سیل کیے ہوئے برتن کو گھما کر مکس کریں تاکہ چکنائی جو الگ ہو گئی ہو، وہ مل جائے۔",
              "دودھ پلانے سے پہلے چند قطرے اپنی کلائی پر ڈال کر اس کا درجہ حرارت چیک کریں۔",
              "ہمیشہ کپ کے ذریعے بچے کو دودھ پلائیں۔",
              "دودھ پلانے سے پہلے کپ اور اپنے ہاتھ دھوئیں۔",
              "بچے کو کپ کے ذریعے دودھ پلانے کا طریقہ آپ نے پچھلے پیغام کی ویڈیو میں سیکھا ہے۔ اس ویڈیو کو دوبارہ دیکھیں تاکہ آپ بچے کو صحیح سے کپ سے دودھ پلا سکیں۔",
              "اگر آپ کا بچہ دودھ ختم نہیں کرتا، تو بچا ہوا دودھ 2 گھنٹوں کے اندر استعمال کریں۔",
              "2 گھنٹوں کے بعد بچا ہوا ماں کا دودھ ضائع کر دیں۔",
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
