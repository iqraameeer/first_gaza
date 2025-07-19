import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek24DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek24DetailScreen({
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
                                ? "بچے کی جسمانی نشونما"
                                : selectedDay == 3
                                    ? "بچے کی سمجھنے  اور زبان سیکھنے کی نشونما"
                                    : selectedDay == 5
                                        ? "بچے کی سمجھنے  اور زبان سیکھنے کی نشونما"
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
            BulletList(items: [
              'آپ کا چھوٹا بچہ ہر دن اپنے بارے میں نئی دریافت کر رہا ہے۔',
              'وہ اب اپنے پیروں کو پکڑ کر کھیل سکتا ہے۔ یہ اس کی حرکت اور تجسس کو ظاہر کرتا ہے۔',
              'وہ کچھ دیر کے لیے بغیر سہارا دیے بیٹھ بھی سکتا ہے۔',
              'یہ وقت اس کی نشوونما کا حصہ بننے  اور  خوشی منانے کا ہے۔'
            ]),
            SizedBox(height: 10),
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
              'اس کے اردگرد نرم تکیے رکھیں تاکہ وہ محفوظ رہے ۔',
              'اسے نرمی سے حوصلہ دیں اور اس کے ساتھ خوشی منائیں، کیونکہ یہ لمحے ہمیشہ کے لیے یادگار ہیں۔'
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_24_79.png',
              fit: BoxFit.cover,
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
            BulletList(items: [
              'آپ کا بچہ آوازوں کی نقل کرنا شروع کر رہا ہے۔  یہ اس کے  بولنے کی صلاحیت کی طرف ایک خوبصورت قدم ہے۔',
              'وہ اب فاصلے پر چیزوں اور لوگوں پر اپنی نظر جمائے رکھ سکتا ہے۔ یہ اس کی ذہنی نشوونما کا ایک اہم حصہ ہے۔'
            ]),
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
              'اس سے زیادہ بات کریں، گائیں، اور گود میں رکھ کر محبت بھرے الفاظ بولیں۔ آپ کا ردعمل اسے زیادہ بولنے کی ترغیب دے گا۔',
              'اس کے اردگرد مختلف رنگ برنگی اشیاء اور لوگوں کو متعارف کروائیں تاکہ وہ مزید سیکھ سکے اور لطف اٹھا سکے۔'
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_24_80.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    } else if (day == 5) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              'آپ کا بچہ آپ کے ساتھ بات چیت کرتا ہے اور  آپ کو پہچانتا ہے ۔',
              'یہ لمحہ واقعی خاص ہے! یہ آپ کے درمیان مضبوط رشتہ قائم کرنے کا وقت ہے۔',
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
              "اس سے پیار کریں، اسے گود میں لیں، اور اس کے ساتھ کھیلیں۔",
              "یہ آپ کے بچے کے جذباتی اور سماجی  نشوونما  میں اہم کردار ادا کرے گا۔"
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_24_81.png',
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
