import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek29DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek29DetailScreen({
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
                                ? "مبارک ہو،  آپ کا بچہ7   ماہ کے سنگ میل(milestone) کو پہنچ گیا ہے! بچے کو اضافی غذا کے ساتھ ماں کا دودھ  پلائیں"
                                : selectedDay == 3
                                    ? "بچے کو کھانے میں فنگر فوڈز متعارف کرائیں"
                                    : selectedDay == 5
                                        ? "کون سے فنگر فوڈز بچے کو دیے جا سکتے ہیں؟"
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
              "مبارک ہو! آپ کا بچہ سات ماہ مکمل کر کے آٹھویں مہینے میں داخل ہو چکا ہے۔ ہم امید کرتے ہیں کہ آپ نے اپنے بچے کے لیے مناسب اور متوازن غذا کا آغاز کر لیا ہوگا۔"
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
            BulletList(items: [
              'بچے کو اپنا دودھ پلانا جاری رکھیں۔ ماں کا دودھ بچے کو بیماریوں سے بچاتا  ہے۔',
              'آپ  کی آسانی اور رہنمائی کے لیے ہم آپ سے چھ سے آٹھ مہینے کے بچوں کے لیے مزیدار اور غذائیت سے بھرپور کھانوں کی ترکیبیں شیئر کر رہے ہیں۔ امید ہے کہ یہ آپ کو بچے کے اضافی غذا تیار کرنے میں مددگار ثابت ہوں گی۔',
            ])
          ],
        ),
      );
    } else if (day == 3) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const BulletList(items: [
              "انشاءاللہ آپ کا بچہ کچھ ہی عرصے میں اپنے ننھے منے انگلیوں اور ہاتھوں سے کھانے کو پکڑنے اور منہ میں ڈالنے کی کوشش شروع کر لے گا۔",
              "اس مرحلے میں بچے چھوٹے اور نرم کھانے کی اشیاء جو وہ آسانی سے خود اپنے ہاتھوں سے پکڑ سکے یعنی فنگر فوڈز، کھانے کے لیے تیار ہوتے ہیں۔",
              " آپ کی رہنمائی کے لئے ہم کچھ فنگر فوڈز کی تصاویر آپ کے ساتھ شیئر کر رہے ہیں۔",
            ]),
            Image.asset(
              "assets/images/child_week_29.png",
            ),
          ],
        ),
      );
    } else if (day == 5) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "نرم روٹی یا چپاتی کے چھوٹے ٹکڑے۔",
              "اچھی طرح پکا ہوا pasta یا چاول۔",
              "بغیر ہڈی کے نرم پکا ہوا مرغی کا گوشت۔",
              "نرم اسکرامبلڈ انڈے یا آملیٹ کی پتلی سلائسز۔",
              "نرم پنیر یا پینیر کے چھوٹے ٹکڑے۔",
              "بھاپ یا ابلی ہوئی سبزیاں جیسے گاجر، میٹھے آلو، یا گوبھی کے پھول۔",
              "نرم پھل جیسے کیلا، پکے ہوئے یا بھاپ میں پکائے ہوئے سیب کے ٹکڑے۔"
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
              "کھانے کو چھوٹے اور آسان ٹکڑوں میں تقسیم کریں تاکہ بچہ آسانی سے پکڑ سکے۔",
              "بچے کی دلچسپی برقرار رکھنے کے لیے کھانے کی اشیاء کی مختلف ساخت اور ذائقے پیش کریں۔"
            ])
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
