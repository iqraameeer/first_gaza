import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek07DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek07DetailScreen({
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
                                ? "بچہ کی مناسب مقدار میں دودھ حاصل نہیں کرنے کی کیا علامات ہے؟"
                                : selectedDay == 3
                                    ? "بیمار ماں کے لئے   دودھ پلانے سے متعلق چند ہدایات"
                                    : selectedDay == 5
                                        ? "والدین گھریلو کاموں کی ذمہ داری  بانٹیں"
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
        "اگر آپ کو لگے کہ بچہ چھاتی سے کافی دودھ نہیں لے پا رہا ہے  یا بچے کو کوئی صحت کا مسئلہ ہے , تو ایسی صورت میں ڈاکٹر سے فوراً رابطہ کریں۔";

    String text_day_5 =
        "والدین آپس میں  ذمہ داریاں بانٹیں۔  شوہر  مختلف  کاموں میں مدد کریں جیسے کھانے کی تیاری، گھر  کی صفائی یا بچے کو سنبھالنا۔ یہ نہ صرف ماں کو آرام کرنے کا موقع دے گا بلکہ  ماں سکون سےدودھ پلانے پر توجہ  دے سکے گی۔";

    if (day == 1) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const BulletList(items: [
              "ہر ماہ بچے کا 500گرام سے کم وزن بڑھنا یا وزن کا نہ بڑھنا ۔",
              "بچے کو کم مقدار میں اور گاڑھے رنگ کا پیشاب آنا ۔",
              "دن میں چھ مرتبہ سے کم پیشاب آنا۔"
            ]),
            const SizedBox(height: 10),
            const Text(
              "یاد رکھیں!",
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
            Text(
              text_day_1,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      );
    } else if (day == 3) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "ماں کے لیے عام نزلہ، زکام، یا ہلکا بخار جیسی بیماریوں کے دوران، دودھ پلانا عام طور پر محفوظ اور فائدہ مند ہوتا ہے ۔",
              "Diabetes ، دمہ(Asthma)، یا ہائی بلڈ پریشر (Blood pressure)جیسی بیماریوں کے دوران بھی دودھ پلانے پر کوئی پابندی نہیں ہے۔ ان بیماریوں کا علاج ڈاکٹر کی ہدایت کے مطابق کیا جائے۔",
              "کوئی بھی دوا لینے سے پہلے، چاہے وہ عام دوا ہو، ڈاکٹر سے مشورہ کریں۔",
              "صفائی کا خاص خیال رکھیں ۔",
              "اگر سانس کی کوئی بیماری ہو تو ماسک پہنیں تاکہ بچہ متاثر نہ ہو۔",
              "دودھ کی مقدار کو برقرار رکھنے کے لیے زیادہ پانی پئیں اور غذائیت سے بھرپور کھانا کھائیں۔",
              "آرام کریں تاکہ بیماری سے جلد صحت یابی ممکن ہو ۔",
              "اگر ماں اتنی بیمار ہو کہ اپنا دودھ نہ پلا سکے، تو ہاتھ یا پمپ دودھ نکال کر صاف چمچ یا کپ سے بچے کو پلانا ایک اچھا متبادل ہے ۔"
            ]),
            SizedBox(
              height: 10,
            ),
            Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "ماں کا دودھ نہ صرف بچے کی مکمل اور بہترین غذا ہے بلکہ بچوں کو بیماریوں سے لڑنے کی طاقت اور قوت بھی دیتا ہے، اس لئے ہر حال میں کوشش کریں کہ آپ اپنا دودھ بچے کو پلائیں۔",
              "پچھلے پیغام کی ویڈیو میں ہم نے ہاتھ سے دودھ نکالنے اور کپ سے پلانے کے طریقے کے بارے میں بات کی ہے۔ اس ویڈیو کو بار بار دیکھیں تاکہ آپ کی بیماری کے دوران بھی آپ کا بچہ ماں کا دودھ پینا جاری رکھ سکے اور صحت مند رہے۔"
            ])
          ],
        ),
      );
    } else if (day == 5) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text_day_5,
              style: const TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
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
