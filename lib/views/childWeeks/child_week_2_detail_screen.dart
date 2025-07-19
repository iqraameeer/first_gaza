import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek02DetailScreen extends StatelessWidget {
  // final int selectedWeek;
  final int selectedDay;

  ChildWeek02DetailScreen({
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
                                ? "ماؤں کے لیے صحت مند طرز زندگی برقرار رکھنے کے مشورے"
                                : selectedDay == 3
                                    ? "بچے کی ناف کی دیکھ بھال"
                                    : selectedDay == 5
                                        ? "آن ڈیمانڈ (on demand)دودھ پلانا اور  بچے کی بھوک کی علامات(feeding cues)"
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
    if (day == 1) {
      return const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'ہمیں احساس ہے کہ اس وقت آپ کا جسم زچگی کے بعد بحالی کے مرحلے سے گزر رہا ہے۔  اس لئے ضروری ہے کہ آپ اپنی صحت کا خاص خیال رکھیں تاکہ آپ کی توانائی بحال ہو اور آپ اپنے بچے کی بہتر دیکھ بھال کر سکیں۔ اس مشکل گھڑی میں  آپ اکیلی نہیں ہیں، ہم آپ کی رہنمائی کے لئے موجود ہیں۔',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
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
              "صحت بخش غذا جیسے دودھ، انڈے، دالیں اور تازہ سبزیاں یا پھل کھائیں۔",
              "دن میں 8 سے 10 گلاس پانی پئیں اور بچے کو دودھ پلانے کے دوران بھی پانی پئیں۔",
              "اپنی نیند پر توجہ دیں۔ کوشش کریں جب بچہ سوئے تو آپ بھی آرام کریں اور اپنی نیند پوری کریں۔",
              "زچگی کے بعد آپ کے لیے بھی ذہنی سکون بہت ضروری ہے۔ گہرے سانس لینے کی مشقیں کریں، یہ آپ کے لیے مفید ہوگی۔",
              "اگر آپ تھکاوٹ یا اداسی محسوس کریں تو اپنے خاندان یا قریبی دوستوں سے بات کریں۔ آپ کے ارد گرد سپورٹ کا نظام موجود ہے۔",
            ]),
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
              'آپ ایک بہترین ماں ہیں اور آپ کا پیار اور محنت آپ کے بچے کے لیے سب سے قیمتی ہیں۔ خود پر بھروسہ کریں اور حوصلہ رکھیں۔  آہستہ آہستہ آپ بچے  کے معمول یا روٹین کو سمجھ جائیں گی اور اس کے مطابق اپنے آپ کو ایڈجسٹ کر لیں گی۔ ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
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
              "بچے کی ناف کو صاف اور خشک رکھیں۔",
              "صفائی کے لیے صاف روئی کے ٹکڑے جو ابالے ہوئے پانی سے نم کیا گیا ہو، استعمال کریں۔",
              "اگر ناف کو صاف اور خشک نہ رکھا جائے تو اس میں انفیکشن ہو سکتا ہے۔",
              "ناف پر کوئی گھریلو ٹوٹکہ نہ لگائیں کیونکہ اس سے ٹیٹنس (tetanus) کی بیماری ہو سکتی ہے۔",
            ]),
          ],
        ),
      );
    } else if (day == 5) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'بچے کو صرف اپنا دودھ پلائیں۔ بچے کو ہر دفعہ دودھ پلانے کے بعد ڈکار دلائیں۔  اگر آپ کو دودھ پلانے میں کوئی دشواری ہو تو پریشان نہ ہوں ۔ یہ ایک نیا سفر ہے اور آپ وقت کے ساتھ بہتر ہوتی جائیں گی۔ اپنی دیکھ بھال جاری رکھیں، آپ بہترین کام کر رہی ہیں!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "یاد رکھیں! ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            const BulletList(items: [
              "دودھ پلانے کے لیے ضروری ہے کہ آپ کا بچہ چھاتی کے ساتھ صحیح طریقے سے جڑا ہوا ہو۔",
              "آپ نے پچھلے پیغام کی ویڈیو میں بچے کو ماں کا دودھ پلانے کا طریقہ دیکھا ہے۔ اس کی پریکٹس اور کوشش جاری رکھیں، آپ جلد سیکھ لیں گی۔",
              "جب بھی بچہ بھوک کی علامت (feeding cues) ظاہر کرے تو اسے اپنا دودھ پلائیں۔ اسے 'آن ڈیمانڈ دودھ پلانا' کہا جاتا ہے۔",
              "بچے کو دودھ پلانے کا بہترین وقت وہ ہے جب وہ بھوک کی ابتدائی علامات ظاہر کرے۔",
              "ہم نے آپ کی آسانی کے لیے درج ذیل تصویر میں بچے کے بھوکے ہونے کی مختلف علامات بتائی ہیں۔",
            ]),
            // Use Row to display images in a row
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    width: 200, // Set your desired width
                    height: 200, // Set your desired height
                    'assets/images/childWeek_1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    width: 200, // Set your desired width
                    height: 200, // Set your desired height
                    'assets/images/childWeek_2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    width: 200, // Set your desired width
                    height: 200, // Set your desired height
                    'assets/images/childWeek_3.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    // Default widget if no matching day or week is found
    else {
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
