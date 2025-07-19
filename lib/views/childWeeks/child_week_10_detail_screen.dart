import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek10DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek10DetailScreen({
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
                                ? "دسویں ہفتے کی ویکسینیشن کے بارے میں یاد دہانی "
                                : selectedDay == 3
                                    ? "بچوں میں مناسب وقفہ کے متعلق چند تجاویز"
                                    : selectedDay == 5
                                        ? "بچے کی صفائی کے بارے میں یاد دہانی"
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
              'امید کرتے ہیں کہ آج کا دن آپ کے بچے کے لیے خوبصورت ہو۔ آپ کے ننھے منے بچے  کا اگلا حفاظتی ٹیکہ دسویں ہفتے میں لگنا ہے۔ آپ بچے کو اپنا دودھ ویکسین لگوانے کے بعد پلا سکتی ہیں۔ کوشش کریں کہ اپنا دودھ زیادہ بار پلائیں۔ اس سے بچے کو سکون ملے گا، پانی کی کمی نہیں ہوگی، اور بچے کی قوتِ مدافعت بہتر ہوگی۔ ',
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
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
            BulletList(items: [
              'بچے کی صحت کے لیے حفاظتی ٹیکوں کا کورس مکمل کرنا بہت ضروری ہے۔',
              'ویکسین کے بعد کچھ بچوں کو ہلکا بخار، چڑچڑاپن، یا انجکشن کی جگہ پر سوجن ہو سکتی ہے، جو عام بات ہے۔',
              ' دسویں ہفتے کا ویکسین آپ کے بچے کو مندرجہ ذیل خطرناک بیماریوں سے بچاتا ہے:'
            ]),
            TickmarkList(items: [
              'پولیو، ڈفتھیریا، پرٹیوسس، ٹیٹنس ، روٹا وائرس، اور نیوموکوکل '
            ]),
            BulletList(items: [
              'اپنے بچے کو حفاظتی ٹیکوں کے شیڈول کی مقررہ تاریخ پر اپنے ہسپتال کے ویکسینیشن سینٹر لے کر آئیں۔ ',
              'ویکسینیشن والے دن آپ کے بچے کے وزن اور قد کی پیمائش بھی  کی جاتی ہیں تاکہ معلوم ہو سکے کہ آپ کا بچہ اپنی عمر کے مطابق بڑھ رہا ہے۔اس لیے بہت ضروری ہے کہ آپ بچے کو ویکسینیشن سینٹر میں لے کر آئیں ۔',
              'اگر کسی مصروفیت کی وجہ سے آپ مقررہ تاریخ پر نہیں آ سکتے تو ہمیں ضرور مطلع کریں۔ ',
              'ہم آپ کو جلد از جلد آپ کی سہولت کے مطابق نئی اپوائنٹمنٹ کی تاریخ دے دیں گے۔',
              'یاد رہے کہ ہم آپ کی مدد اور رہنمائی کے لیے ہر  مقررہ تاریخ پر ویکسینیشن سینٹر میں موجود ہیں جہاں ہم آپ کے سوالات کا تسلی بخش جواب دیں گے۔'
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
              'آپ کی محنت اور ماں ہونے کی محبت قابل تعریف ہے!',
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
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
            BulletList(items: [
              "مناسب وقفہ ماں کے جسم کو آئرن اور غذائیت کی کمی کو پورا کرنے اور دوبارہ توانائی فراہم کرنے میں مدد دیتا ہے۔",
              "اگلے حمل میں کم از کم دو سال کا وقفہ آپ کے موجودہ بچے کو مکمل توجہ اور محبت فراہم کرنے کا موقع دیتا ہے اور آنے والے بچے کے لیے ایک صحت مند آغاز کا سبب بنتا ہے۔",
              "حمل کے درمیان کم از کم دو سال وقفے کے بارے میں والدین آپس میں بات کریں تاکہ ماں اور بچے دونوں کی صحت برقرار رہے۔",
              "دودھ پلانے کے دوران محفوظ مانع حمل (contraception) کے طریقے جاننے کے لئے اپنے ڈاکٹر سے رابطہ کریں۔",
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
              'بچے کی صفائی کا خاص خیال رکھیں۔',
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
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
            BulletList(items: [
              "دن میں کم از کم ایک بار نہلائیں۔",
              "بچے کے کان اور ناک کو صاف کریں۔",
              "بچے کے ناخنوں کو چھوٹے رکھیں تاکہ وہ خود کو یا دوسروں کو نہ خراشیں۔",
              "بچے کے کھلونے وقتاً فوقتاً دھوئیں تاکہ ان پر جراثیم نہ بڑھیں۔",
              "بچے کا ڈائپر وقت پر تبدیل کریں۔",
              "بچے کے نازک حصوں کو صابن اور صاف پانی سے دھوئیں۔",
              "خشک کرنے کے بعد صاف ڈائپر پہنائیں، اس سے نیپی ریش سے بچاؤ ہوتا ہے۔",
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
