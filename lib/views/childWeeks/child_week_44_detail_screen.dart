import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek44DetailScreen extends StatelessWidget {
  final int selectedDay;
  ChildWeek44DetailScreen({
    Key? key,
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
                                ? "بچے کی  زبان سیکھنے صلاحیت"
                                : selectedDay == 3
                                    ? "بچے کی  سمجھنے کی صلاحیت"
                                    : selectedDay == 5
                                        ? "بچے کی جذباتی اور  سماجی نشونما"
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

  Widget _buildContentForSelectedDay(int day) {
    if (day == 1) {
      return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              " زبان کی مہارت (Language):",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              'آپ کا بچہ اب آسان ہدایات پر عمل کر سکتا ہے، جیسے "گیند دو" یا "یہاں آؤ"۔',
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
              "اس کے ساتھ بات کریں اور اسے آسان اور محبت بھرے الفاظ میں ہدایات دیں۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_44_139.png',
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              " ذہنی  نشونما  (Cognitive):",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              'اب آپ کا بچہ اپنی پسندیدہ چیز کی طرف اشارہ کر کے اپنی خواہش ظاہر کر سکتا ہے۔',
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
              'جب وہ کسی چیز کی طرف اشارہ کرے تو اس کی خواہش کو پہچانیں اور اس کے ساتھ بات کریں، مثلاً "تم گیند چاہتے ہو؟"۔',
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_44_140.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ]));
    } else if (day == 5) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "آپ کا بچہ وہ عمل دہراتا ہے جس کی آپ تعریف کرتی ہیں۔",
            ]),
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
              "جب وہ کچھ اچھا کرے، تو اس کی تعریف کریں۔",
              "یہ اس کی خود اعتمادی کو بڑھائے گا اور آپ کے تعلق کو مضبوط کرے گا۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_44_141.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
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
