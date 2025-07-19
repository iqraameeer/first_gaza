import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek22DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek22DetailScreen({
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
                                ? "بچوں کے دانت کب نکلتے ہیں؟"
                                : selectedDay == 3
                                    ? "بچوں کے دانت نکلنے کی علامات"
                                    : selectedDay == 5
                                        ? "بچوں کے دانت نکلنے کے مرحلے کے بارے  میں ہدایات"
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
            BulletList(items: [
              'تقریباً 5 سے 7 ماہ میں بچوں کے نیچے والے سامنے کے دانت نکلنا شروع ہوتے ہیں۔',
              'جبکہ اوپر والے سامنے کے دانت تقریباً 6سے 8 ماہ میں نکلتے ہیں۔',
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
            SizedBox(
              height: 10,
            ),
            Text(
              "بچوں کے دانت کبھی کبھی بغیر کسی درد یا تکلیف کے نکل آتے ہیں۔دیگر اوقات میں، آپ یہ نشانیاں دیکھ سکتے ہیں:",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              'ان کی مسوڑھے جہاں دانت نکل رہا ہوتا ہے سرخ اور تکلیف میں ہو سکتے ہیں ۔',
              'انہیں ہلکا بخار ہو سکتا ہیں جو 100 ڈگری سے کم ہوتا ہے۔',
              'وہ اپنے کان کو رگڑتے ہیں۔',
              'ان کا تھوک زیادہ بہتا ہے۔',
              'چیزوں کو زیادہ چبانے اور کاٹنے لگتے ہیں۔',
              'زیادہ بے چین رہتے ہیں۔',
              'پرسکون نیند نہیں سو پاتے ہیں۔'
            ])
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
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 20),
            Text(
              "اگر آپ کے بچے کے دانت نکلنا شروع ہو گئے ہے تو اس دوران بچے کبھی چڑچڑے ہو جاتے ہیں اورکبھی انہیں ہلکا بخار بھی ہو جاتا ہےجس سے ان کا کھانے اور سونے کا معمول خراب ہو سکتا ہے۔گھبرائیں نہیں، یہ بچوں میں نارمل ہے!",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "کرنے والے کام: (Do’s) ",
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
              "بچے کے مسوڑھوں کو دن میں 2 بار باقاعدگی سے صاف انگلی یا نرم کپڑے سے صاف کریں۔",
              "دانت نکلنے کے دوران زیادہ رال بہتی ہے۔ اس کو نرم کپڑے سے صاف کریں تاکہ بچے کا چہرہ خشک رہے اور کوئی انفیکشن نہ ہو۔",
              "صاف اور محفوظ چبانے والے کھلونے یا ٹھنڈا گاجر کا ٹکڑا دیں تاکہ بچے کو آرام ملے۔",
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
