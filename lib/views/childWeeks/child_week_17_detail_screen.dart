import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek17DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek17DetailScreen({
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
                                ? "  آپ کا بچہ 4 ماہ کے سنگ میل (milestone) کو پہنچ گیا ہے!\nبچے کو وقت پر ویکسین لگائیں"
                                : selectedDay == 3
                                    ? "بچے کی صفائی کے بارے میں معلومات"
                                    : selectedDay == 5
                                        ? "بچے کی ناک صاف رکھنے کے بارے میں مشورہ !"
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
              "آپ کو دل کی گہرائیوں سے مبارک ہو! آپ کے بچے نے چوتھے ماہ کو مکمل کر لیا ہے اور اب پانچویں ماہ میں داخل ہو رہا ہے۔ یہ آپ کی محبت، محنت اور صبر کا نتیجہ ہے۔ آپ نے جس طرح سے اپنے بچے کی پرورش کی ہے وہ قابل تعریف ہے۔",
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
              'بچے کو چھ ماہ کی عمر تک صرف اور صرف ماں کا دودھ پلائیں ۔ یہ آپ کے بچے کی صحت، قوت مدافعت اور ذہنی نشوونما کے لیے بے حد ضروری ہے۔',
              'بچے کی ویکسینیشن کا سلسلہ جاری رکھیں بلکہ اس میں کوئی تاخیر نہ کریں کیونکہ یہ بچے کو مختلف بیماریوں سے محفوظ رکھتی ہے اور ان کی مجموعی نشوونما میں مدد دیتی ہے۔'
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
            BulletList(items: [
              'بچے کی صفائی کا خاص خیال رکھیں۔بچے کا ڈائپر وقت پر تبدیل کریں۔',
              'بچے کے نازک حصوں کو صابن اور صاف پانی سے دھوئیں۔',
              'خشک کرنے کے بعد صاف ڈائپر پہنائیں، اس سے نیپی ریش سے بچاؤ ہوتا ہے۔'
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
              'آپ کے بچے کی ذاتی صفائی اور آرام کے لیے بہت اہم ہے کہ آپ باقاعدگی سے اپنے بچے کی ناک صاف رکھیں تاکہ بچہ دودھ پینے کے دوران بہتر سانس لے سکے ۔',
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
