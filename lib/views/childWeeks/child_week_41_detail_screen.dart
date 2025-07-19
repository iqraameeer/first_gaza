import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek41DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek41DetailScreen({
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
                                ? "مبارک ہو،  آپ کا بچہ 10 ماہ کے سنگ میل(milestone) کو پہنچ گیا ہے!"
                                : selectedDay == 3
                                    ? "بچے کو کھانے کے وقت خاندان کے ساتھ شامل کریں"
                                    : selectedDay == 5
                                        ? "بچے کی خود کھانے کی حوصلہ افزائی کریں"
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
              "ماشاءاللہ !آپ کا بچہ گیارھویں مہینے میں داخل ہو چکا ہے ۔ آپ کی محبت اور دیکھ بھال  کی وجہ سے  آپ کا بچہ صحت مند ہے۔",
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
              "ماں کا دودھ  بچے کو  پلانا جاری رکھیں کیونکہ اب بھی  یہ بچے کے لیے غذائیت اور  قوتِ مدافعت کا اہم ذریعہ ہے۔",
              "ماں کا دودھ 2 سال  کی عمر تک بچے کو پلائیں ۔",
              "بچے کو دن میں تین سے چار غذائی کھانے اور  ایک سے دو  صحت مند اسنیکس فراہم کریں۔",
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
              'جب بچہ خاندان کے ساتھ کھانا کھاتا ہے، تو  بچے کو خاندان کے افراد کے ساتھ گھلنے ملنے کا موقع ملتا ہے ۔',
              'بچہ  اپنے بہن بھائیوں کے رویے سے سیکھتا ہے۔',
              'بچے کی ذہنی اور جذباتی نشوونما پر مثبت اثر پڑتا ہے۔',
              'وہ خود کو زیادہ محفوظ اور مطمئن محسوس کرتا ہے۔',
            ]),
          ]));
    } else if (day == 5) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "بچے کو ایسے کھانے  دیں جو پکڑنے میں آسان ہوں تاکہ وہ خود سے کھانا سیکھے ۔",
              "خود سے کھانے سے بچے کی خود مختاری اور موٹر مہارتوں کو فروغ ملتا ہے۔",
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
              "کھانے کے دوران ہمیشہ بچے کو  نگرانی میں رکھیں تاکہ  کھانے کے سانس کی نالی کے خطرے سے بچا جا سکے۔",
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
