import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek36DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek36DetailScreen({
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
              "آپ کا بچہ اب سہارا لے کر خود کھڑا ہونے کی کوشش کر رہا ہے۔",
              "آپ کا بچہ دونوں ہاتھوں میں چیزیں پکڑ کر انہیں آپس میں جوڑنے کی کوشش کرتا ہے۔",
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
              "بچے کو محفوظ جگہ پر کھڑا ہونے کی حوصلہ افزائی کریں تاکہ وہ اپنی ٹانگوں کو مضبوط کر سکے۔",
              "نرم اور ہلکی چیزیں بچے کو دیں تاکہ وہ ان کے ساتھ کھیل کر اپنی صلاحیتوں کو مزید بہتر بنا سکے۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_36_115.png',
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            BulletList(items: [
              "آپ کا بچہ اب کئی الفاظ دہرانے کی کوشش کر رہا ہے۔",
              "آپ کا بچہ اب آدھی چھپی ہوئی چیزوں کو تلاش کرنے کی کوشش کر رہا ہے۔",
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
              "جب وہ آواز نکالے، تو اس کے ساتھ بات کریں اور اس کی آوازوں کی نقل کریں تاکہ اس کی  بولنے کی صلاحیت میں میں مدد ہو۔",
              "چھوٹے چھوٹے کھیل جیسے چیزوں کو چھپا کر دوبارہ دکھانے کا کھیل کھیلیں تاکہ اس کی دلچسپی بڑھے۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/week_36_116.png',
              fit: BoxFit.cover,
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
              "آپ کا بچہ اب اپنے ہاتھوں سے کھانے کی کوشش کرتا ہے، جیسے فنگر فوڈ کو خود سے پکڑنا اور اپنے منہ میں ڈالنا۔",
              "یہ ایک شاندار مرحلہ ہے اور آپ کے بچے کی بہترین نشوونما کی مثال ہیں۔",
            ]),
            SizedBox(
              height: 10,
            ),
            BulletList(items: [
              'آپ کی یہ محنت ایک مضبوط، صحت مند اور خوش بچہ پروان چڑھانے میں اہم کردار ادا کرے گی ۔'
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
              "اس کی خود مختاری کی حوصلہ افزائی کریں۔",
              "بچے کو صاف ستھری اور نرم چیزیں کھانے کے لیے دیں۔",
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/week_36_117.png',
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
