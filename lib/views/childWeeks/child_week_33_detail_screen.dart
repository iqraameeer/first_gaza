import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek33DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek33DetailScreen({
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
                                ? "مبارک ہو،  آپ کا بچہ8  ماہ کے سنگ میل(milestone) کو پہنچ گیا ہے!ماں کا دودھ اب بھی بچے کے لئے ضروری ہے"
                                : selectedDay == 3
                                    ? "بچے کے دانت نکلنے کے دوران کی ہدایات"
                                    : selectedDay == 5
                                        ? "اپنے بچے کو  چوسنی یا  بوتل   ہرگز نہ دیں"
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
            Text(
              "مبارک ہو!    ماشاءاللہ ، آپ کا بچہ  نویں مہینے میں داخل ہو چکا ہے ۔ یہ ایک خوشی کا لمحہ ہے !",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
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
              "ماں کا دودھ اب بھی بچے کی غذا کا ایک اہم حصہ ہے۔",
              "بچے کو کھانے میں مختلف غذائیں جیسے چاول، گندم ،دال، گوشت ،سبزیاں اور پھل  دیں تاکہ انہیں نشوونما کے لیے تمام ضروری وٹامنز اور معدنیات مل سکیں۔",
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
              "بچوں کے اوپر والے سامنے کے دانت عام طور پر تقریباً 6 سے 8 ماہ میں نکلتے ہیں۔ کچھ بچے دانت نکلنے کے دوران چڑچڑے ہو جاتے ہیں، ان کا کھانے اور سونے کا معمول خراب ہو سکتا ہے، اور کبھی کبھی ہلکا بخار بھی ہو سکتا ہے",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "کرنے والے کام (Do’s):",
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
              "بچے کے مسوڑھوں کو دن میں باقاعدگی سے صاف انگلی یا نرم کپڑے سے صاف کریں۔",
              "دانت نکلنے کے دوران زیادہ رال بہنے کی وجہ سے جلد صاف رکھیں تاکہ کوئی انفیکشن نہ ہو۔",
              "صاف اور محفوظ چبانے والے کھلونے دیں تاکہ بچے کو آرام ملے۔",
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
            BulletList(items: [
              "چوسنی کا استعمال دانتوں اور مسوڑھوں کی ساخت کو نقصان پہنچا سکتا ہے۔"
                  "بچے کی دودھ پینے کی عادت کو متاثر کر سکتا ہے۔"
                  "بوتل یا  چوسنی  کی صفائی مشکل ہوتی ہے اور یہ بچوں میں  دست کا باعث بن سکتی ہے۔"
            ]),
            Text(
              "کرنے والے کام (Do’s):",
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
              "اگر کبھی ضرورت پڑے تو اپنے بچے کو کپ کے ذریعے پلائیں، یہ زیادہ محفوظ اور صاف ستھرا طریقہ ہے۔",
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
