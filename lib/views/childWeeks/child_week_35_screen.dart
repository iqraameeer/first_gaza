import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek35DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek35DetailScreen({
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
                                ? "بچے کو کھانا کھلانے کے بارے میں رہنمائی نہیں کرنے والے کام(Don'ts):"
                                : selectedDay == 3
                                    ? "والدین بچوں کی پیدائش میں  مناسب  وقفہ کے بارے میں بات کریں!"
                                    : selectedDay == 5
                                        ? "بچے کی پرورش اور والدین کی ذمہ داری!"
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
    if (day == 1) {
      return const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            WrongmarkList(items: [
              "کھانا کھلاتے وقت جلد بازی نہ کریں بلکہ بچے کو آرام سے اور صبر کے ساتھ کھانا کھلائیں۔",
              "بچے کو کھانے کے لئے مجبور نہ کریں، اس سے ان کی کھانے کی عادات خراب ہو سکتی ہیں۔",
              "بچے کو کھانے کے دوران دوسری سرگرمیوں میں مشغول نہ کریں، جیسے کہ ٹی وی دیکھنا یا کھیلنا۔",
              "اگر بچہ کھانے میں دھیان نہیں دیتا یا کھیلتا ہے، تو انہیں ملامت نہ کریں بلکہ پیار سے سمجھائیں۔",
            ]),
          ],
        ),
      );
    } else if (day == 3) {
      return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
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
              "بچوں کی  پیدائش میں کم از کم دو سال کا وقفہ رکھنا بہتر ہے۔",
              "پیدائش میں  وقفہ ماں کے جسم کو صحتیاب ہونے کا وقت دیتا ہے اور ماں کی ذہنی صحت بھی بہتر ہوتی ہے۔",
              "مناسب وقفہ کی وجہ سے ماں نوزائیدہ بچے کو زیادہ توجہ دےسکتی ہیں اور اگلے بچے کی بہتر طور پر دیکھ بھال کے قابل ہو جاتی ہیں۔",
            ]),
          ]));
    } else if (day == 5) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "بچہ ماں اور باپ دونوں کی ذمہ داری ہے ۔",
              "بچے کو محبت اور توجہ دیں اور  اس کی جذباتی ضروریات کو پورا کریں۔",
              "بچے کو محفوظ اور مثبت ماحول فراہم کریں تاکہ وہ خود اعتمادی کے ساتھ بڑھ سکیں۔",
            ]),
            Text(
              "یاد رکھیں! ",
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
              'آپ کی یہ محنت ایک مضبوط، صحت مند اور خوش بچہ پروان چڑھانے میں اہم کردار ادا کرے گی ۔'
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
