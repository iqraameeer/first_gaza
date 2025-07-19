import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

class PregWeek36DetailScreen extends StatelessWidget {
  // final int selectedWeek;
  final int selectedDay;

  PregWeek36DetailScreen({
    Key? key,
    // required this.selectedWeek,
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
                                ? "خواتین میں  نارمل لیبر کے آغاز کی علامات"
                                : selectedDay == 3
                                    ? "لیبر کے دوران خطرے کی علامات"
                                    : selectedDay == 5
                                        ? "لیبر کے دوران کیا توقع کریں"
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
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "اس ہفتے ہم آپ سے بچہ دانی کے کھلنے کا عمل، جسے \"لیبر\" کہتے ہیں، کے بارے میں بات کریں گے۔ حمل کے آخری دنوں میں لیبر کی نشانیاں کا خیال رکھنا بہت اہم ہے۔",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
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
            const Text(
              "لیبر کی علامات پہچانیں:",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            _buildList([
              'جب آپ کو کمر کے نچلے حصے میں مسلسل درد یا پیٹ میں سختی محسوس ہو اور درد وقفے وقفے سے بڑھ رہا ہو، تو یہ لیبر کی علامات ہو سکتی ہیں۔ ایسی صورت میں ہسپتال یا اپنے ڈاکٹر سے رابطہ کریں ۔'
            ]),
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
              "اگر آپ کو کسی بھی قسم کی مندرجہ ذیل غیر معمولی علامات محسوس تو فوراً ہسپتال یا اپنے ڈاکٹر سے رابطہ کریں۔",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 10,
            ),
            _buildList([
              'شدید ،مستقل اور ناقابل برداشت  درد',
              'زیادہ خون بہنے کا بہنا۔',
              'بچے کی حرکت میں کمی محسوس کریں۔ ',
              'بچہ دانی سے پانی کا نکلنا ۔'
            ])
          ],
        ),
      );
    } else if (day == 5) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildList([
              'لیبر کے دوران آپ کو رحم(uterus) کے سکڑنے (contractions) کی وجہ سے درد ہوگا۔',
              'سکڑاؤ کے  درمیانی  وقفے کے دوران آرام کرنے کی کوشش کریں۔',
              'لیبر کے دوران آرام دہ رہنے کے لیے گہری سانس لینے کی مشق کریں۔ '
            ])
          ],
        ),
      );
    }
    // Default widget if no matching day or week is found
    else {
      return const Center(
        child: Text(
          'No content available',
          style: TextStyle(fontSize: 18, color: Colors.red),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  // Numbered list item widget
  Widget numberPoint(int number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Align text and number apart
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
          ),
          Text(
            '$number- ', // Number at the right
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'JameelNoori'),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }

  final List<String> colostrumBenefits = [
    'پہلے دودھ میں قبض کشا اثرات ہوتے ہیں۔ جس سے بچے کا کالا پاخانہ صاف ہو جاتا ہے اور پیدائش کے بعد بچے کی کمزور آنت کو بہتر ہونے میں بھی مدد ملتی ہے۔',
    'بچے کو پیلیا (یرقان) سے بچاتا ہے۔',
    'پہلے دودھ میں بچے کیلئے الرجی اور انفکشن سے بچاؤ کا بہترین علاج ہے۔',
    'بچے میں قوت مدافعت پیدا کرتا ہے۔',
    'اس سے بچے کی صحت مند نشو و نما ہوتی ہے۔',
    'پہلے دودھ میں شامل وٹامن اے کی زیادہ مقدار کی وجہ سے بیماری کی شدت کم ہوتی ہے۔',
  ];

  final List<Map<String, String>> mythAboutColostrum = [
    {
      'wrong':
          '1- پہلا دودھ بچے کیلئے ناکافی ہوتا ہے کیونکہ یہ مقدار میں کم ہوتا ہے۔ اس لیے بچہ بھوکا رہتا ہے اور روتا ہے۔',
      'correct':
          '1- بچے کیلئے چھاتیوں میں موجود دودھ کی مقدار اس کی ضرورت کے عین مطابق ہو تی ہے اور بچے کے رونے کی دوسری وجوہات ہو سکتی ہیں۔',
    },
    {
      'wrong':
          '2- پہلا دودھ گاڑھا اور پیلا ہوتا ہے اس لیے عام لوگوں کے خیال میں زہریلا ہو تا ہے اور بچے کو پلانے کی بجائے اس کو ضائع کر دینا چاہیے اور پہلے تین دن تک ماں کے دودھ کے بجائے اوپر کا دودھ دینا چاہیئے.',
      'correct':
          '2- کولسٹرم دودھ گاڑھا اور زردی مائل ہوتا ہے کیونکہ اس میں ماں سے بچے کو ملنے والا مدافتی اجزء شامل ہو تے ہیں جو بچے کو بیماری سے بچاتے ہیں۔',
    },
    {
      'wrong': '3- ڈبے کا دودھ بچے کو زیادہ مضبوط اور توانا بناتا ہے۔',
      'correct':
          '3- ڈبے کا دودھ ماں کے دودھ کی طرح نہیں ہوتا ڈبے کے دودھ میں کئی اہم اجزء موجود نہیں ہوتے جو ماں کے دودھ میں موجود ہوتے ہیں۔',
    },
  ];
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

                    /*  Expanded(
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'JameelNoori'),
                          textDirection: TextDirection.rtl,
                        )),
                    const SizedBox(width: 8),
                    const Icon(Icons.brightness_1, size: 8),*/
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
