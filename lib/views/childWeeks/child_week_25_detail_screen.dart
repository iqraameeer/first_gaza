import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';
import 'package:pehli_gaza_app/widget/text_bullet_widget.dart';

class ChildWeek25DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  ChildWeek25DetailScreen({
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
                                ? "مبارک ہو، آپ کا بچہ 6 ماہ کے سنگ میل (milestone) کو پہنچ گیا ہے! بچے کی اضافی غذا کا آغاز"
                                : selectedDay == 3
                                    ? "بچے  کی  اضافی غذا"
                                    : selectedDay == 5
                                        ? " چھٹے ماہ کی ویکسینیشن کے بارے میں یاد دہانی !"
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

  // Function to build content based on selected week and day
  Widget _buildContentForSelectedDay(int day) {
    if (day == 1) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "مبارک ہو!   آپ کا بچہ اب چھے ماہ مکمل کر کے ساتویں مہینے میں داخل ہو چکا ہے۔ اب صرف ماں کا دودھ بچے کی اضافی توانائی، پروٹین، آئرن، زنک، اور وٹامنز کی ضروریات کو مکمل نہیں کرسکتا۔ اس لئے ضروری ہے کہ آپ بچے کو ماں کے دودھ کے ساتھ اضافی نیم ٹھوس غذاؤں کا  آغاز کریں ۔",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "کرنے والے کام (Do’s):",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            _buildTickmarkList([
              "بچے کو اپنا دودھ پلانا جاری رکھیں اور ماں اپنا دودھ بچے کو کم از کم دو سال کی عمر تک پلائیں۔",
              "بچے کو ماں کے دودھ کے ساتھ دن میں دو بار اضافی غذا کھانے کو دیں۔",
              "اضافی غذا کو تھوڑی مقدار میں دیں مثلاً ایک سے دو چمچ سے شروع کریں۔",
              "بچے کو آہستہ آہستہ کھلائیں۔",
              "بچے کو ایک وقت میں تھوڑی غذا دیں کیونکہ بچے کا معدہ بہت چھوٹا ہوتا ہے۔",
              "کھانے کی مقدار کو بتدریج بڑھائیں۔",
              "مقدار میں اضافہ بچے کی بھوک کے مطابق کریں۔",
              "اضافی غذا کا آغاز نرم، نیم ٹھوس، puree، بلینڈ یا میش کھانے سے کریں جیسے کہ:"
            ]),
            const BulletList(items: [
              'کھچڑی ، چاول کو نرم پکا کر بلینڈ کر کے دیں ۔ ',
              'مسلے ہوئے کیلےمیں تھوڑا ماں کا دودھ ملا کر دیں ۔',
              'کوئی بھی سبزی، بھاپ میں پکا کر بلینڈ یا میش کر کے دیں جیسے کہ سبزیاں (مسلی ہوئی گاجر، آلو، کدو) اور پھل (مسلا ہوا کیلا، سیب کی پیوری) ۔',
            ]),
            const TickmarkList(items: [
              "کھانے تیار کرنے سے پہلے اپنے ہاتھ اچھی طرح دھوئیں۔",
              "برتنوں اور چمچوں کو صاف ستھرا رکھیں تاکہ جراثیم سے بچاؤ ہو۔",
              "بچے کو گھر میں روزانہ تازہ تیار کردہ کھانا کھلائیں۔",
              "کھانا اس طریقے سے پکائیں کہ پکنے کے بعد اس کی غذائیت محفوظ رہے، مثلاً سبزیاں ابالنے کے بجائے بھاپ میں پکائیں۔",
              "ہمیشہ ابلا ہوا صاف پانی استعمال کریں۔",
              "بچے کو ہمیشہ پینے کے لیے ابلا ہوا صاف پانی دیں۔",
              "بچے کو کھانا کھلانے سے پہلے اور نیپی بدلنے کے بعد ہاتھ دھوئیں۔",
              "بچے کو بھی کھانے سے پہلے اور بعد میں ہاتھ دھونے کی عادت ڈالیں۔",
              "بچے کو کھانا کھلانے سے پہلے اس بات کو یقینی بنائیں کہ بچہ آرام دہ حالت میں بیٹھا ہو۔",
              "بچے کو کھانا کھلانے کے دوران صبر اور سکون سے کام لیں۔"
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
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "مندرجہ ذیل کاموں سے گریز کریں",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "نہیں کرنے والے کام(Don'ts):",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            _buildWrongmarkList([
              " بچے کا کھانا بغیر ہاتھ دھوئے نہ بنائیں۔",
              " بچے کے کھانے میں نمک، چینی، مصالحہ استعمال نہ کریں، کیونکہ یہ بچے کیلئے بلڈ پریشر، ذیابیطس اور معدے کی بیماری کا سبب بن سکتے ہیں۔",
              " نیم پکا یا کچا کھانا نہ دیں۔ ہمیشہ مکمل طور پر پکا ہوا کھانا دیں تاکہ انفیکشن سے بچا جا سکے۔",
              " بچے کو کچا انڈا اور شہد نہ دیں، کیونکہ ان کے استعمال سے بچے کو پیٹ کی بیماری ہونے کا خدشہ ہوتا ہے۔",
              " ٹافی، چاکلیٹ اور میٹھے بسکٹ بالکل نہ دیں، کیونکہ یہ بچے کے دانت اور بھوک کو خراب کرتے ہیں اور ذیابیطس کی بیماری کا سبب بن سکتے ہیں۔",
              " انگور، خشک میوے، یا سخت کھانے کی اشیاء نہ دیں کیونکہ یہ سانس کی نالی میں پھنس سکتی ہے۔",
              " بازاری، پراسیسڈ اور ڈبے کے کھانے ہرگز نہ دیں۔",
              " بچے کو مختلف قسم کی غذائیں ملا کر نہ کھلائیں، مثلاً ایک وقت میں ایک پھل کھانے کو دیں۔",
              " تلی ہوئی غذا نہ دیں۔ یہ ان کے معدے کے لئے مضر ہو سکتی ہے۔",
              " ڈبے کا فروٹ جوس نہ دیں بلکہ ہمیشہ ابلا ہوا صاف پانی دیں۔",
              " اگر بچے کی نیپی گندی ہے تو پہلے اسے صاف کریں پھر کھانا یا اپنا دودھ پلائیں۔",
              " کھانے کے دوران بچے کو زیادہ پانی نہ پلائیں۔",
              " کھانا کھلانے میں جلدی نہیں کریں۔",
              " کھانے کے دوران موبائل فون نہ دیں۔",
            ]),
          ],
        ),
      );
    } else if (day == 5) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "امید کرتے ہیں کہ آج کا دن آپ کے بچے کے لیے خوبصورت ہو۔ آپ کے ننھے منے  بچے کا اگلا حفاظتی  ٹیکہ چھ ماہ کی عمر میں  لگتا ہے۔ آپ بچے کو اپنا دودھ ویکسینیشن سے 30 منٹ پہلے یا بعد میں پلا سکتی ہیں۔  ویکسینیشن کے بعد کوشش کریں کہ اپنا دودھ زیادہ بار پلائیں۔ اس سے بچے کو سکون ملے گا، پانی کی کمی نہیں ہوگی، اور بچے کی قوتِ مدافعت بہتر ہوگی۔",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "یاد رکھیں!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            _buildLists([
              "بچے کی صحت کے لیے حفاظتی ٹیکوں کا کورس مکمل کرنا بہت ضروری ہے۔",
              "ویکسین کے بعد کچھ بچوں کو ہلکا بخار، چڑچڑاپن، یا انجکشن کی جگہ پر سوجن ہو سکتی ہے، جو عام بات ہے۔",
              "چھٹے ماہ کا ویکسین بچے کو فلو جیسی سانس کی بیماری سے بچاتا ہے۔",
              "اپنے بچے کو حفاظتی ٹیکوں کے شیڈول کی مقررہ تاریخ پر اپنے ہسپتال کے ویکسینیشن سینٹر لے کر آئیں۔",
              "ویکسینیشن والے دن آپ کے بچے کے وزن اور قد کی پیمائش بھی کی جاتی ہے تاکہ معلوم ہو سکے کہ آپ کا بچہ اپنی عمر کے مطابق بڑھ رہا ہے۔ اس لیے بہت ضروری ہے کہ آپ بچے کو ویکسینیشن سینٹر میں لے کر آئیں۔",
              "اگر کسی مصروفیت کی وجہ سے آپ مقررہ تاریخ پر نہیں آ سکتے تو ہمیں ضرور مطلع کریں۔",
              "ہم آپ کو جلد از جلد آپ کی سہولت کے مطابق نئی اپوائنٹمنٹ کی تاریخ دے دیں گے۔",
              "یاد رہے کہ ہم آپ کی مدد اور رہنمائی کے لیے ہر مقررہ تاریخ پر ویکسینیشن سینٹر میں موجود ہیں جہاں ہم آپ کے سوالات کا تسلی بخش جواب دیں گے۔",
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

  Widget _buildTickmarkList(List<String> items) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: items.map((item) {
          // Split at first colon to separate the keyword from the rest of the text
          List<String> parts = item.split(':');
          String keyword = parts.first; // First part (keyword)
          String remainingText =
              parts.length > 1 ? parts.sublist(1).join(':') : '';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, // Ensures RTL alignment
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$keyword ', // Highlighted keyword
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'JameelNoori',
                          ),
                        ),
                        TextSpan(
                          text: remainingText, // Remaining text
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
                const Icon(Icons.check,
                    size: 20, color: Colors.black), // Tickmark
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildWrongmarkList(List<String> items) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: items.map((item) {
          // Split at first colon to separate the keyword from the rest of the text
          List<String> parts = item.split(':');
          String keyword = parts.first; // First part (keyword)
          String remainingText =
              parts.length > 1 ? parts.sublist(1).join(':') : '';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, // Ensures RTL alignment
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$keyword ', // Highlighted keyword
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'JameelNoori',
                          ),
                        ),
                        TextSpan(
                          text: remainingText, // Remaining text
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
                const Icon(Icons.close,
                    size: 20, color: Colors.red), // Tickmark
              ],
            ),
          );
        }).toList(),
      ),
    );
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
}
