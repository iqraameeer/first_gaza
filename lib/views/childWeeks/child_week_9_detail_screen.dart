import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek09DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek09DetailScreen({
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
                                ? "آپ کا بچہ2 ماہ کے سنگ میل(milestone) کو پہنچ گیا ہے!\nصرف ماں کا دودھ پلائیں"
                                : selectedDay == 3
                                    ? "ماں کی ذہنی صحت"
                                    : selectedDay == 5
                                        ? "اپنے بچے سے باتیں کریں"
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
    String text_day_1 =
        "مبارک ہو! یہ آپ کی محبت، محنت اور دیکھ بھال کا نتیجہ ہے۔ آپ ایک شاندار ماں ہیں اور آپ کا کام واقعی قابلِ تعریف ہے۔";

    String text_day_5 =
        "اس عمر میں بچہ آوازوں کی طرف متوجہ ہوتا ہے، اور مختلف آوازوں پر ردعمل ظاہر کر سکتا ہے۔";

    if (day == 1) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text_day_1,
              style: const TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),
            const Text(
              'یاد رکھیں !',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const BulletList(items: [
              'بچے کو چھ مہینے تک صرف ماں کا دودھ پلائیں کیونکہ یہ بچے کی نشوونما اور مدافعتی نظام کے لیے ضروری تمام غذائی اجزاء فراہم کرتا ہے۔',
              'پانی، شہد، چائے، جوس یا کسی بھی قسم کی نیم ٹھوس غذائیں چھ مہینے سے پہلے مت دیں کیونکہ اس سے بچے کو ہاضمے کے مسائل اور غذائی کمی ہوسکتی ہے۔'
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
            const Text(
              "یاد رکھیں !",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const BulletList(items: ['اپنی ذہنی صحت کا خاص خیال رکھیں۔']),
            _buildLists([
              'اپنی نیند پر توجہ دیں ۔کوشش کریں جب بچہ سوئے تو آپ بھی آرام کریں اور اپنی نیند پوری کریں۔',
              'گہرے سانس لینے کی مشقیں کریں۔یہ آپ کے لیے مفید ہوگی۔'
            ]),
            const BulletList(items: [
              'اگر تھکن یا بےچینی محسوس ہو تو خاندان کے افراد یا قریبی دوستوں سے مدد طلب کریں۔',
              'ایک خوش اور صحت مند ماں ہی اپنے بچے کی بہتر دیکھ بھال کر سکتی ہے۔'
            ])
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
              text_day_5,
              style: const TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "یاد رکھیں !",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const BulletList(items: [
              'اپنے بچے  کے ساتھ وقت گزاریں ۔  اس کے ساتھ بات کریں، مسکرائیں، اور اسے اپنی آواز سے تسلی دیں۔',
              'آپ   خوش اور مطمئن رہیں گی جو آپ کی ذہنی صحت کے لئے  ضروری ہیں۔   '
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

  Widget _buildLists(List<String> items) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(children: [
                          const TextSpan(
                              text: '\u25CB ', // Empty bullet point
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              )),
                          TextSpan(
                              text: item,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'JameelNoori')),
                        ]),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
