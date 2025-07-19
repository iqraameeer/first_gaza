import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek18DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek18DetailScreen({
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
                                ? "والدین ایک دوسرے کی مدد کریں"
                                : selectedDay == 3
                                    ? "شوہر گھریلو کاموں میں مدد کریں"
                                    : selectedDay == 5
                                        ? "اہلیہ کا خیال رکھیں !"
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
              "بہت باتیں آپ سے ہوئیں ہیں، چلیں اس ہفتے کچھ باتیں والد سے بھی کرتے ہیں۔",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              'آپ کی اہلیہ نے پچھلے 5 مہینوں میں آپ کے بچے کی دیکھ بھال اور پرورش میں بے حد محنت کی ہے۔ آپ کی گھر کے کاموں میں اپنی اہلیہ کی مدد  نہ صرف آپ کی اہلیہ کا بوجھ کم کرے گی بلکہ یہ آپ کے تعلق کو مضبوط کرے گی۔ جب آپ ایک دوسرے کا ساتھ دیتے ہیں تو محبت اور اعتماد بڑھتا ہے۔ ',
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
              'ایک مضبوط خاندان وہی ہوتا ہے جہاں دونوں میاں بیوی ایک دوسرے کا سہارا بنتے ہیں۔',
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
              "شوہر  مختلف  چھوٹے چھوٹے کاموں میں مدد کریں جیسے کھانے کی تیاری،  گھر  کی صفائی یا بچے کو سنبھالنا۔ یہ نہ صرف ماں کو آرام کرنے کا موقع دے گا بلکہ  ماں سکون سےدودھ پلانے پر توجہ  دے سکے گی۔",
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
              'بچے کو پالنا اور اس کی تربیت  کرنا  ماں اور باپ دونوں کی ذمہ داری ہے۔  ',
              'والدین کا تعلق  گھریلو ذمہ داریاں بانٹنے اور بچوں کے ساتھ معیاری وقت گزارنے سے مزید مضبوط  ہوتا ہے ۔'
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
              "بچے کو دودھ پلانے کے دوران اپنی اہلیہ کے لیے پانی، ہلکی پھلکی غذا یا تکیے فراہم کریں تاکہ وہ سکون سےدودھ پلانے پر توجہ دے سکیں۔",
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
              'آپ کی چھوٹی سی مدد نہ صرف آپ کی اہلیہ کے لیے خوشی کا باعث بنے گی بلکہ آپ کے بچے کی نشوونما اور آپ کے رشتے کے لیے بھی فائدہ مند ہوگی۔',
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
