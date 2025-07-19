import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek01DetailScreen extends StatelessWidget {
  // final int selectedWeek;
  final int selectedDay;

  ChildWeek01DetailScreen({
    Key? key,
    // required this.selectedWeek,
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
                                ? "ننھے مہمان کی آمد پر آپ کو دلی مبارکباد!👶🎉 بچے کو ماں کا پہلا دودھ پلانا"
                                : selectedDay == 3
                                    ? "بچے کو گھٹی دینے کے نقصانات"
                                    : selectedDay == 5
                                        ? "بچے کو حفاظتی ٹیکے لگوائیں"
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
                const SizedBox(height: 10),
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
              "آپ  نے زچگی کے سفر میں جس حوصلے اور صبر کا مظاہرہ کیا، وہ قابل تعریف ہے۔ یہ سفر آسان نہیں تھا، لیکن آپ نے یہ مشکل مرحلہ کامیابی سے مکمل کیا ۔ ہم سمجھ سکتے ہیں کہ اس وقت آپ تھکی ہوئی ہیں اور آپ کے جسم کو آرام چاہیے مگر تھوری سی ہمت کریں کیونکہ اب بچے کو سب سے بہترین  اور قیمتی  تحفہ  دینے کا  وقت ہے ، یعنی ماں کا دودھ ۔",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 20),
            Text(
              "یاد رکھیں! ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              'ماں کا پہلا دودھ (کولسٹرم ) بچے کیلئے مکمل غذا ہے اس  میں بچے کیلئے پانی بھی شامل ہوتا ہے۔',
              'یہ دودھ بچے کیلئے حفاظتی ٹیکے  کی طرح ہوتا ہے کیونکہ یہ بچے میں بیماریوں کے خلاف لڑنے کی طاقت پیدا کرتا ہے۔',
              'ابتدائی دنوں میں بچہ جب دودھ نہیں پیتا ہے تو سوتا رہتا ہے، اس لیے کوشش کریں بچے کو ہر دو گھنٹے کے بعد دودھ پلائیں۔',
              'بچے کو ہر دفعہ دودھ پلانے کے بعد ڈکار دلائیں۔',
              'ماں کے دودھ پلانے سے بچے کو سکون ملتا ہے اور وہ کم روتا ہے۔',
              'پچھلے پیغام کی ویڈیو آپ کو بچے کو بہتر طریقے سے  دودھ  پلانے میں بےحد کارآمد ہو گی۔'
            ])
          ],
        ),
      );
    } else if (day == 3) {
      return const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "یاد رکھیں! ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              'اپنے بچے کو صرف ماں کا دودھ پلائیں۔',
              'بچے کو ماں کے دودھ کے علاوہ  کوئی بھی اور چیز مثلاً  شہد یا پانی یا گھٹی نہ دیں۔',
              'ایسا کرنے سے بچے کو مختلف انفیکشنز لگ سکتے ہیں اور اس کی صحت متاثر ہو سکتی ہے۔'
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
            BulletList(items: [
              'پیدائش کے وقت اپنے بچے کو پولیو اور ٹی بی سے بچاؤ کے حفاظتی ٹیکے لگوائیں۔پولیو کی بیماری بچوں میں  زندگی بھر کی معذوری کرتی ہے جبکہ ٹی بی  کی بیماری بچوں میں جسمانی کمزوری پیدا کرتی ہے۔ حفاظتی ٹیکےہی آپ کے بچے کی بہتر اور محفوظ مستقبل کی ضمانت ہے۔',
              'آپ بچے کو اپنا دودھ ویکسین لگوانے کے بعد پلا سکتی ہیں۔ کوشش کریں کہ اپنا دودھ زیادہ بار پلائیں۔ اس سے بچے کو سکون ملے گا، پانی کی کمی نہیں ہوگی، اور بچے کی قوتِ مدافعت بہتر ہوگی۔'
            ]),
            SizedBox(
              height: 10,
            ),
            Text(
              "یاد رکھیں! ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              'بچے کی صحت کے لیے حفاظتی ٹیکوں کا کورس مکمل کرنا بہت ضروری ہے۔',
              'ویکسین کے بعد کچھ بچوں کو ہلکا بخار، چڑچڑاپن، یا انجکشن کی جگہ پر سوجن ہو سکتی ہے، جو عام بات ہے۔',
              'آپ کے ننھے منے  بچے کا اگلا حفاظتی ٹیکہ چھٹے ہفتے میں لگنا ہے۔',
              'اپنے بچے کو حفاظتی ٹیکوں کے شیڈول کی مقررہ تاریخ پر اپنے ہسپتال کے ویکسینیشن سینٹر لے کر آئیں۔ ',
              'ویکسینیشن والے دن آپ کے بچے کے وزن اور قد کی پیمائش بھی  کی جاتی ہیں تاکہ معلوم ہو سکے کہ آپ کا بچہ اپنی عمر کے مطابق بڑھ رہا ہے۔اس لیے بہت ضروری ہے کہ آپ بچے کو ویکسینیشن سینٹر میں لے کر آئیں ۔',
              'اگر کسی مصروفیت کی وجہ سے آپ مقررہ تاریخ پر نہیں آ سکتے تو ہمیں ضرور مطلع کریں۔ ',
              'ہم آپ کو جلد از جلد آپ کی سہولت کے مطابق نئی اپوائنٹمنٹ کی تاریخ دے دیں گے۔',
              'یاد رہے کہ ہم آپ کی مدد اور رہنمائی کے لیے ہر  مقررہ تاریخ پر ویکسینیشن سینٹر میں موجود ہیں جہاں ہم آپ کے سوالات کا تسلی بخش جواب دیں گے۔'
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
