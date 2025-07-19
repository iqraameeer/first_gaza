import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek08DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek08DetailScreen({
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
                                ? "بچے کے سر کی حفاظت"
                                : selectedDay == 3
                                    ? "بچے کی سمجھنے کی صلاحیت"
                                    : selectedDay == 5
                                        ? "بچے کی جسمانی اور   زبان سیکھنے کی نشونما "
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
    String text_day_1 =
        "اگر اس کا علاج نہ کیا جائے تو چھاتیوں کی سوجن کا خطرہ پیدا ہو جاتا ہے ۔";

    String text_day_3 = "اس ہفتے ہم آپ سے بچے کی نشوونما پر کچھ بات کرتے ہیں۔";
    String text_day_5 =
        "ماں کا دودھ کمرے کے درجہ حرارت پر 8گھنٹے تک رکھا جا سکتا ہے اور24گھنٹے تک فرج میں محفوظ کیا جا سکتا ہے";

    if (day == 1) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),
            BulletList(items: [
              "کبھی بھی اپنے بچے کے سر کو  زور سے جھٹکے نہ دیں۔",
              "جھٹکنے سے ریڑھ کی ہڈی کو نقصان پہنچ سکتا ہے ۔ "
            ])
          ],
        ),
      );
    } else if (day == 3) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text_day_3,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 10),
            BulletList(items: [
              "دوسرے مہینے کے آخر تک آپ کا بچہ اب آوازوں کی طرف سر گھمانا شروع کر رہا ہے۔",
              "حرکت کرتی ہوئی چیز کو دیکھتا ہے۔",
              "مانوس آواز پر رد عمل دیتا ہے۔",
              "جب ماں بچے سے بات کرتی ہے تو مسکراتا ہے۔",
              "یہ دیکھنا کمال کی خوشی ہے کہ وہ آپ کی پہچاننے لگا ہے!"
            ]),
            const Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "اپنے بچے سے بات کریں اور جواب دیتے وقت آنکھ سے آنکھ ملا کر دیکھیں۔"
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_8_32.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    } else if (day == 5) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "اب آپ کا بچہ زیادہ تر وقت سر کو سیدھا رکھتا ہے۔",
              "ہاتھوں کو کھولتا اور بند کرتا ہے۔",
              "مختلف رونے اور آواز کے انداز اپنا رہا ہے، کبھی بھوک، کبھی بے چینی، اور کبھی خوشی کے لیے۔",
              "یہ اس کی بات چیت کا پہلا قدم ہے!"
            ]),
            SizedBox(
              height: 10,
            ),
            Text(
              "یاد رکھیں!",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "اپنے بچے کو اکثر لوریاں یا گانے سنائیں کیونکہ  بچے کی ذہنی نشوونما سننے کے ذریعے بھی ہوتی ہے۔ "
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_8_33.png',
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
}
