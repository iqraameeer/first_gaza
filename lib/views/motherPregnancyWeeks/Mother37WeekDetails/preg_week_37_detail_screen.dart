import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'preg_37_detail_controller.dart';

class PregWeek37DetailScreen extends StatelessWidget {
  final int selectedDay;

  const PregWeek37DetailScreen({
    Key? key,
    required this.selectedDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PregWeek37Controller controller = Get.put(PregWeek37Controller());

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
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 10),
                            child: Text(
                              selectedDay == 1
                                  ? "آپ کے آنے والے نئے مہمان کی آمد کے لیے دعائیں اور نیک خواہشات! بچے کو ماں کا دودھ پلائیں"
                                  : selectedDay == 3
                                      ? "ابتدائی دودھ پلانے کا آغاز:    پہلا دودھ (کولسٹرم)  کیا ہے؟"
                                      : selectedDay == 5
                                          ? "ودھ پلانے کے دوران بچے کاصحیح طریقے سے جڑنے یا اچھے اٹیچمنٹ (attachment) کا کیا مطلب ہے؟"
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
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child:
                          _buildContentForSelectedDay(selectedDay, controller),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentForSelectedDay(int day, PregWeek37Controller controller) {
    if (day == 1) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildList([
              'زچگی(delivery) کا وقت قریب ہے، اور یہ ایک اہم خوشی کا لمحہ ہے ۔',
              'آپ کے پاس اپنے بچے کو قدرت کا بہترین آغاز دینے کی صلاحیت ہے اور وہ ہے ماں کا دودھ۔  یہ وہ انمول تحفہ ہے جو صرف آپ دے سکتی ہیں!',
              'یہ صرف غذا نہیں بلکہ بچے کے لیے زندگی بھر کی صحت کے لئے بنیاد فراہم کرتا ہے۔  '
            ]),
            const SizedBox(height: 20),
            const Text(
              "یاد رکھیں! ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),
            _buildList([
              'ماں کا اپنا دودھ پلانا ایک قدرتی عمل ہے جو بچے کی پیدائش کے بعد شروع ہوتا ہے۔',
              'تو چلیں، اس ہفتے ہم ماں کے دودھ کے بارے میں بات  کرتے ہیں۔آج کی ویڈیو  میں ماں کے دودھ  کے بارے میں معلومات ہیں  اور ہم امید  کرتے ہیں کہ آپ کو کچھ نیا سیکھنے کو ملے گا۔'
            ]),
            const SizedBox(height: 20),
            Container(
              height: 300,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: WebViewWidget(controller: controller.webViewController),
              ),
            )
          ],
        ),
      );
    } else if (day == 3) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildList([
              'آپ نے پچھلے پیغام کی ویڈیو میں دیکھا کہ ماں کا دودھ بچے کو پیدائش کے ایک گھنٹے میں پلانا شروع کرنا چاہیے۔',
              'تو چلیں، آج ہم سیکھتے ہیں کہ بچے کو ماں کا دودھ  کیسے پلانا چاہیے ۔ یہ ویڈیو آپ کو بچے کو دودھ پلانے میں بےحد مددگار ہوگی، تو دیکھنا مت بھولیے گا!'
            ]),
            const SizedBox(height: 20),
            Container(
              height: 220,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: WebViewWidget(
                  controller: controller.webViewController,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (day == 5) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildList([
              'آپ نے پچھلے پیغام کی ویڈیو میں دیکھا کہ بچے کی پیدائش کے بعد ماں کا پہلا دودھ (کولسٹرم )بچے کیلئے مکمل غذا ہے ۔',
              'مگر کولسٹرم کو پلانے کے لیے ضروری ہے کہ آپ کا بچہ چھاتی کے ساتھ صحیح طریقے سے جڑا (attach)ہوا ہو۔',
              'تو چلیں آج ہم سیکھتے ہیں بچے کو چھاتی سے کیسے صحیح منسلک کرتے ہیں۔ اس ویڈیو کو بار بار دیکھیں تاکہ آپ بچے کو صحیح پوزیشن میں اپنی چھاتی کے ساتھ جوڑ سکیں۔'
            ]),
            const SizedBox(height: 20),
            const Text(
              "یاد رکھیں :",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            _buildList([
              'اس کی پریکٹس اور کوشش جاری رکھیں۔ یہ انتہائی ضروری ہے ورنہ نہ صرف آپ کی نپل زخمی ہو سکتی ہے بلکہ بچہ بھی ناکافی دودھ پیے گا اور بھوکا رہ جائے گا۔امید ہے کہ آپ جلد سیکھ لیں  گی۔',
            ]),
            const SizedBox(height: 20),
            Container(
              height: 220,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: WebViewWidget(
                  controller: controller.webViewController,
                ),
              ),
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

  Widget _buildList(List<String> items) {
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
                              text: '\u25CF ',
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
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
