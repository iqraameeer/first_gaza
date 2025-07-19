import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek31DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek31DetailScreen({
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
                                ? "بچے کی صفائی کا خاص خیال رکھیں"
                                : selectedDay == 3
                                    ? "ماں  کی صحت بہت ضروری ہے"
                                    : selectedDay == 5
                                        ? "اپنے بچے  کے ساتھ وقت گزاریں"
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
              "کرنے والے کام (Do’s):",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            TickmarkList(items: [
              "دن میں کم از کم ایک بار نہلائیں۔",
              "بچے کے کان اور ناک کو صاف کریں۔",
              "بچے کے ناخنوں کو چھوٹے رکھیں تاکہ وہ خود کو یا دوسروں کو نہ خراشیں۔",
              "بچے کے کھلونے وقتاً فوقتاً دھوئیں تاکہ ان پر جراثیم نہ بڑھیں۔",
              "بچے کا ڈائپر وقت پر تبدیل کریں۔",
              "بچے کے نازک حصوں کو صابن اور صاف پانی سے دھوئیں۔",
              "خشک کرنے کے بعد صاف ڈائپر پہنائیں، اس سے نیپی ریش سے بچاؤ ہوتا ہے۔",
            ]),
          ],
        ),
      );
    } else if (day == 3) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "ہم آپ کی تھکن سمجھ سکتے ہیں اس لیے اپنی جسمانی اور ذہنی صحت کا خیال رکھیں۔",
              "خود کے لیے وقت نکالیں۔ نیند پوری کریں اور صحت بخش غذا کھائیں۔",
              "ایک صحت مند ماں ہی ایک صحت مند بچے کی پرورش کر سکتی ہے۔",
              "اگر stress محسوس کریں، تو اپنے شوہر، خاندان، یا دوستوں سے مدد لیں۔",
              "آپ کی محنت قابل تعریف ہے لیکن سپر ماں بننے کی ضرورت نہیں ہے۔",
            ]),
          ],
        ),
      );
    } else if (day == 5) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
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
              "اپنے بچے سے باتیں کریں، مسکرائیں، اور اسے اپنی آواز سے تسلی دیں۔",
              "اس عمر میں بچہ آوازوں کی طرف متوجہ ہوتا ہے، اور مختلف آوازوں پر ردعمل ظاہر کر سکتا ہے۔",
              "آپ خوش اور ذہنی طور پر مطمئن رہیں گی۔",
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
