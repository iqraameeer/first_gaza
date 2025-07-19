import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek20DetailScreen extends StatelessWidget {
  final int selectedDay;
  ChildWeek20DetailScreen({
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
                                    ? "بچے کی سمجھنے کی صلاحیت"
                                    : selectedDay == 5
                                        ? "بچے کی زبان سیکھنے کی نشونما  "
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "پچھلے پیغام میں آپ کو بچے کی  دیکھنے اور سننے کی نشونما کے کچھ مراحل بتائے گئے تھے۔ آج  جسمانی نشوونما   کے بارے میںباتیں آپ سے شیئر کرتے ہیں۔",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "یاد رکھیں!",
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              'یہ اس کی بڑھتی ہوئی مہارتوں اور دلچسپی کو ظاہر کرتا ہے۔',
              'اسے محفوظ اور دلچسپ چیزیں دیں تاکہ وہ دریافت کر سکے۔',
              'کبھی بھی اپنے بچے کو اونچائی  والی جگہوں پر جیسے صوفہ، بستر، کرسی، میز پر اکیلا نہ چھوڑیں۔ بچہ گر سکتا ہے، جس سے شدید چوٹ لگ سکتی ہے۔'
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_20_67.png',
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "اب آپ کا بچہ پیش کی گئی چیزوں کو دریافت کرنے میں دلچسپی لے گا۔ یہ ظاہر کرتا ہے کہ وہ اپنی دنیا کے بارے میں جاننے کی کوشش کر رہا ہے۔ وہ آپ کی آواز کے لہجے کے مطابق ردعمل ظاہر کرے گا۔ یہ ظاہر کرتا ہے کہ وہ آپ کی محبت اور توجہ کو پہچانتا ہے۔",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "یاد رکھیں!",
              style: const TextStyle(
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
              'اسے محفوظ اور مختلف اشیاء فراہم کریں تاکہ وہ کھیلتے ہوئے سیکھ سکے۔',
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_20_68.png',
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "جب آپ اپنے بچے سے بات کرتی ہیں اور وہ ببلنگ کے ذریعے جواب دیتا ہے تو یہ اس کے بڑھتے ہوئے زبان کے ہنر کی علامت ہے۔",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "یاد رکھیں!",
              style: const TextStyle(
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
              'آپ کی گفتگو اس کے ذہن کو تحریک دے رہی ہے۔اسی طرح اپنے بچے سے باتیں جاری رکھیں۔',
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_20_69.png',
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
