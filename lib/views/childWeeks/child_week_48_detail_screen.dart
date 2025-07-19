import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek48DetailScreen extends StatelessWidget {
  final int selectedDay;

  ChildWeek48DetailScreen({
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
                                ? "بچے کی جسمانی نشونما: باریک پٹھوں کی صلاحیت (Fine Motor)"
                                : selectedDay == 3
                                    ? 'بچے کی سمجھنے کی صلاحیت'
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
                const SizedBox(height: 10),
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
              'آپ کا بچہ اب دونوں ہاتھوں سے مگ پکڑ کر پانی یا دودھ پی سکتا ہے۔',
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
              " اسے بچوں کے لیے مخصوص ہلکے اور محفوظ مگ دیں تاکہ وہ اس مہارت کو بہتر بنا سکے۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_48_151.png',
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
              " ذہنی  نشوونما  (Cognitive):",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              'اب آپ کا بچہ کتاب میں موجود تصاویر کو دیکھنے اور پہچاننے میں دلچسپی لیتا ہے۔',
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
              "  اسے رنگین کتابیں دکھائیں اور اس کے ساتھ تصاویر کے بارے میں بات کریں۔",
              " یہ اس کی ذہنی نشوونما کے لیے بہت فائدہ مند ہے۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_48_152.png',
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
              "آپ کا بچہ اس وقت بےچین ہوتا ہے جب آپ اس کی نظروں سے اوجھل ہوتی ہیں۔ ",
              "یہ اس کی آپ سے گہری محبت اور وابستگی کو ظاہر کرتا ہے۔",
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
              "جب بھی ممکن ہو، اسے قریب رکھیں اور جب آپ دور جائیں تو اسے تسلی دیں کہ آپ واپس آئیں گی۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_48_153.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "مبارک ہو!",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'JameelNoori'),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "ہماری ٹیم کی طرف سے آپ کو اپنے بچے کی پہلی سالگرہ بہت بہت مبارک ہو۔ ہم دعا گو ہیں کہ آپ اور آپ کی فیملی صحت مند رہیں۔ ہم آپ کے بہت مشکور ہیں کہ اس سفر میں آپ نے ہمارا ساتھ دیا۔ ہم امید کرتے ہیں کہ آپ کو جو معلومات اس ایک سال میں مہیا کی گئی وہ آپ کے بچے کے لیے فائدہ مند ثابت ہوئیں گی۔ اپنے بچے اور فیملی کا بہت خیال رکھیں۔ اللہ حافظ!",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
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
