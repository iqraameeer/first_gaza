import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek19DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek19DetailScreen({
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
                                ? "باقاعدگی سے بچے کے وزن اور قد کی پیمائش کروائیں"
                                : selectedDay == 3
                                    ? "بچے کے تجسس کو ابھاریں!"
                                    : selectedDay == 5
                                        ? "بچے  کے روٹین  کو  قائم کریں"
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
              "اپنے بچے کا قد اور وزن باقاعدگی سے چیک کروائیں۔ یہ اس بات کو یقینی بنانے میں مدد کرے گا کہ اس کی نشوونما عمر کے مطابق ہو رہی ہے۔ ",
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
              'ویکسینیشن والے دن آپ کے بچے کے وزن اور قد کی پیمائش بھی  کی جاتی ہیں ۔اس لیے بہت ضروری ہے کہ آپ بچے کو  باقاعدگی سے  مقررہ تاریخ پر  حفاظتی ٹیکے لگوانے ویکسینیشن سینٹر میں لے کر آئیں ۔',
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
              "بچے کو گھر سے باہر کے ماحول کا تجربہ دیں۔اپنے بچے کو مختلف آوازیں، چہرے، چیزیں اور جگہیں دکھائیں۔ یہ اس کی ذہنی اور سماجی نشوونما کے لیے بہت ضروری ہے اور اس کی تجسس کو بڑھاتا ہے۔",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
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
              "اپنے بچے کے لیے کھانے، نہانے اور سونے کا وقت مقرر کریں۔ یہ اس کی سرگرمیوں کے ایک ترتیب  routineمیں ڈھلنے میں مدد دے گا اور اسے سکون اور تحفظ کا احساس دلائے گا۔",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
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
//
// final List<String> infantsFeedingBenefits = [
//   'ماں کا دودھ بچے کیلئے کافی ہے اگر!\n'
//       ' بچہ فقط ماں کا دودھ پی رہا ہے۔\n'
//       '  دن میں چھ مرتبہ سے زیادہ پیشاب کرتا ہے\n'
//       ' نرم پاخانہ کرتا ہے۔\n'
//       ' بچے کا ایک ماہ میں آدھا کلو سے ایک کلو تک وزن بڑھتا ہے۔',
//   'اگر آپ کا خیال ہے کہ بچے کا وزن ٹھیک طرح سے نہیں بڑھ رہا تو دو مہینوں میں باقاعدگی سے بچے کا وزن کریں اور ہر ماہ وزن میں اضافہ نوٹ کریں۔',
//   'ماں کو پہلے چھ ماہ میں صرف اور صرف اپنا دودھ پلانا چاہیے۔ بار بار اپنا دودھ پلائیں اور دوسری خوراک بند کر دے۔',
//   'دن میں آرام کریں ،اچھی متوازن غذا، بہتر خوراک ،زیادہ مقدار میں پانی اور پانی والی اشیاء استعمال کریں۔',
//   'خون میں کمی سے بچاؤ کیلئے فولاد کی گولیاں زچگی کے تین ماہ تک استعمال کریں۔'
// ];
