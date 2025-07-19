import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek06DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek06DetailScreen({
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
                                ? "چھٹے ہفتے  کی ویکسینیشن کے بارے میں یاد دہانی!"
                                : selectedDay == 3
                                    ? "دودھ کی پیداوار میں بہتر اٹیچمنٹ کی اہمیت "
                                    : selectedDay == 5
                                        ? "مسئلہ :چھاتیوں کا دودھ سے بھرنا"
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
        "امید کرتے ہیں کہ آج کا دن آپ کے بچے کے لیے خوبصورت ہو۔ آپ کے ننھے منے  بچے کا اگلا حفاظتی ٹیکہ چھٹے ہفتے میں لگنا ہے۔ آپ بچے کو اپنا دودھ ویکسین لگوانے کے بعد پلا سکتی ہیں۔ کوشش کریں کہ اپنا دودھ زیادہ بار پلائیں۔ اس سے بچے کو سکون ملے گا، پانی کی کمی نہیں ہوگی، اور بچے کی قوتِ مدافعت بہتر ہوگی۔ ";
    String text_day_3 =
        "جتنا  زیادہ بچہ ماں کی  چھاتیوں سے  دودھ پیتا ہے، اتنا زیادہ ماں کی  چھاتیوں میں دودھ بنتا ہے۔ اس لیے یہ ضروری ہے کہ بچہ صحیح طریقے سے ماں کے سینے سے لگے تاکہ وہ آسانی سے زیادہ دودھ پی سکے اور ماں بغیر کسی تکلیف کے زیادہ بار دودھ پلا سکے ۔";
    String text_day_5 =
        "کسی وقت بچہ مناسب طور پر دودھ حاصل نہیں کرپاتا جس کی یہ وجوہات ہو سکتی ہیں۔";

    if (day == 1) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text_day_1,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            const BulletList(items: [
              "بچے کی صحت کے لیے حفاظتی ٹیکوں کا کورس مکمل کرنا بہت ضروری ہے۔",
              "ویکسین کے بعد کچھ بچوں کو ہلکا بخار، چڑچڑاپن، یا انجکشن کی جگہ پر سوجن ہو سکتی ہے، جو عام بات ہے۔",
              "چھٹے ہفتے کا ویکسین آپ کے بچے کو مندرجہ ذیل خطرناک بیماریوں سے بچاتا ہے: پولیو، ڈفتھیریا، پرٹیوسس، ٹیٹنس اور ہیپاٹائٹس بی",
              "اپنے بچے کو حفاظتی ٹیکوں کے شیڈول کی مقررہ تاریخ پر اپنے ہسپتال کے ویکسینیشن سینٹر لے کر آئیں۔",
              "ویکسینیشن والے دن آپ کے بچے کے وزن اور قد کی پیمائش بھی کی جاتی ہیں تاکہ معلوم ہو سکے کہ آپ کا بچہ اپنی عمر کے مطابق بڑھ رہا ہے۔ اس لیے بہت ضروری ہے کہ آپ بچے کو ویکسینیشن سینٹر میں لے کر آئیں۔",
              "اگر کسی مصروفیت کی وجہ سے آپ مقررہ تاریخ پر نہیں آ سکتے تو ہمیں ضرور مطلع کریں۔ ہم آپ کو جلد از جلد آپ کی سہولت کے مطابق نئی اپوائنٹمنٹ کی تاریخ دے دیں گے۔",
              "یاد رہے کہ ہم آپ کی مدد اور رہنمائی کے لیے ہر مقررہ تاریخ پر ویکسینیشن سینٹر میں موجود ہیں جہاں ہم آپ کے سوالات کا تسلی بخش جواب دیں گے۔"
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
            const SizedBox(
              height: 10,
            ),
            const Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            const BulletList(items: [
              "بچے کا صحیح طریقے سے چھاتی کو پکڑنا دودھ کی زیادہ پیداوار میں مددگار ثابت ہوتا ہے۔",
              "یاد رہے کہ آپ نے پچھلے پیغام کی ویڈیو میں بچے کو چھاتی سے صحیح منسلک کرنے کا طریقہ دیکھا ہے۔ اس کی پریکٹس اور کوشش جاری رکھیں۔"
            ])
          ],
        ),
      );
    } else if (day == 5) {
      return const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "وجوہات",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "ماں کا بچے کو بہت لمبے وقفوں سے اپنا دودھ پلانا۔",
              "بچے کا چھاتی سے مکمل دودھ نہ پینا یا ہر مرتبہ دودھ پلانے پر چھاتیوں کا اچھی طرح سے خالی نہ ہونا۔"
            ]),
            Text(
              "احتیاطی تدابیر",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "بچے کو وقت پر اور بار بار دودھ پلائیں ۔ہر 2-3 گھنٹے بعد دودھ پلائیں تاکہ ماں کے چھاتی میں دودھ جمع نہ ہو۔",
              "ہر مرتبہ دونوں چھاتیوں سے بچے کو دودھ پلائیں ۔",
              "بچے کو صحیح طریقے سے ماں کے سینے سے جوڑنے کی کوشش کریں تاکہ وہ آسانی سے دودھ پی سکے۔",
              "بچے کو صحیح پوزیشن میں دودھ پلائیں تاکہ وہ زیادہ دودھ لے سکے۔",
              "بچے کو اس طرح رکھیں کہ اس کے منہ سے ماں کی پوری نپل لی جا سکے۔ یہ نہ صرف بچے کو زیادہ دودھ حاصل کرنے میں مدد دے گا بلکہ ماں کو بھی تکلیف کم ہوگی۔",
              "دودھ پلانے کے بعد بھی اگر چھاتیوں میں سختی محسوس ہو تو ہاتھ یا پمپ کے ذریعے دودھ نکال لیں۔",
              "اگر بچہ قریب نہ ہو تو چھاتیوں کو ہاتھ یا پمپ سے خالی کر دیں۔"
            ]),
            Text(
              "حل",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "ہر تھوڑے وقت کے بعد دودھ پلائیں",
              "ہر مرتبہ دونوں چھاتیوں سے بچے کو دودھ پلائیں اور دونوں چھاتیوں کو خالی کریں۔",
              "سینے پر ہلکی گرم کپڑا رکھ کر یا نیم گرم پانی سے سکائی کریں۔",
              "سہارا دینے والی بریز ر استعمال کریں۔"
            ]),
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
              "ماں کا دودھ بچے کی صحت، قوت مدافعت اور نشوونما کے لیے سب سے بہترین غذا ہے۔",
              "یہ تکلیف عارضی ہے۔ تھوڑی سی احتیاط اور مسلسل دودھ پلانے سے آپ جلد بہتر محسوس کریں گی۔",
              "یاد رہے کہ پچھلے پیغام میں ہم نے بچے کو چھاتی سے صحیح منسلک کرنے اور ہاتھ کی مدد سے چھاتی سے دودھ نکالنے کی ویڈیو آپ سے شیئر کی ہیں۔ اسے بار بار دیکھیں تاکہ آپ آسانی سے اور بغیر کسی تکلیف کے زیادہ بار اپنا دودھ بچے کو پلا سکیں۔"
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
