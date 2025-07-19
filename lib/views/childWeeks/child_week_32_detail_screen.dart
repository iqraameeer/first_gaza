import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek32DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek32DetailScreen({
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
                                ? "بچے کی جسمانی نشونما"
                                : selectedDay == 3
                                    ? "بچے کی  زبان سیکھنے اور سمجھنے کی صلاحیت"
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

  // Function to build content based on selected week and day
  Widget _buildContentForSelectedDay(int day) {
    if (day == 1) {
      return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "آپ کا بچہ اب بیٹھنے کی پوزیشن سے آگے بڑھ کر رینگنے کی تیاری کر رہا ہے۔ یہ اس کی جسمانی مضبوطی اور حرکت کی آزادی کا پہلا قدم ہے۔",
              "آپ کا بچہ اب ایک ہاتھ سے دوسرے ہاتھ میں چیزیں منتقل کرنے کے قابل ہو رہا ہے۔ یہ اس کی ہم آہنگی اور کنٹرول کو بہتر بنا رہا ہے۔",
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
              "اپنے بچے کی حفاظت کا خیال رکھیں، خاص طور پر جب وہ رینگنے کی کوشش کر رہا ہو۔",
              "اسے نرم اور محفوظ جگہ پر رینگنے کا موقع دیں تاکہ وہ اپنی نئی مہارت کو مزید بہتر بنا سکے۔",
              "اسے چھوٹے، محفوظ اور مختلف اشکال والے کھلونے دیں تاکہ وہ مزید سیکھ سکے۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_32_103.png',
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
              "آپ کا بچہ اب اپنے پہلے لفظوں کی شروعات کر رہا ہے، جیسے 'ما'، 'با' یا 'دا'۔",
              "آپ کا بچہ گِری ہوئی چیزوں کو تلاش کرنا شروع کر رہا ہے۔",
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
              "اس کے ساتھ بات کریں، الفاظ دہرانے کی حوصلہ افزائی کریں ۔",
              "اس کے ساتھ کھلونوں یا چیزوں کو تلاش کرنے والے کھیل کھیلیں تاکہ اس کا ذہنی نشوونما بہتر ہو۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_32_104.png',
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
              "اجنبیوں کی موجودگی میں آپ کا بچہ آپ سے لپٹ سکتا ہے، جو اس کے جذباتی تعلق اور آپ پر انحصار کو ظاہر کرتا ہے۔",
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
              "بچے کے ساتھ وقت گزاریں  اور کھیل کھیلیں ہر قدم پر اس کی حوصلہ افزائی کریں۔",
              "آپ کی محنت اور پیار سے آپ کا بچہ نئی کامیابیاں حاصل کر رہا ہے۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_32_105.png',
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
