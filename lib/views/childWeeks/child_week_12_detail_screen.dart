import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek12DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek12DetailScreen({
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
                                ? "بچے کی سمجھنے کی صلاحیت"
                                : selectedDay == 3
                                    ? "بچے کی جسمانی نشونما"
                                    : selectedDay == 5
                                        ? "سمجھنے اور زبان سیکھنے کی صلاحیت"
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
              'اس ہفتے ہم آپ سے بچے کی نشوونما پر کچھ بات کرتے ہیں۔ ',
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              'آپ کا بچہ اب آپ  کی آواز  کی سمت میں چہرہ موڑتا ہے۔ ',
              'یہ اس بات کا ثبوت ہے کہ وہ آپ کو پہچانتا اور پسند کرتا ہے۔ '
            ]),
            Text(
              'یاد رکھیں!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              'یہ ایک خاص تعلق ہے جسے آپ روزمرہ کے پیار اور وقت کے ذریعے مزید مضبوط کر سکتے ہیں۔',
              'بچے کی ان چھوٹی چھوٹی کامیابیوں پر فخر کریں اور اپنی محبت اور توجہ سے اس کے سفر کو خوشگوار بنائیں۔',
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_12_43.png',
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
            BulletList(items: [
              'کیا آپ نے دیکھا کہ آپ کا بچہ اب چیزوں کو پکڑنے کی کوشش کر رہا ہے؟ ',
              'اب وہ زیادہ متحرک ہو رہا ہے اور ہاتھ پاؤں زور سے ہلاتا ہے۔یہ اس کی نشوونما کا ایک خوبصورت حصہ ہے۔  '
            ]),
            Text(
              'یاد رکھیں!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              'اسے چھوٹے اور محفوظ کھلونے دیں تاکہ وہ اپنی دنیا کو مزید دریافت کر سکے۔',
              'ایسے کھلونوں کا تعارف کروائیں جنہیں آپ کا بچہ ہلا سکے اور جن سے خوشگوار آوازیں نکلتی ہوں۔',
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_12_44.png',
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
              'آپ کا بچہ اب مختلف آوازوں پر دھیان دیتا ہے اور  آپ  کی آواز سن کر خوش ہوتا ہے۔ ',
              'آپ کا بچہ اپنی نظر آپ پر مرکوز کرتا ہے۔  '
            ]),
            Text(
              'یاد رکھیں!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "بچے کے \"کو کو\" اور مختلف آوازیں نکالنے پر خوش ہوں! ",
              "یہ اس کی بات چیت شروع کرنے کی کوشش ہے۔ ",
              "اس کے ساتھ بات کریں اور اس کے جواب میں مسکرائیں۔ ",
              "اپنے بچے کے ساتھ آنکھوں سے آنکھیں ملانے کے مواقع پیدا کریں۔ ",
              "آپ کی آواز اور موجودگی اس کے لیے سب کچھ ہے۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_12_45.png',
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
