import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek16DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek16DetailScreen({
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
                                ? "بچے کی جسمانی نشونما "
                                : selectedDay == 3
                                    ? "بچے کی سمجھنے کی صلاحیت"
                                    : selectedDay == 5
                                        ? "بچے کی زبان سیکھنے کی نشونما"
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

  Widget _buildContentForSelectedDay(int day) {
    if (day == 1) {
      return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "آپ کا بچہ اب اپنے سر اور کندھوں کو بازوؤں کا سہارا لے کر اٹھانے لگا ہے۔ یہ اس کی جسمانی نشوونما کا ایک اہم سنگ میل ہے۔ آپ کے بچے کی بڑھتی ہوئی طاقت دیکھنا ہمارے لئےخوشی کی بات ہے۔",
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
              'کبھی بھی اپنے بچے کو اونچائی  والی جگہوں پر جیسے صوفہ، بستر، کرسی، میز پر اکیلا نہ چھوڑیں۔ بچہ گر سکتا ہے، جس سے شدید چوٹ لگ سکتی ہے۔',
              'اپنے بچے کے سر اور گردن کی حفاظت کریں، خاص طور پر بچے کو اٹھاتے ہوئے۔ بچے کو اٹھانے میں لاپرواہی ریڑھ کی  ہڈی پر چوٹ کا سبب بن سکتی ہے جو بچے کی ذہنی اور جسمانی نشوونما پر منفی اثر ڈال سکتی ہے۔'
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_16_55.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    } else if (day == 3) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "آپ کا بچہ اب اپنے ہاتھ میں پکڑے ہوئے چیزوں کو غور سے دیکھتا ہے اور ان کے ساتھ کھیلنے کی کوشش کرتا ہے۔ یہ اس کے ہاتھوں کی مہارت اور دماغی نشوونما کی علامت ہے۔",
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
              'بچے کے ساتھ کھیلیں تاکہ اس کی صلاحیتوں کو مزید فروغ ملے۔',
              'اسے محفوظ اور دلچسپ کھلونے دیں تاکہ وہ مزید سیکھ سکے۔',
              'کھیل بچوں میں تجسس کو بڑھاتے ہیں جو ابتدائی سیکھنے کے لیے اہم ہے۔',
              'یہ والدین کو بچے کے ساتھ معیاری وقت گزارنے کا موقع دیتا ہے، جو بچے کی سماجی اور جذباتی نشوونما کے لیے ضروری ہے۔'
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/week_16_56.png',
                  fit: BoxFit.cover,
                  height: 170,
                  width: 170,
                ),
                Image.asset(
                  'assets/images/week_16_56_1.png',
                  fit: BoxFit.cover,
                  height: 170,
                  width: 170,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      );
    } else if (day == 5) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "کیا آپ نے سنا؟ آپ کا بچہ اب آوازیں نکالتے ہوئے ببلنگ کرنے لگا ہے۔ آپ کا بچہ اب ہنسنا شروع کر چکا ہے ۔ اس کے یہ ننھے ننھے الفاظ  اور اس کی یہ معصوم ہنسی آپ کے دل کو خوشی سے بھر دے گی۔",
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
              'اس سے بات کریں اور اسے پیار سے جواب دیں تاکہ اس کی زبان کی مہارت میں اضافہ ہو۔',
              'اپنے کام کے دوران بھی بچے سے باتیں کریں۔یہ بچے کی دماغی نشوونما اور زبان سیکھنے کی صلاحیت کو بڑھاتا ہے۔',
              'آپ کا بچہ خوب ترقی کر رہا ہے، اور آپ اس کے لیے سب سے بڑی طاقت  ہے۔ '
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/week_16_57.png',
                  fit: BoxFit.cover,
                  height: 170,
                  width: 170,
                ),
                Image.asset(
                  'assets/images/week_16_57_1.png',
                  fit: BoxFit.cover,
                  height: 170,
                  width: 170,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
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
