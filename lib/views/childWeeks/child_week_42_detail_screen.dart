import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import '../../widget/text_bullet_widget.dart';

class ChildWeek42DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek42DetailScreen({
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
                                ? "کھانے میں وٹامن سی والی سبزیوں اور پھل کا استعمال کریں"
                                : selectedDay == 3
                                    ? "بچوں کے دانتوں کو صاف رکھیں"
                                    : selectedDay == 5
                                        ? "بچے کے آس پاس چھوٹی چھوٹی اشیاء نہ رکھیں"
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
              "وٹامن سی  بچے کے جسم میں  آئرن کے جذب  ہونے کو بڑھاتی ہیں ۔",
              "وٹامن سی والی سبزیوں اور پھل جیسے کہ ٹماٹر، اسٹرابیری، مالٹے، آم ،انناس (پائن ایپل) کو بچے کی غذا میں شامل کریں تاکہ بچے کو وٹامن سی کی کافی مقدار مل سکے۔",
            ]),
          ],
        ),
      );
    } else if (day == 3) {
      return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            BulletList(items: [
              'دس ماہ کی عمر میں بھی بچے کےنئے دانت آنا جاری رہتے ہیں۔',
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
              'باقاعدگی سے اپنے بچے کے دانتوں کو صاف پانی سے برش کریں۔',
              'ٹوتھ پیسٹ کا استعمال اس وقت تک نہ شروع کریں جب تک بچہ اتنا سمجھدار نہ ہو جائے کہ ٹوتھ پیسٹ کو نگلنے کے بجائے منہ سے باہر کلی کرنے لگے۔',
            ]),
          ]));
    } else if (day == 5) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "چھوٹی  چیزیں جیسے کہ پن، بٹن، سکّہ، چھالیہ، تسبیح کے دانے بچے کے پاس نہ رکھیں کیونکہ آپ کا بچہ انگلیوں سے چھوٹی اشیاء اٹھا کر منہ میں ڈال سکتا ہے۔",
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
              "یہ چیزیں بچے کے گلے یا سانس کی نالی میں پھنس سکتی ہیں اور  بچے کے لئے بہت ہی خطرناک صورتحال ہو سکتی ہے۔",
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
