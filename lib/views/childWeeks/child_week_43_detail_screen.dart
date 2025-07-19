import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek43DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek43DetailScreen({
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
                                ? "بچے کی جسمانی نشونما : موٹے پٹھوں کی صلاحیت (Gross Motor)"
                                : selectedDay == 3
                                    ? "بچے کی جسمانی نشونما : باریک پٹھوں کی صلاحیت (Fine Motor)"
                                    : selectedDay == 5
                                        ? "اپنے گھر کو بچے کے لئے محفوظ  بنائیں"
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
            BulletList(items: [
              "آپ کا بچہ فرنیچر کا سہارا لے کر سائیڈ پر چلنے کی کوشش کر رہا ہے۔",
              "یہ اس کے چلنے کی مہارت میں ایک اہم قدم ہے۔",
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
              "آپ اسے محفوظ جگہ پر فرنیچر کا سہارا لے کر چلنے دیں تاکہ اس کی حوصلہ افزائی ہو۔",
            ]),
          ],
        ),
      );
    } else if (day == 3) {
      return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            BulletList(items: [
              'آپ کا بچہ چیزوں کو ایک برتن یا کنٹینر میں ڈالنے کی کوشش کر رہا ہے۔',
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
              'اسے ایسے کھلونے یا برتن دیں جن میں وہ اشیاء ڈال سکے اور نکال سکے۔',
              'یہ اس کے ہاتھوں اور آنکھوں کے رابطے کو مضبوط کرے گا۔',
            ]),
          ]));
    } else if (day == 5) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "اب جبکہ آپ کا بچہ کھڑا ہونے اور چلنے کی کوشش کر رہا ہے، آپ کو ان کی حفاظت کا خیال رکھنا ہوگا۔",
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
              "کھلی سیڑھیاں، بالکونیاں اور کھڑکیوں کو حفاظتی گیٹ کے ذریعے محفوظ کریں تاکہ بچے کو گرنے کا خطرہ نہ ہو۔",
              "فرنیچر کے نوکیلے کناروں کو کپڑے یا پلاسٹک کور  (cover)سے ڈھانپیں۔",
              "تمام دوائیں، صفائی کے کیمیکل، اور الیکٹرانک آلات کو محفوظ جگہ پر رکھیں جہاں بچہ نہ پہنچ سکے۔",
              "گھر میں چھوٹے یا چبانے والی اشیاء کو بچے کی پہنچ سے دور رکھیں تاکہ بچہ ان کو نگل نہ لے یا ان سے زخمی نہ ہو۔",
              "فرش پر غیر ضروری اشیاء نہ رکھیں اور صاف ستھرا رکھیں تاکہ کوئی خطرہ نہ ہو۔",
              "فرش پر پھسلنے والے میٹ استعمال نہ کریں تاکہ بچے کی حرکت محفوظ رہے۔",
              "بچے کو اکیلا نہ چھوڑیں ۔ ہر لمحہ نظر رکھیں تاکہ آپ فوری طور پر اس کی مدد کر سکیں۔",
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
