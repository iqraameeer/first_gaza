import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'preg_35_detail_controller.dart';

class PregWeek35DetailScreen extends StatelessWidget {
  final int selectedDay;

  const PregWeek35DetailScreen({
    Key? key,
    required this.selectedDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PregWeek35Controller controller = Get.put(PregWeek35Controller());

    return Scaffold(
      body: Stack(
        children: [
          const RadialBackground(),
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
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
                                  ? "مبارک ہو، انشاءاللہ آپ بہت جلد ماں بننے والی ہیں!🎉"
                                  : selectedDay == 3
                                      ? "متوازن غذا کی اہمیت"
                                      : selectedDay == 5
                                          ? "حمل کے دوران اچھی متوازن غذا کیا ہے؟"
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

  Widget _buildContentForSelectedDay(int day, PregWeek35Controller controller) {
    if (day == 1) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "آپ کی زندگی  کا  ایک نیا اور خوبصورت باب شروع ہو رہا ہے ۔ آپ کی رہنمائی  کے لئے  ہم اس سفر میں  آپ کے ساتھ ہیں تاکہ آپ اپنی اور آنے والے ننھے مہمان کی صحت کا بہترین خیال رکھ سکیں۔ ہمیں یقین ہے اس سفر میں آپ کو ضرور کچھ نیا سیکھنے کا موقع ملے گا۔ تو چلیں، اس ہفتے ہم متوازن غذا  کے بارے میں بات  کرتے ہیں۔",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 20),
            const Text(
              "متوازن غذا کا تعارف:",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 20),
            _buildList([
              'حمل کے دوران متوازن غذا  آپ کے بچے کی صحیح نشو نما میں ایک اہم کردار اد ا کرتی ہے ۔',
              'متوازن غذا سے مراد وہ غذا ہے جس میں خوراک کے تمام اجزاء  کاربوہائیڈریٹس ، پروٹینز ، چکنائی،  معدنیات ، وٹامنز اتنی مقدار میں شامل ہوں کہ وہ ماں کےجسم کی ضروریات پوری کر سکیں ۔',
            ]),
            _buildTickmarkList([
              'کاربوہائیڈریٹس: چاول، گندم، روٹی۔',
              'پروٹین: گوشت، مچھلی، انڈے، دالیں۔',
              'چکنائی: مکھن، تیل، خشک میوہ جات جیسے بادام، اخروٹ، پستہ، کاجو',
              'وٹامنز اور منرلز: پھل اور سبزیاں۔',
              ' پانی: جسم کی ہائیڈریشن کے لئے'
            ]),
            const SizedBox(height: 20),
            const Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            _buildList([
              'آپ کی رہنمائی اور معلومات کے لئے ہم آپ سے ایک مختصر ویڈیو شیئر کر رہے ہیں، اسے ضرور دیکھیں تاکہ آپ اپنی خوراک کو بہتر بنا سکتے ہیں ۔ ',
              'تو چلئیے پھرہم آپ سے اگلے پیغام میں ملتے ہیں۔ تب تک اپنا بہت خیال رکھیں۔',
            ]),
            const SizedBox(height: 20),
            Obx(() => _buildVideoWidget(controller)),
          ],
        ),
      );
    } else if (day == 3) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "ہم امید کرتے ہیں کہ آپ باقاعدگی سے ڈاکٹر کے پاس معائنے کے لئے جا رہی ہیں اور اپنی خوراک کا خاص خیال رکھ رہی ہیں کیونکہ آپ کا  بچہ اپنی غذا ماں کے جسم سے حاصل کرتا ہے۔ ",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/matwazan_gaza.png',
              fit: BoxFit.cover,
            ),
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
              'وہ مائیں جو حمل کے دوران مناسب غذائیں نہیں لیتی وہ عموماً وقت سے پہلے  اور  کم وزن والے بچے کو جنم دیتی ہیں۔',
            ]),
            Image.asset(
              'assets/images/four.png',
              fit: BoxFit.cover,
            ),
            _buildList([
              'پچھلے پیغام کی ویڈیو میں متوازن غذا کے بارے میں معلومات  دی گئی تھی۔آئیے آج اس  نئی ویڈیو میں ہم یہ جانتے ہیں کہ ماؤں کے لیے  حمل کے دوران اچھی خوراک کھانا کیوں ضروری ہے۔',
            ]),
            const SizedBox(height: 20),
            Obx(() => _buildVideoWidget(controller)),
          ],
        ),
      );
    } else if (day == 5) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "ہمیں یہ سمجھنا چاہیے کہ متوازن غذا کی صحیح مقدار ہمارے جسم کی صحت اور نشونما کے لئے بہت ضروری ہے۔جیسے آپ نے پچھلے پیغام کی ویڈیو میں دیکھا کہ حمل کے دوران ماؤں کے لیے اچھی خوراک کھانا بہت ضروری ہے اس لیے آج ہم آپ کو حمل کے دوران  مختلف غذائی اجزاء کے بارے میں بتائیں گے۔",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),
            _buildList([
              'حاملہ خاتون اگر روٹی گھی کیساتھ کھاتی ہے تو ایسی خوراک کو ایک ستارہ  *دیا جاتا ہے '
            ]),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/one.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            _buildTickmarkList([
              'یہ صرف  صحیح خوراک ہے کیونکہ فوڈ گروپس کاربوہائیڈریٹس اور چکنائی سے صرف ایک غذائی جزو کا استعمال کیا گیا  ہے جو جسم کی مکمل غذائی ضروریات کو پورا نہیں کرتا۔ '
            ]),
            _buildList([
              'حاملہ خاتون  اگر  روٹی  گھی کے ساتھ تیل ، دالیں، ہری سبزیاں یا پھل وغیرہ کھا رہی ہے تو ایسی خوراک کو دو ستارے  **دئیے جاتے ہیں ۔ '
            ]),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/two.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            _buildTickmarkList([
              'یہ بہتر غذا ہے کیونکہ  کاربوہائیڈریٹس اور چکنائی  کے ساتھ  مختلف فوڈ گروپس جیسے پروٹین، وٹامنز، اور منرلز سے مختلف غذائی اجزاء کا بھی استعمال کیا گیا ہے۔'
            ]),
            _buildList([
              'حاملہ خاتون اگر روٹی، گھی، تیل، دالیں، ہری سبزیاں، پھل اور گوشت کھاتی ہے تو ایسی خوراک کو تین ستارے *** دئیے جاتے ہیں۔'
            ]),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/three.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            _buildTickmarkList([
              'یہ سب سے بہترین ، مناسب اور  متوازن غذا ہے کیونکہ اس غذا میں کاربوہائیڈریٹس، چکنائی ، پروٹین، وٹامنز، اور منرلز  کے ساتھ  پروٹین کا ایک اہم ذریعہ یعنی گوشت کا  استعمال بھی موجود ہے۔ ',
              'حاملہ اور دودھ پلانے والی خاتون کو تین ستاروں والی خوراک لینی چاہیے۔'
            ]),
            const SizedBox(height: 20),
            Obx(() => _buildVideoWidget(controller)),
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

  Widget _buildVideoWidget(PregWeek35Controller controller) {
    return Container(
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
        child: Stack(
          children: [
            if (controller.isLoading.value)
              const Center(child: CircularProgressIndicator())
            else if (controller.hasError.value)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'ویڈیو لوڈ کرنے میں ناکامی۔ براہ کرم دوبارہ کوشش کریں۔',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontFamily: 'JameelNoori',
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // controller. _loadVideo(controller.selectedDay);
                      },
                      child: const Text(
                        'دوبارہ لوڈ کریں',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'JameelNoori',
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsConstant.btnlogin,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                    ),
                  ],
                ),
              )
            else
              WebViewWidget(controller: controller.webViewController),
            if (!controller.isLoading.value && !controller.hasError.value)
              Positioned.fill(
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.play_arrow,
                        size: 50, color: Colors.white),
                    onPressed: () {
                      controller.webViewController.runJavaScript(
                        "document.querySelector('video').play().catch(e => console.log('Play error: ' + e));",
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
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
                    )
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildTickmarkList(List<String> items) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: items.map((item) {
          List<String> parts = item.split(':');
          String keyword = parts.first;
          String remainingText =
              parts.length > 1 ? parts.sublist(1).join(':') : '';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$keyword ',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff196B24),
                            fontFamily: 'JameelNoori',
                          ),
                        ),
                        TextSpan(
                          text: remainingText,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'JameelNoori',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.check, size: 20, color: Color(0xff196B24)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
