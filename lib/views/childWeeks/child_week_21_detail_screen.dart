import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek21DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek21DetailScreen({
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
                                ? "آپ کا بچہ 5 ماہ کے سنگ میل (Milestone) کو پہنچ گیا ہے! بچے کو ابھی بھی صرف ماں کا دودھ پلائیں۔"
                                : selectedDay == 3
                                    ? "ماں ہاتھ  یا پمپ سے بھی دودھ نکال کر بچے کو پلائیں"
                                    : selectedDay == 5
                                        ? "بچے کو پانی یا نیم ٹھوس غذا شروع نہیں کریں"
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
                "مبارک ہو!   آپ کا بچہ چھٹے ماہ میں داخل ہو رہا ہے ۔ آپ کی محبت اور توجہ بچے کے لئےسب سے بہترین ہیں ۔آپ بہت زبردست ماں ہیں! ",
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
                ' اب بھی ماں کا دودھ بچے کی اچھی صحت اور نشوونما کے لیے بہت اہم ہے۔',
                ' بچے کو صرف اپنا دودھ پلانا جاری رکھیں۔',
                'دن میں چھ سے آٹھ بار بچے کو دودھ پلائیں۔ ',
                'ماں کا دودھ بچے کو کم از کم دو سال یا اس سے زیادہ کی عمر تک پلانا جاری رکھیں۔',
                'ماں کا دودھ پینے والے بچوں میں ہاضمہ، پھیپھڑوں اور کان کا انفیکشن ہونے کا امکان بہت کم ہوتا ہے۔'
              ]),
            ],
          ));
    } else if (day == 3) {
      return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "اگر آپ  کام کرنے والی ماں ہیں یاکسی وجہ سے اپنے بچے سے کچھ وقت کے لیے دور ہیں ، تو کم سے کم ہر 3 گھنٹے بعد  ہاتھ  یا پمپ کی مدد سے چھاتی سے اپنا دودھ نکالے جو بچے کی ضرورت کے مطابق ہو۔ اس طرح آپ دودھ پلانے کا سلسلہ جاری رکھ سکتی ہی",
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
                "دودھ کی اچھی پیداوار کے لئے آٹھ سے دس گلاس روزانہ پانی پئیں ۔ ",
                "بچے کو دودھ پلانے کے دوران بھی پانی پئیں۔ ",
                "اپنی خوراک اور نیند پر توجہ دیں ۔",
              ]),
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
                'اگر  ماں کم مرتبہ  اپنا دودھ نکالے گی یا  دودھ نکالنے میں زیادہ وقفہ رکھے گی تو زیادہ دودھ پیدا نہیں  کر سکے گی ۔ اس کے علاوہ چھاتیوں میں دودھ بھر جانے کی وجہ سے تکلیف اور بخار کا بھی مسئلہ ہو سکتا ہے۔',
                'پچھلے پیغامات میں ہم نے آپ کی آسانی کے لیے ویڈیو شیئر کی ہیں، ان کو ضرور دیکھیں تاکہ آپ کی رہنمائی ہو سکے۔',
              ]),
            ],
          ));
    } else if (day == 5) {
      return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BulletList(items: [
                'اکثر مائیں بچوں کو پانچ ماہ کی عمر سے ہی پانی یا نیم ٹھوس غذا شروع کر دیتی ہیں۔',
                'یہ سراسر غلط ہے۔ ',
              ]),
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
                'تحقیق سے ثابت ہوا ہے کہ چھ ماہ کی عمر تک بچے کی پانی اور تمام غذائی ضرورت صرف ماں کے دودھ سے پوری ہو جاتی ہیں۔',
              ]),
            ],
          ));
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
