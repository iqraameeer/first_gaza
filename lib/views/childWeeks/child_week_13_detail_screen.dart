import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek13DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek13DetailScreen({
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
                                ? "آپ کا بچہ 3 ماہ کے سنگ میل (Milestone) کو پہنچ گیا ہے!\n"
                                    "دانت نکلنے کے بارے میں معلومات"
                                : selectedDay == 3
                                    ? "کام کرنے والی ماؤں  کے لیے     breastfeeding  جاری رکھنے کے بارے میں  چند تجاویز"
                                    : selectedDay == 5
                                        ? "ہاتھ  یا پمپ کی مدد سے چھاتی سے  ماں کا اپنا دودھ نکالنا"
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
              'مبارک ہو! آپ کا پیارا بچہ تین ماہ کا ہو گیا ہے۔ یہ ایک شاندار سنگ میل ہے اور اس سفر میں آپ کی محنت قابل تعریف ہے۔یہ سب آپ کی محبت کا نتیجہ ہے۔ ',
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            Text(
              'یاد رکھیں!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "بچے کو چھ ماہ کی عمر تک صرف اور صرف ماں کا دودھ پلائیں اور بچے کی طلب پر دودھ فراہم کریں۔",
              "چار سے سات ماہ کی عمر کے درمیان بچوں کے دانت نکلنا شروع ہو جاتے ہیں۔",
              "اس دوران بچے زیادہ رال ٹپکاتے ہیں اور چیزوں کو چبانے کی کوشش کرتے ہیں۔",
              "کچھ بچے اس دوران چڑچڑے ہو جاتے ہیں، ان کا کھانے اور سونے کا معمول خراب ہو سکتا ہے، اور کبھی کبھی ہلکا بخار بھی ہو سکتا ہے۔",
              "اپنے بچے کے مسوڑھے باقاعدگی سے صاف انگلی یا نرم اور صاف کپڑے سے صاف کریں۔ یہ گلے کے انفیکشن سے بچاتا ہے اور مسوڑھے اور دانتوں کو مضبوط بناتا ہے۔",
              "چوسنی )پيسيفائر( کے استعمال سے بچیں کیونکہ چوسنی کو زیادہ دیر تک بچے کے منہ میں رکھنے سے بچے کے دانتوں کی ترتیب اور منہ کی ساخت پر منفی اثرات پڑتے ہیں۔",
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
              'ماں ہونا ایک خوبصورت ذمہ داری ہے، اور کام کے دوران بچے کو دودھ پلانا آپ کے بچے کے لیے محبت اور غذائیت کا سب سے بہترین تحفہ ہے۔ آپ یہ کر سکتی ہیں! ہم آپ کی رہنمائی کے لئے موجود ہیں۔ ',
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            Text(
              'یاد رکھیں!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "مائیں اپنے بچے کے لیے ہاتھ یا پمپ کی مدد سے چھاتی سے دودھ نکالنے کی منصوبہ بندی کریں۔",
              "دن کے اوقات میں اپنا دودھ نکالنے کا شیڈول مرتب کریں۔",
              "دودھ نکالنے کے لیے کام کے دوران مختصر وقفے لیں اور اسے محفوظ رکھنے کے لیے فریج کا استعمال کریں۔",
              "کام کی جگہ دودھ پلانے کے لیے ایک پرائیویٹ جگہ یا رُوم کی درخواست کریں۔",
              "کام کی جگہ پر ایسے ساتھیوں سے رابطہ کریں جو ماں بننے کے تجربے سے گزر چکی ہوں۔خاندان کے افراد یا قریبی دوستوں سے مدد طلب کریں۔",
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
              'اگر  ماں زیادہ عرصے کے لیے بچے سے دور  جانے کا ارادہ  رکھتی ہے تو وہ کم سے کم ہر 3 گھنٹے بعد  ہاتھ  یا پمپ کی مدد سے چھاتی سے اپنا دودھ نکالے جو بچے کی ضرورت کے مطابق ہو۔ ',
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'یاد رکھیں!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            TickmarkList(items: [
              'دودھ کی اچھی پیداوار کے لئے ضروری ہے کہ مائیں آٹھ سے دس گلاس روزانہ پانی پئیں ۔ بچے کو دودھ پلانے کے دوران بھی پانی پئیں۔اپنی خوراک اور نیند پر توجہ دیں ۔',
              'اگر  ماں کم مرتبہ  اپنا دودھ نکالے گی یا  دودھ نکالنے میں زیادہ وقفہ رکھے گی تو زیادہ دودھ پیدا نہیں  کر سکے گی ۔ اس کے علاوہ چھاتیوں میں دودھ بھر جانے کی وجہ سے تکلیف اور بخار کا بھی مسئلہ ہو سکتا ہے۔'
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
